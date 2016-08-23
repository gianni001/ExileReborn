/**
 * ExileServer_object_supplyBox_network_installSupplyBoxRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionId","_parameters","_boxNetId","_box","_territory","_playerObject","_sessionID","_access","_containerID"];
_sessionId = _this select 0;
_parameters = _this select 1;
_boxNetId = _parameters select 0;
try
{
	_box = objectFromNetId _boxNetId;
	if (isNull _box) then 
	{
		throw "Box null";
	};
	if !((typeOf _box) isEqualTo "Exile_Container_SupplyBox") then 
	{
		throw "Fuck off";
	};
	if!((_box getVariable ["ExileDatabaseID", -1]) isEqualTo -1)then
	{
		throw "Container already installed.";
	};
	_territory = _box call ExileClient_util_world_getTerritoryAtPosition;
	if (isNull _territory) then
	{
		throw "Only allowed to install in a territory.";
	};
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	_access = [_territory,getPlayerUID _playerObject] call ExileClient_util_territory_getAccessLevel;
	if (_access select 0 isEqualTo 0) then 
	{
		throw "Not allowed to install in this territory.";
	};
	_box setVariable ["ExileOwnerUID", getPlayerUID _playerObject,true];
	_containerID = _box call ExileServer_object_container_database_insert;
	[_sessionID, "toastRequest", ["SuccessTitleOnly", ["Supply box installed!"]]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to install!", _exception]]] call ExileServer_system_network_send_to;
};
true