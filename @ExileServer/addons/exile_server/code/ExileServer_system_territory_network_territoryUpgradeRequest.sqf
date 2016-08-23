/**
 * ExileServer_system_territory_network_territoryUpgradeRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_flag","_playerObject","_databaseID","_moderators","_level","_territoryConfig","_territoryLevels","_territoryPrice","_territoryRange","_playerMoney","_logging","_territoryLog"];
_sessionID = _this select 0;
_parameters = _this select 1;
_flag = _parameters select 0;
try
{
	if (isNull _flag) then
	{
		throw "Invalid flag object";
	};
	if ((_flag getVariable ["ExileFlagStolen", 0]) isEqualTo 1) then 
	{
		throw "Flag is stolen!";
	};
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Player Object NULL";
	};
	_databaseID = _flag getVariable ["ExileDatabaseID",0];
	_moderators = _flag getVariable ["ExileTerritoryModerators",[]];
	if !((getPlayerUID _playerObject) in _moderators) then
	{
		throw "No upgrade Access!";
	};
	_level = _flag getVariable ["ExileTerritoryLevel",_level];
	_territoryConfig = getArray(missionConfigFile >> "CfgTerritories" >> "Prices");
	_territoryLevels = count _territoryConfig;
	if (_territoryLevels < (_level + 1)) then
	{
		throw "This territory has already the highest level.";
	};
	_territoryPrice = (_territoryConfig select _level) select 0;
	_territoryRange = (_territoryConfig select _level) select 1;
	_playerMoney = _playerObject getVariable ["ExileMoney",0];
	if (_playerMoney < _territoryPrice) then
	{
		throw "Not enough pop tabs!";
	};
	_playerMoney = _playerMoney - _territoryPrice;
	_playerObject setVariable ["ExileMoney", _playerMoney, true];
	format["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
	_flag setVariable ["ExileTerritoryLevel",_level + 1, true];
	_flag setVariable ["ExileTerritorySize",_territoryRange, true];
	format ["setTerritoryLevel:%1:%2",_level + 1,_databaseID] call ExileServer_system_database_query_fireAndForget;
	format ["setTerritorySize:%1:%2",_territoryRange,_databaseID] call ExileServer_system_database_query_fireAndForget;
	_flag call ExileServer_system_territory_updateNearContainers;
	_flag call ExileServer_system_territory_updateNearConstructions;
	[_sessionID, "toastRequest", ["SuccessTitleAndText", ["Territory upgraded!", format ["Your territory has reached level %1 and now has a new radius of %2 meters.", _level + 1, _territoryRange]]]] call ExileServer_system_network_send_to;
	_logging = getNumber(configFile >> "CfgSettings" >> "Logging" >> "territoryLogging");
	if (_logging isEqualTo 1) then
	{
		_territoryLog = format ["PLAYER ( %1 ) %2 PAID %3 POP TABS TO UPGRADE TERRITORY #%4 TO LEVEL %5 | PLAYER TOTAL POP TABS: %6",getPlayerUID _playerObject,_playerObject,_territoryPrice,_databaseID,(_level + 1),_playerMoney];
		"extDB2" callExtension format["1:TERRITORY:%1",_territoryLog];
	};
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to upgrade!", _exception]]] call ExileServer_system_network_send_to;
};
true