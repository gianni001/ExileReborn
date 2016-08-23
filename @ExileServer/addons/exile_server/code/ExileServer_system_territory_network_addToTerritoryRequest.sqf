/**
 * ExileServer_system_territory_network_addToTerritoryRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_flagNetID","_playerToBeAddedNetID","_playerOwnerObject","_flagObject","_playerToBeAddedObject","_territoryOwnerUID","_currentBuildRights","_playerToBeAddedUID","_territoryID","_territoryName"];
_sessionID = _this select 0;
_parameters = _this select 1;
_flagNetID = _parameters select 0;
_playerToBeAddedNetID = _parameters select 1;
try 
{
	_playerOwnerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerOwnerObject) then
	{
		throw "Player (owner or moderator) object not found.";
	};
	_flagObject = objectFromNetId _flagNetID;
	if (isNull _flagObject) then
	{
		throw "Flag object not found."; 
	};
	_playerToBeAddedObject = objectFromNetId _playerToBeAddedNetID;
	if (isNull _playerToBeAddedObject) then
	{
		throw "Player (to be added) object not found.";
	};
	if (_playerOwnerObject isEqualTo _playerToBeAddedObject) then
	{
		throw "Trying to add yourself, huh?";
	};
	_territoryOwnerUID = _flagObject getVariable ["ExileOwnerUID", ""];
	if (_territoryOwnerUID isEqualTo (getPlayerUID _playerToBeAddedObject)) then
	{
		throw "The owner of this territory, you dont need build rights.";
	};
	_currentBuildRights = _flagObject getVariable ["ExileTerritoryBuildRights", []];
	_playerToBeAddedUID = getPlayerUID _playerToBeAddedObject;
	if (_playerToBeAddedUID in _currentBuildRights) then
	{
		throw "This player already has build rights.";
	};
	_territoryID = _flagObject getVariable ["ExileDatabaseID", -1];
	_territoryName = _flagObject getVariable ["ExileTerritoryName", ""];
	if (_territoryID isEqualTo -1) then
	{
		throw "Territory has no database ID.";
	};
	_currentBuildRights pushBack _playerToBeAddedUID;
	_flagObject setVariable ["ExileTerritoryBuildRights", _currentBuildRights, true];
	format["updateTerritoryBuildRights:%1:%2", _currentBuildRights, _territoryID] call ExileServer_system_database_query_fireAndForget;
	[_playerToBeAddedObject, "toastRequest", ["InfoTitleOnly", [ format ["You have been added to territory '%1'!", _territoryName] ]]] call ExileServer_system_network_send_to;
}
catch 
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to add!", _exception]]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;
};
true