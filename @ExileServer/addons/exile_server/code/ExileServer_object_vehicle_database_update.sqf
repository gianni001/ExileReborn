/**
 * ExileServer_object_vehicle_database_update
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicleObject","_vehicleID","_position","_vectorDirection","_vectorUp","_availableHitpoints","_vehicleHitpoints","_data","_extDB2Message"];
_vehicleObject = _this;
_vehicleID = _vehicleObject getVariable ["ExileDatabaseID", -1];
if (_vehicleID > -1) then
{
	_position = getPosATL _vehicleObject;
	_vectorDirection = vectorDir _vehicleObject;
	_vectorUp = vectorUp _vehicleObject;
	_availableHitpoints = getAllHitPointsDamage _vehicleObject;
	_vehicleHitpoints = [];
	if!(_availableHitpoints isEqualTo [])then
	{
		{
			_vehicleHitpoints pushBack [_x ,_vehicleObject getHitPointDamage _x];
		}
		forEach (_availableHitpoints select 0);
	};
	_data =
	[
		_vehicleObject getVariable ["ExileIsLocked",-1],
		fuel _vehicleObject,
		damage _vehicleObject,
		_vehicleHitpoints,
		_position select 0,
		_position select 1,
		_position select 2,
		_vectorDirection select 0, 
		_vectorDirection select 1,
		_vectorDirection select 2,
		_vectorUp select 0,
		_vectorUp select 1,
		_vectorUp select 2,
		_vehicleObject call ExileServer_util_getItemCargo,
		magazinesAmmoCargo _vehicleObject,
		weaponsItemsCargo _vehicleObject,
		_vehicleObject call ExileServer_util_getObjectContainerCargo,
		_vehicleObject getVariable ["ExileMoney", 0],
		_vehicleID 
	];
	_extDB2Message = ["updateVehicle", _data] call ExileServer_util_extDB2_createMessage;
	_extDB2Message call ExileServer_system_database_query_fireAndForget;
};
true