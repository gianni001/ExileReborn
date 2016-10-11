
private ["_unit","_radUnit","_positions","_position","_randPos","_inWater","_aiSpawnPos","_foundTarget","_target","_group","_safePosFound","_debug","_currentAIcount"];

_currentAIcount = [] call JohnO_fnc_countAIUnits;

if (Event_RadAI_CurrentAlive < Event_RadAI_MaxAllowedAI) then
{	

	_positions = Event_RadAI_SpawnLocations;
	_position = selectRandom _positions;

	_group = createGroup EAST;
	_group setCombatMode "RED";

	for "_i" from 1 to Event_RadAI_GroupAmountMin + floor (random Event_RadAI_GroupAmountMax) do
	{	

		_money = Event_RoamingAI_MoneyMin + floor (random Event_RoamingAI_MoneyMax);

		_radUnit = _group createUnit ["O_G_Soldier_F",_position,[],0,"NONE"];
		_radUnit allowFleeing 0;
		[_radUnit] joinSilent _group;

		_radUnit setskill ["aimingAccuracy",0.15];
		_radUnit setskill ["aimingShake",0.05];
		_radUnit setskill ["aimingSpeed",0.05];
		_radUnit setskill ["spotDistance",0.50];
		_radUnit setskill ["spotTime",0.25];
		_radUnit setskill ["courage",0.50];
		_radUnit setskill ["reloadSpeed",0.20];
		_radUnit setskill ["commanding",0.50];

		removeUniform _radUnit;
		removeVest _radUnit;
		removeGoggles _radUnit;
		removeBackpack _radUnit;
		removeAllWeapons _radUnit;
		removeHeadgear _radUnit;	

		_gear = [] call JohnO_fnc_AIgear;

		_weapon = _gear select 0;																				
		//_attachment = _gear select 1;																			
		_uniform = _gear select 2;
		_vest = _gear select 3;
		_backPack = _gear select 4;
		_item = _gear select 5;

		_magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");							

		_radUnit forceAddUniform _uniform;
		_radUnit addBackpack _backPack;
		_radUnit addVest _vest;
		[_radUnit,_weapon, 5] call BIS_fnc_addWeapon;
		_radUnit addItem "Exile_Headgear_GasMask";
		_radUnit addItem _item;
		_radUnit assignItem "Exile_Headgear_GasMask";
		_radUnit setVariable ["ExileMoney",_money,true];
		Event_ALLAI_SimulatedUnits pushBack _radUnit;
		
		_radUnit addMPEventHandler 
		["MPKilled",
			{

				private ["_killer","_currentRespect","_amountEarned","_newRespect","_killSummary"];

				_killed = _this select 0;
				_killer = _this select 1;

				_killingPlayer = _killer call ExileServer_util_getFragKiller;

				Event_RadAI_CurrentAlive = Event_RadAI_CurrentAlive -1;
				Event_ALLAI_SimulatedUnits = Event_ALLAI_SimulatedUnits - [_killed];

				_currentRespect = _killingPlayer getVariable ["ExileScore", 0];
				_amountEarned = 100;
				_newRespect = _currentRespect + 100;

				_killingPlayer setVariable ["ExileScore", _newRespect];
				_killSummary = [];
				_killSummary pushBack ["BANDIT FRAGGED", _amountEarned];
				[_killingPlayer, "showFragRequest", [_killSummary]] call ExileServer_system_network_send_to;

				format["setAccountScore:%1:%2", _newRespect, getPlayerUID _killingPlayer] call ExileServer_system_database_query_fireAndForget;
				_killingPlayer call ExileServer_object_player_sendStatsUpdate;
			}
		];

		_radUnit addEventHandler ["HandleDamage",
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

		Event_RadAI_CurrentAlive = Event_RadAI_CurrentAlive + 1;
	};

	[_group,_position,150] call JohnO_fnc_taskPatrol;
};		



