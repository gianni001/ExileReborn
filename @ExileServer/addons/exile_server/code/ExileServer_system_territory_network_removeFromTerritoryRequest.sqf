/**
 * ExileServer_system_territory_network_removeFromTerritoryRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_flagNetID","_playerToBeKickedUID","_playerObject","_flagObject","_territoryID","_ownerUID","_moderators","_buildRights"];
_sessionID = _this select 0;
_parameters = _this select 1;
_flagNetID = _parameters select 0;
_playerToBeKickedUID = _parameters select 1;
try 
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Invalid player object";
	};
	_flagObject = objectFromNetId _flagNetID;
	if (isNull _flagObject) then
	{
		throw "Invalid flag object.";
	};
	_territoryID = _flagObject getVariable ["ExileDatabaseID", -1];
	if (_territoryID isEqualTo -1) then
	{
		throw "Territory has no database ID.";
	};
	_ownerUID = _flagObject getVariable ["ExileOwnerUID", ""];
	if (_playerToBeKickedUID isEqualTo _ownerUID) then
	{
		throw "Owners cannot leave territories.";
	};
	_moderators = _flagObject getVariable ["ExileTerritoryModerators", []];
	_buildRights = _flagObject getVariable ["ExileTerritoryBuildRights", []];
	if (_playerToBeKickedUID isEqualTo (getPlayerUID _playerObject)) then
	{
	}
	else  
	{
		if !((getPlayerUID _playerObject) in _moderators) then
		{
			throw "Only moderators can kick."; 
		};
	};
	_moderators = _moderators - [_playerToBeKickedUID];
	_buildRights = _buildRights - [_playerToBeKickedUID];
	_flagObject setVariable ["ExileTerritoryBuildRights", _buildRights, true];
	format["updateTerritoryBuildRights:%1:%2", _buildRights, _territoryID] call ExileServer_system_database_query_fireAndForget;
	format["updateTerritoryModerators:%1:%2", _moderators, _territoryID] call ExileServer_system_database_query_fireAndForget;
}
catch 
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to remove!", _exception]]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;
};
true