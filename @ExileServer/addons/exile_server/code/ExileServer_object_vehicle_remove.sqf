/**
 * ExileServer_object_vehicle_remove
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicleObject"];
_vehicleObject = _this;
if (_vehicleObject getVariable ["ExileIsPersistent", false]) then 
{
	_vehicleObject call ExileServer_object_vehicle_database_delete;
	_vehicleObject call ExileServer_system_vehicleSaveQueue_removeVehicle;
};
_vehicleObject call ExileServer_system_simulationMonitor_removeVehicle;
true