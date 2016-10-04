/**
 * ExileServer_object_player_event_onMpKilled
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_victim","_killer","_countDeath","_countKill","_killSummary","_killingPlayer","_killType","_oldVictimRespect","_newVictimRespect","_oldKillerRespect","_newKillerRespect","_systemChat","_modifyVictimRespect","_respectLoss","_perks","_minRespectTransfer","_respectTransfer","_perkNames","_killerStatsNeedUpdate","_newKillerFrags","_victimStatsNeedUpdate","_newVictimDeaths","_victimPosition"];
_victim = _this select 0;
_killer = _this select 1;

if (_killer isEqualTo _victim) then
{
	_lastDamageSource = _victim getVariable ["JohnO_lastSourceOfDamage",objNull];

	_killer = _lastDamageSource;

	_victime setVariable ["JohnO_lastSourceOfDamage",objNull,true];
};

format ["_killer = %1 :: _victim = %2",_killer,_victim] call ExileServer_util_log;

if (!isServer || hasInterface || isNull _victim) exitWith {};
_victim setVariable ["ExileDiedAt", time];
if !(isPlayer _victim) exitWith {};
_victim setVariable ["ExileIsDead", true]; 
_victim setVariable ["ExileName", name _victim, true]; 
_countDeath = false;
_countKill = false;
_killSummary = [];
_killingPlayer = _killer call ExileServer_util_getFragKiller;
_killType = [_victim, _killer, _killingPlayer] call ExileServer_util_getFragType;
_oldVictimRespect = _victim getVariable ["ExileScore", 0];
_newVictimRespect = _oldVictimRespect;
_oldKillerRespect = 0;
if !(isNull _killingPlayer) then 
{
	_oldKillerRespect = _killingPlayer getVariable ["ExileScore", 0];
};
_newKillerRespect = _oldKillerRespect;
switch (_killType) do 
{
	default 
	{
		_countDeath = true;
		_systemChat = format ["%1 died for an unknown reason!", name _victim];
		_newVictimRespect = _oldVictimRespect - round ((abs _oldVictimRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "unlucky")));
	};
	case 1:
	{
		_countDeath = true;
		_modifyVictimRespect = true;
		_systemChat = format ["%1 commited suicide!", name _victim];
		_newVictimRespect = _oldVictimRespect - round ((abs _oldVictimRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "suicide")));
	};
	case 2:
	{
		_countDeath = true;
		_countKill = false;
		_systemChat = format ["%1 died while playing Russian Roulette!", name _victim];
		_newVictimRespect = _oldVictimRespect; 
		_victim call ExileServer_system_russianRoulette_event_onPlayerDied;
	};
	case 3:
	{
		_countDeath = true;
		_countKill = false;
		_systemChat = format ["%1 crashed to death!", name _victim];
		_newVictimRespect = _oldVictimRespect - round ((abs _oldVictimRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "crash")));
	};
	case 4:
	{
		_countDeath = true;
		_countKill = false;
		_systemChat = format ["%1 was killed by an NPC!", name _victim];
		_newVictimRespect = _oldVictimRespect - round ((abs _oldVictimRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "npc")));
	};
	case 5:
	{
		_countDeath = false;
		_countKill = false;
		_systemChat = format ["%1 was team-killed by %2!", name _victim, name _killingPlayer];
		_respectLoss = round ((abs _oldKillerRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "friendyFire")));
		_newKillerRespect = _oldKillerRespect - _respectLoss;
		_killSummary pushBack ["FRIENDLY FIRE", -1 * _respectLoss];
	};
	case 6:
	{
		_countDeath = false;
		_countKill = false;
		_systemChat = format ["%1 was killed by %2! (BAMBI SLAYER)", name _victim, name _killingPlayer];
		_respectLoss = round ((abs _oldKillerRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "bambiKill")));
		_newKillerRespect = _oldKillerRespect - _respectLoss;
		_killSummary pushBack ["BAMBI SLAYER", -1 * _respectLoss];
	};
	case 7:
	{
		_countDeath = true;
		_countKill = true;
		_perks = [_victim, _killer, _killingPlayer] call ExileServer_util_getFragPerks;
		_minRespectTransfer = getNumber (configFile >> "CfgSettings" >> "Respect" >> "minRespectTransfer");
		_respectTransfer = round ((abs _oldVictimRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "frag")));
		if (_respectTransfer < _minRespectTransfer) then
		{
			_respectTransfer = _minRespectTransfer;
		};
		_newVictimRespect = _oldVictimRespect - _respectTransfer;
		_newKillerRespect = _oldKillerRespect + _respectTransfer;
		_killSummary pushBack ["ENEMY FRAGGED", _respectTransfer];
		if (_perks isEqualTo []) then 
		{
			_systemChat = format ["%1 was killed by %2!", name _victim, name _killingPlayer];
		}
		else 
		{
			_perkNames = [];
			{
				_perkNames pushBack (_x select 0);
				_killSummary pushBack _x;
				_newKillerRespect = _newKillerRespect + (_x select 1);
			} 
			forEach _perks;
			_systemChat = format ["%1 was killed by %2! (%3)", name _victim, name _killingPlayer, _perkNames joinString ", "];
		};
	};
};
if !(isNull _killingPlayer) then 
{
	if !(_killSummary isEqualTo []) then 
	{	
		[_killingPlayer, "showFragRequest", [_killSummary]] call ExileServer_system_network_send_to;
	};
};
if !(isNull _killingPlayer) then 
{
	_killerStatsNeedUpdate = false;
	if (_countKill) then
	{
		_newKillerFrags = _killingPlayer getVariable ["ExileKills", 0];
		_newKillerFrags = _newKillerFrags + 1;
		_killerStatsNeedUpdate = true;
		_killingPlayer setVariable ["ExileKills", _newKillerFrags];
		format["addAccountKill:%1", getPlayerUID _killingPlayer] call ExileServer_system_database_query_fireAndForget;
	};
	if !(_newKillerRespect isEqualTo _oldKillerRespect) then 
	{
		_killingPlayer setVariable ["ExileScore", _newKillerRespect];
		_killerStatsNeedUpdate = true;
		format["setAccountScore:%1:%2", _newKillerRespect, getPlayerUID _killingPlayer] call ExileServer_system_database_query_fireAndForget;
	};
	if (_killerStatsNeedUpdate) then 
	{
		_killingPlayer call ExileServer_object_player_sendStatsUpdate;
	};
};
_victimStatsNeedUpdate = false;
if (_countDeath) then
{
	_newVictimDeaths = _victim getVariable ["ExileDeaths", 0];
	_newVictimDeaths = _newVictimDeaths + 1;
	_victim setVariable ["ExileDeaths", _newVictimDeaths];
	_victimStatsNeedUpdate = true;
	format["addAccountDeath:%1", getPlayerUID _victim] call ExileServer_system_database_query_fireAndForget;
};
if !(_newVictimRespect isEqualTo _oldVictimRespect) then 
{
	_victim setVariable ["ExileScore", _newVictimRespect];
	_victimStatsNeedUpdate = true;
	format["setAccountScore:%1:%2", _newVictimRespect, getPlayerUID _victim] call ExileServer_system_database_query_fireAndForget;
};
if (_victimStatsNeedUpdate) then 
{
	_victim call ExileServer_object_player_sendStatsUpdate;
};
if ((vehicle _victim) isEqualTo _victim) then 
{
	if !(underwater _victim) then 
	{
		if !(_victim call ExileClient_util_world_isInTraderZone) then 
		{
			_victim call ExileServer_object_flies_spawn;
		};
	};
};
if !(_systemChat isEqualTo "") then 
{
	if ((getNumber (configFile >> "CfgSettings" >> "KillFeed" >> "showKillFeed")) isEqualTo 1) then 
	{
		["systemChatRequest", [_systemChat]] call ExileServer_system_network_send_broadcast;
	};
};
if !(_systemChat isEqualTo "") then 
{
	if ((getNumber (configFile >> "CfgSettings" >> "Logging" >> "deathLogging")) isEqualTo 1) then
	{
		"extDB2" callExtension format["1:DEATH:%1", _systemChat];
	};
};
_victimPosition = getPos _victim;
format["insertPlayerHistory:%1:%2:%3:%4:%5", getPlayerUID _victim, name _victim, _victimPosition select 0, _victimPosition select 1, _victimPosition select 2] call ExileServer_system_database_query_fireAndForget;
format["deletePlayer:%1", _victim getVariable ["ExileDatabaseId", -1]] call ExileServer_system_database_query_fireAndForget;
true