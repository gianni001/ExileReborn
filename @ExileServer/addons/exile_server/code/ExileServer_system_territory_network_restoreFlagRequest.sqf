/**
 * ExileServer_system_territory_network_restoreFlagRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_flagNetID","_flag","_playerObject","_buildRights","_playerUID","_level","_itemClassName","_territoryDatabaseID","_flagTexture","_logging"];
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
		throw "Flag is not stolen!";
	};
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then 
	{
		throw "You do not exist!";
	};
	if !(alive _playerObject) then
	{
		throw "You are dead! Didn't you know that?";
	};
	if ((_playerObject distance2D _flag) > 4) then
	{
		throw "You are too far away.";
	};
	_buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
	_playerUID = getPlayerUID _playerObject;
	if !(_playerUID in _buildRights) then
	{
		throw "Missing build rights.";
	};
	_level = _flag getVariable ["ExileTerritoryLevel", 0];
	_itemClassName = format["Exile_Item_FlagStolen%1", _level];
	if !(_itemClassName in (magazines _playerObject)) then 
	{
		throw format ["You need a level %1 flag.", _level];
	};
	_playerObject removeItem _itemClassName;
	_territoryDatabaseID = _flag getVariable ["ExileDatabaseID", 0];
	format["flagRestore:%1", _territoryDatabaseID] call ExileServer_system_database_query_fireAndForget;
	_flag setVariable ["ExileFlagStolen", 0, true];
	_flag setFlagOwner objNull;
	_flagTexture = _flag getVariable "ExileFlagTexture";
	_flag setFlagTexture _flagTexture;
	_logging = getNumber(configFile >> "CfgSettings" >> "Logging" >> "territoryLogging");
	if (_logging isEqualTo 1) then
	{
		"extDB2" callExtension format ["1:TERRITORY:PLAYER ( %1 ) %2 RESTORED THE FLAG OF TERRITORY #%3", _playerUID, _playerObject, _territoryDatabaseID];
	};
	[_sessionID, "toastRequest", ["SuccessTitleAndText", ["Flag has been restored!", "You can now maintain and build on our territory again."]]] call ExileServer_system_network_send_to;
	_flag call ExileServer_system_xm8_sendFlagRestored;	
}
catch 
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to restore!", _exception]]] call ExileServer_system_network_send_to;
};
true