/**
 * ExileServer_system_vehicleSaveQueue_network_vehicleSaveRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_parameters","_vehicleObjectNetId","_vehicleObject"];
_parameters = _this select 1;
_vehicleObjectNetId = _parameters select 0;
_vehicleObject = objectFromNetId _vehicleObjectNetId;
if (_vehicleObject getVariable ["ExileIsPersistent", false]) then
{
	_vehicleObject call ExileServer_system_vehicleSaveQueue_addVehicle;
};
true