/**
 * ExileServer_system_vehicleSaveQueue_removeVehicle
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicleObject","_vehicleNetId","_index"];
_vehicleObject = _this;
_vehicleNetId = netID _vehicleObject;
_index = ExileServerVehicleSaveQueue find _vehicleNetId;
if (_index > -1) then 
{
	ExileServerVehicleSaveQueue deleteAt _index;
};
true;