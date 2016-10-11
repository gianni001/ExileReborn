/************************* ROAMING AI BASED OFF PLAYER COUNT ********************************/

private ["_target","_foundTarget","_position","_debug","_aiSpawnPos","_safePosFound","_group","_unit","_money","_gear","_killSummary","_killer","_killed","_killingPlayer","_playerCount","_adjustment","_currentAIcount"];

_currentAIcount = [] call JohnO_fnc_countAIUnits;

if (count AllPlayers > 0) then
{
	if (count AllPlayers <= Event_HeadHunterAI_playerLimit) then
	{	
		if (_currentAIcount < Event_RoamingAI_MaxAllowedAI) then
		{	
			_target = selectRandom allPlayers;

			if (Event_RoamingAI_DebugEvent) then
			{
				hint str _target;
			};	

			if (count allPlayers > 1) then
			{	

				if (_target isEqualTo Event_RoamingAI_lastTarget) then
				{
					if (Event_RoamingAI_DebugEvent) then
					{
						hint "Target player is equal to last target player";
					};
						
					_foundTarget = false;
					waitUntil 
					{
						_target = selectRandom allPlayers;
						
						if !(_target isEqualTo Event_RoamingAI_lastTarget) then
						{
							_foundTarget = true;
						};	
						_foundTarget
					};
				};
			};		

			_position = getPos _target;
			_debug = Event_DEBUG_Location;
			
			format ["Found valid player (%1) - Spawning AI to hunt target", _target] call ExileServer_util_log;

			if (!(surfaceIsWater _position) && (_position distance _debug > 600)) then // Check the player is not in water
			{	
				_safePosFound = false;
				
				waitUntil 
				{
					_aiSpawnPos = [_position,1000] call ExileClient_util_math_getRandomPositionInCircle;

					if (!(surfaceIsWater _aiSpawnPos) && (_aiSpawnPos distance _target > 400) && (_aiSpawnPos distance _debug > 300)) then
					{
						_safePosFound = true;
					};	
					_safePosFound
				};

				if (!([_aiSpawnPos, 800] call ExileClient_util_world_isTraderZoneInRange) && (_aiSpawnPos distance _debug > 800)) then
				{		
					Event_RoamingAI_lastTarget = _target;

					_group = createGroup EAST;
					_group setCombatMode "RED";

					for "_i" from 1 to Event_HeadHunterAI_GroupAmountMin + floor (random Event_HeadHunterAI_GroupAmountMax) do
					{	

						_money = Event_RoamingAI_MoneyMin + floor (random Event_RoamingAI_MoneyMax);

						_unit = _group createUnit ["O_G_Soldier_F",_aiSpawnPos,[],0,"NONE"];
						_unit allowFleeing 0;
						[_unit] joinSilent _group;
						if (Event_RoamingAI_DebugEvent) then
						{	
							_marker = createMarker [ format["RoamingAI%1", diag_tickTime],_aiSpawnPos];
							_marker setMarkerType Event_HeliCrash_MarkerType;
							_marker setMarkerText "AI SPAWN";
						};	
						_unit setskill ["aimingAccuracy",0.15];
						_unit setskill ["aimingShake",0.05];
						_unit setskill ["aimingSpeed",0.05];
						//_unit setskill ["endurance",0.50];
						_unit setskill ["spotDistance",0.50];
						_unit setskill ["spotTime",0.25];
						_unit setskill ["courage",0.50];
						_unit setskill ["reloadSpeed",0.20];
						_unit setskill ["commanding",0.50];
						//_unit setskill ["general",0.05];

						removeUniform _unit;
						removeVest _unit;
						removeGoggles _unit;
						removeBackpack _unit;
						removeAllWeapons _unit;
						removeHeadgear _unit;	

						_gear = [] call JohnO_fnc_AIgear;

						_weapon = _gear select 0;																				
						//_attachment = _gear select 1;																			
						_uniform = _gear select 2;
						_vest = _gear select 3;
						_backPack = _gear select 4;
						_item = _gear select 5;
						_headGear = _gear select 6;

						_magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");							

						_unit forceAddUniform _uniform;
						_unit addBackpack _backPack;
						_unit addVest _vest;
						[_unit,_weapon, 5] call BIS_fnc_addWeapon;
						_unit addItem _item;
						if (random 1 > 0.6) then
						{	
							_unit addHeadgear _headGear;
						};	

						_unit setVariable ["JohnO_RoaminAI",time + Event_RoamingAI_despawnTime];
						_unit setVariable ["ExileMoney",_money,true];
						Event_ALLAI_SimulatedUnits pushBack _unit;
						
						_unit addMPEventHandler 
						["MPKilled",
							{

								private ["_killer","_currentRespect","_amountEarned","_newRespect","_killSummary"];

								_killed = _this select 0;
								_killer = _this select 1;

								_killingPlayer = _killer call ExileServer_util_getFragKiller;

								Event_ALLAI_SimulatedUnits = Event_ALLAI_SimulatedUnits - [_killed]; //Remove unit from global array?

								_currentRespect = _killingPlayer getVariable ["ExileScore", 0];
								_amountEarned = 50;
								_newRespect = _currentRespect + 50;

								_killingPlayer setVariable ["ExileScore", _newRespect];
								_killSummary = [];
								_killSummary pushBack ["BANDIT FRAGGED", _amountEarned];
								[_killingPlayer, "showFragRequest", [_killSummary]] call ExileServer_system_network_send_to;

								format["setAccountScore:%1:%2", _newRespect, getPlayerUID _killingPlayer] call ExileServer_system_database_query_fireAndForget;
								_killingPlayer call ExileServer_object_player_sendStatsUpdate;

								if (Event_RoamingAI_DebugEvent) then
								{
									hint str Event_Roaming_CurrentAlive;
								};	
							}
						];

						_unit addEventHandler ["HandleDamage",
						{
							_dmg = _this select 2;
							_source = _this select 3;
							_projectile = _this select 4;

							if ((_projectile isEqualTo "") && {isPlayer _source}) then
							{
								_dmg = 0;
							};

							_dmg
						}];

					};

					[_group,_target] spawn JohnO_fnc_headHunters;
				};
			};		
		};		
	};
};

/** Adjust the spawn timer of headhunters by 15 seconds per player online **/

_playerCount = count AllPlayers;

_adjustment = _playerCount * 15;

Event_HeadHunterAI_Interval_Actual = Event_HeadHunterAI_Interval_Base - _adjustment;

format ["Head hunter interval adjusted to : %1",Event_HeadHunterAI_Interval_Actual] call ExileServer_util_log;