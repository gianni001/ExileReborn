/*


[_spawnPosition,_groupAmount,_unitsPerGroupMin,_unitsPerGroupMax,50,true,true,360] call JohnO_fnc_spawnAIGroup;


*/

private ["_spawnPosition","_groupAmount","_unitsPerGroupMin","_unitsPerGroupMax","_roamingRadius","_group","_unit","_addToSimulationManager","_addToCleanupManager","_cleanUpTime"];

_spawnPosition = 			_this select 0;
_groupAmount = 				_this select 1;
_unitsPerGroupMin = 		_this select 2;
_unitsPerGroupMax = 		_this select 3;
_roamingRadius = 			_this select 4;
_addToSimulationManager = 	_this select 5;
_addToCleanupManager = 		_this select 6;
_cleanUpTime =				_this select 7;

for "_n" from 0 to _groupAmount do
{
	_group = createGroup EAST;
	_group setCombatMode "RED";

	for "_i" from 1 to _unitsPerGroupMin + floor (random _unitsPerGroupMax) do
	{	

		_money = Event_RoamingAI_MoneyMin + floor (random Event_RoamingAI_MoneyMax);

		_unit = _group createUnit ["O_G_Soldier_F",_spawnPosition,[],0,"NONE"];
		_unit allowFleeing 0;
		[_unit] joinSilent _group;
		
		_unit setskill ["aimingAccuracy",0.15];
		_unit setskill ["aimingShake",0.05];
		_unit setskill ["aimingSpeed",0.05];
		_unit setskill ["spotDistance",0.50];
		_unit setskill ["spotTime",0.25];
		_unit setskill ["courage",0.50];
		_unit setskill ["reloadSpeed",0.20];
		_unit setskill ["commanding",0.50];

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
		if (random 1 > 0.5) then
		{	
			_unit addBackpack _backPack;
		};	
		_unit addVest _vest;
		[_unit,_weapon, 5] call BIS_fnc_addWeapon;
		_unit addItem _item;
		_unit addHeadgear _headGear;

		if (_addToCleanupManager) then
		{	
			_unit setVariable ["JohnO_RoaminAI",time + _cleanUpTime];
		};	

		if (_addToSimulationManager) then
		{	
			Event_ALLAI_SimulatedUnits pushBack _unit;
		};	
		_unit setVariable ["ExileMoney",_money,true];
		
		
		_unit addMPEventHandler 
		["MPKilled",
			{

				private ["_killer","_currentRespect","_amountEarned","_newRespect","_killSummary"];

				_killed = _this select 0;
				_killer = _this select 1;

				_killingPlayer = _killer call ExileServer_util_getFragKiller;

				Event_ALLAI_SimulatedUnits = Event_ALLAI_SimulatedUnits - [_killed]; 

				_currentRespect = _killingPlayer getVariable ["ExileScore", 0];
				_amountEarned = 50;
				_newRespect = _currentRespect + 50;

				_killingPlayer setVariable ["ExileScore", _newRespect];
				_killSummary = [];
				_killSummary pushBack ["BANDIT FRAGGED", _amountEarned];
				[_killingPlayer, "showFragRequest", [_killSummary]] call ExileServer_system_network_send_to;

				format["setAccountScore:%1:%2", _newRespect, getPlayerUID _killingPlayer] call ExileServer_system_database_query_fireAndForget;
				_killingPlayer call ExileServer_object_player_sendStatsUpdate;

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

	[_group,_spawnPosition,_roamingRadius] call JohnO_fnc_taskPatrol;

	_group setBehaviour "AWARE";
	_group setSpeedMode "FULL";
};