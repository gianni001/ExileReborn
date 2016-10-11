/************************* ROAMING AI BASED OFF PLAYER COUNT ********************************/

private ["_target","_position","_debug","_safePosFound","_aiSpawnPos","_group","_unit"];

//_target = (_this select 1) select 0;
_target = (_this select 0) call ExileServer_system_session_getPlayerObject;

if (isNull _target) exitWith 
{
	"Head hunter target isNull exiting script" call ExileServer_util_log;
};
		
_position = getPos _target;
_debug = Event_DEBUG_Location;

if (_position distance _debug > 600) exitWith {};

format["Player was detected by bandits during hack -- %1", _target] call ExileServer_util_log;

if !(surfaceIsWater _position) then // Check the player is not in water
{	
	_safePosFound = false;
	
	waitUntil 
	{
		_aiSpawnPos = [_position,1000] call ExileClient_util_math_getRandomPositionInCircle;

		if (!(surfaceIsWater _aiSpawnPos) && (_aiSpawnPos distance _target > 400)) then
		{
			_safePosFound = true;
		};	
		_safePosFound
	};

	if (!([_aiSpawnPos, 800] call ExileClient_util_world_isTraderZoneInRange)) then
	{		
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

			_magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");							

			_unit forceAddUniform _uniform;
			_unit addBackpack _backPack;
			_unit addVest _vest;
			[_unit,_weapon, 5] call BIS_fnc_addWeapon;
			_unit addItem _item;

			_unit setVariable ["JohnO_RoaminAI",time + Event_RoamingAI_despawnTime];
			_unit setVariable ["ExileMoney",_money,true];
			Event_ALLAI_SimulatedUnits pushBack _unit;
			
			_unit addMPEventHandler 
			["MPKilled",
				{

					private ["_killer","_currentRespect","_amountEarned","_newRespect","_killSummary"];

					_killed = _this select 0;
					_killer = _this select 1;

					//[_killed] joinSilent Event_RadAI_deadGroup;

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
		};

		[_group,_target] spawn JohnO_fnc_headHunters;
	};
};		
