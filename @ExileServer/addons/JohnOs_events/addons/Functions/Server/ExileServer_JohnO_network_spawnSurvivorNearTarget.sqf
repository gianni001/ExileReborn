private ["_target","_positions","_firstPos","_spawnPosition","_unit","_group","_money","_gear","_weapon","_uniform","_vest","_backPack","_item","_headGear","_magazines","_found"];

_target = (_this select 0) call ExileServer_system_session_getPlayerObject;
_positions = (_this select 1 select 0);
/*
if (isNull _positions) then
{
	_positions = [] call JohnO_fnc_findSafeTownPosition;
};	
*/
_spawnPosition = selectRandom _positions;

format["ExileReborn - Spawned a survivor near player -- %1 @ %2", _target,_spawnPosition] call ExileServer_util_log;

_group = createGroup resistance;
_group setCombatMode "RED";

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
_uniform = _gear select 2;
_vest = _gear select 3;
_backPack = _gear select 4;
_item = _gear select 5;
_headGear = _gear select 6;

_magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");

_unit forceAddUniform "Exile_Uniform_BambiOverall";
if (random 1 > 0.5) then
{
	_unit addBackpack _backPack;
};
_unit addVest _vest;
if (random 1 > 0.7) then
{	
	[_unit,_weapon, 5] call BIS_fnc_addWeapon;
};	
_unit addItem _item;
_unit addHeadgear _headGear;

Event_ALLAI_SimulatedUnits pushBack _unit;
_unit setVariable ["ExileMoney",_money,true];
_unit setVariable ["ExileReborn_survivor_isFollowing",-1,true];
_unit setVariable ["ExileReborn_survivor_hasWaypoint",-1,true];
_unit setVariable ["ExileReborn_survivor_chance",30,true];
_unit setVariable ["ExileReborn_survivor",true,true];

_currentWeapon = primaryWeapon _unit;
if !(_currentWeapon isEqualTo "") then
{
	_unit setVariable ["ExileReborn_survivor_isBambi",1,true];
};	

_unit addMPEventHandler
["MPKilled",
	{

		private ["_killer","_currentRespect","_amountEarned","_newRespect","_killSummary"];

		_killed = _this select 0;
		_killer = _this select 1;

		_killingPlayer = _killer call ExileServer_util_getFragKiller;

		Event_ALLAI_SimulatedUnits = Event_ALLAI_SimulatedUnits - [_killed];

		if ((_killed getVariable ["ExileReborn_survivor_switchHostile",-1]) isEqualTo 2) then
		{ 
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
		else
		{	
			if ((_killed getVariable ["ExileReborn_survivor_isBambi",-1]) isEqualTo -1) then
			{
				_currentRespect = _killingPlayer getVariable ["ExileScore", 0];

				_amountEarned = round ((abs _currentRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "bambiKill")));
				_newRespect = _currentRespect - _amountEarned;

				_killingPlayer setVariable ["ExileScore", _newRespect];
				_killSummary = [];
				_killSummary pushBack ["SURVIVOR KILLED", -1 * _amountEarned];
				[_killingPlayer, "showFragRequest", [_killSummary]] call ExileServer_system_network_send_to;

				format["setAccountScore:%1:%2", _newRespect, getPlayerUID _killingPlayer] call ExileServer_system_database_query_fireAndForget;
				_killingPlayer call ExileServer_object_player_sendStatsUpdate;
			}
			else
			{
				_currentRespect = _killingPlayer getVariable ["ExileScore", 0];
				_amountEarned = 25;
				_newRespect = _currentRespect + 25;

				_killingPlayer setVariable ["ExileScore", _newRespect];
				_killSummary = [];
				_killSummary pushBack ["BANDIT FRAGGED", _amountEarned];
				[_killingPlayer, "showFragRequest", [_killSummary]] call ExileServer_system_network_send_to;

				format["setAccountScore:%1:%2", _newRespect, getPlayerUID _killingPlayer] call ExileServer_system_database_query_fireAndForget;
				_killingPlayer call ExileServer_object_player_sendStatsUpdate;
			};	
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

[_group] spawn JohnO_fnc_survivorAIBrain;

_group setBehaviour "AWARE";
_group setSpeedMode "FULL";