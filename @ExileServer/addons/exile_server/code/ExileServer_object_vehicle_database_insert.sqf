/**
 * ExileServer_object_vehicle_database_insert
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicleObject","_position","_vectorDirection","_vectorUp","_data","_extDB2Message","_vehicleID"];
_vehicleObject = _this;
_position = getPosATL _vehicleObject;
_vectorDirection = vectorDir _vehicleObject;
_vectorUp = vectorUp _vehicleObject;
_data =
[
	typeOf _vehicleObject,
	_vehicleObject getVariable ["ExileOwnerUID", ""],
	locked _vehicleObject,
	_position select 0,
	_position select 1,
	_position select 2,
	_vectorDirection select 0, 
	_vectorDirection select 1,
	_vectorDirection select 2,
	_vectorUp select 0,
	_vectorUp select 1,
	_vectorUp select 2,
	_vehicleObject getVariable ["ExileAccessCode",""]
];
_extDB2Message = ["insertVehicle", _data] call ExileServer_util_extDB2_createMessage;
_vehicleID = _extDB2Message call ExileServer_system_database_query_insertSingle;
_vehicleObject setVariable["ExileDatabaseID", _vehicleID];
_vehicleObject setVariable["ExileIsPersistent", true];
_vehicleID