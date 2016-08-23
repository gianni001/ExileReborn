/**
 * ExileServer_util_getFragPerks
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_victim","_killer","_killingPlayer","_perks","_lastKillAt","_killStack","_lastVictims","_victimUID","_flagNextToKiller","_flagNextToVictim","_vehicle","_vehicleRole","_distance","_distanceBonus"];
_victim = _this select 0;
_killer = _this select 1;
_killingPlayer = _this select 2;
_perks = [];
if ((currentWeapon _killingPlayer) isKindOf ["Exile_Melee_Abstract", configFile >> "CfgWeapons"]) then
{
	_perks pushBack ["Humiliation", getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "humiliation")];
};
if (isNil "ExileServerHadFirstBlood") then
{
	ExileServerHadFirstBlood = true;
	_perks pushBack ["First Blood", getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "firstBlood")];
};
_lastKillAt = _killingPlayer getVariable ["ExileLastKillAt", 0];
_killStack = _killingPlayer getVariable ["ExileKillStack", 0];
_killStack = _killStack + 1;
if (time - _lastKillAt < (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "killStreakTimeout"))) then
{
	_perks pushBack [format ["%1x Kill Streak", _killStack], _killStack * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "killStreak"))];
}
else 
{
	_killStack = 1; 
};
_killingPlayer setVariable ["ExileKillStack", _killStack];
_killingPlayer setVariable ["ExileLastKillAt", time];
_lastVictims = _killingPlayer getVariable ["ExileLastVictims", ["0", "1", "2"]];
_victimUID = _victim getVariable ["ExileOwnerUID", getPlayerUID _victim];
if (_victimUID in _lastVictims) then
{
	_perks pushBack ["Domination", getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "domination")];
};
_lastVictims deleteAt 0;
_lastVictims pushBack _victimUID;
_killingPlayer setVariable ["ExileLastVictims", _lastVictims];
_flagNextToKiller = _killingPlayer call ExileClient_util_world_getTerritoryAtPosition;
if !(isNull _flagNextToKiller) then 
{
	if ((getPlayerUID _killingPlayer) in (_flagNextToKiller getVariable ["ExileTerritoryBuildRights", []])) then
	{
		_perks pushBack ["Homie", getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "homie")];
	};
};
_flagNextToVictim = _victim call ExileClient_util_world_getTerritoryAtPosition;
if !(isNull _flagNextToVictim) then 
{
	if ((getPlayerUID _victim) in (_flagNextToVictim getVariable ["ExileTerritoryBuildRights", []])) then
	{
		_perks pushBack ["Raid", getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "raid")];
	};
};
_vehicle = vehicle _killingPlayer;
if !(_vehicle isEqualTo _killingPlayer) then
{
	_vehicleRole = _killingPlayer call ExileClient_util_vehicle_getRole;
	switch (_vehicleRole) do 
	{
		case "driver":
		{
			switch (true) do 
			{
				case (_vehicle isKindOf "ParachuteBase"):
				{
					_perks pushBack ["Chute > Chopper", getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "chuteGreaterChopper")];
				};
				case (_vehicle isKindOf "Air"):
				{
					_perks pushBack ["Big Bird", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "bigBird"))];
				};
				default 
				{
					_perks pushBack ["Road Kill", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "roadKill"))];
				};
			};
		};
		case "turret":
		{
			if ((currentWeapon _killingPlayer) isKindOf "StaticWeapon") then 
			{
				_perks pushBack ["Let it Rain", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "letItRain"))];
			}
			else 
			{
				_perks pushBack ["Mad Passenger", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "passenger"))];
			};
		};
		default
		{
			_perks pushBack ["Mad Passenger", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "passenger"))];
		};
	};
};
_distance = floor (_victim distance _killingPlayer);
_distanceBonus = (floor ((_distance min 3000) / 100)) * getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "per100mDistance");
if (_distanceBonus > 0) then 
{
	_perks pushBack [format ["%1m Range", _distance], _distanceBonus];
};
_perks