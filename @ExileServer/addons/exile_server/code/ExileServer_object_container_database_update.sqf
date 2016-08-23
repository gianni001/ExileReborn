/**
 * ExileServer_object_container_database_update
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_containerObject","_containerID","_position","_vectorDirection","_vectorUp","_territoryFlag","_territoryID","_data","_extDB2Message"];
_containerObject= _this;
_containerID = _containerObject getVariable ["ExileDatabaseID", -1];
if (_containerID > -1) then
{
	_position = getPosATL _containerObject;
	_vectorDirection = vectorDir _containerObject;
	_vectorUp = vectorUp _containerObject;
	_territoryFlag = _containerObject call ExileClient_util_world_getTerritoryAtPosition;
	_territoryID = if (isNull _territoryFlag) then { 'NULL' } else { _territoryFlag getVariable ["ExileDatabaseID", 'NULL']};
	_containerObject setVariable ["ExileTerritoryID", _territoryID];
	_data =
	[
		_containerObject getVariable ["ExileIsLocked",-1],
		_position select 0,
		_position select 1,
		_position select 2,
		_vectorDirection select 0, 
		_vectorDirection select 1,
		_vectorDirection select 2,
		_vectorUp select 0,
		_vectorUp select 1,
		_vectorUp select 2,
		_containerObject call ExileServer_util_getItemCargo,
		magazinesAmmoCargo _containerObject,
		weaponsItemsCargo _containerObject,
		_containerObject call ExileServer_util_getObjectContainerCargo,
		_containerObject getVariable ["ExileMoney", 0],
		_containerID,
		_territoryID
	];
	_extDB2Message = ["updateContainer", _data] call ExileServer_util_extDB2_createMessage;
	_extDB2Message call ExileServer_system_database_query_fireAndForget;
};
true