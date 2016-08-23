/**
 * ExileServer_object_vehicle_database_delete
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicleObject","_vehicleID"];
_vehicleObject = _this;
_vehicleID = _vehicleObject getVariable ["ExileDatabaseID", -1];
if (_vehicleID > -1) then
{
	format ["deleteVehicle:%1", _vehicleID] call ExileServer_system_database_query_fireAndForget;
};
true