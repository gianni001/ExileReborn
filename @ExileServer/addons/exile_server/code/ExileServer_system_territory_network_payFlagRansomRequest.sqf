/**
 * ExileServer_system_territory_network_payFlagRansomRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_flagNetID","_flag","_playerObject","_buildRights","_playerUID","_level","_itemClassName","_flagFee","_playerMoney","_logging","_databaseID","_territoryLog"];
_sessionID = _this select 0;
_parameters = _this select 1;
_flagNetID = _parameters select 0;
try 
{
	_flag = objectFromNetid _flagNetID;
	if (isNull _flag) then 
	{
		throw "Territory not found!";
	};
	if ((_flag getVariable ["ExileFlagStolen", 1]) isEqualTo 0) then 
	{
		throw "Flag not stolen!";
	};
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then 
	{
		throw "You do not exist!";
	};
	if !(alive _playerObject) then
	{
		throw "You are dead!";
	};
	_buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
	_playerUID = getPlayerUID _playerObject;
	if !(_playerUID in _buildRights) then
	{
		throw "Missing build rights!";
	};
	_level = _flag getVariable ["ExileTerritoryLevel", 0];
	_itemClassName = format["Exile_Item_FlagStolen%1", _level];
	if !(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName) ) then
	{
		throw "Flag price not found!";
	};
	_flagFee = getNumber (missionConfigFile >> "CfgExileArsenal" >> _itemClassName >> "price");
	if (_flagFee <= 0) then
	{
		throw "Invalid flag price!";
	};
	_playerMoney = _playerObject getVariable ["ExileMoney", 0];
	if (_playerMoney < _flagFee) then
	{
		throw "You are too poor!";
	};
	if !(_playerObject canAdd _itemClassName) then 
	{
		throw "Inventory is full!";
	};
	_playerMoney = _playerMoney - _flagFee;
	_playerObject setVariable ["ExileMoney", _playerMoney, true];
	format ["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
	_playerObject addItem _itemClassName;
	_logging = getNumber(configFile >> "CfgSettings" >> "Logging" >> "territoryLogging");
	if (_logging isEqualTo 1) then
	{
		_databaseID = _flag getVariable ["ExileDatabaseID",0];
		_territoryLog = format ["PLAYER ( %1 ) %2 PAID %3 POP TABS FOR THE RANSOM OF TERRITORY #%4 | PLAYER TOTAL POP TABS: %5", _playerUID, _playerObject, _flagFee, _databaseID, _playerMoney];
		"extDB2" callExtension format["1:TERRITORY:%1", _territoryLog];
	};
	[_sessionID, "toastRequest", ["SuccessTitleOnly", ["Random paid!"]]] call ExileServer_system_network_send_to;
}
catch 
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to pay!", _exception]]] call ExileServer_system_network_send_to;
};
true