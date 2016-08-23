/**
 * ExileServer_object_vehicle_network_setFuelRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_vehicleID","_ammount","_vehicle","_crew","_sessionIDcrew"];
_sessionID = _this select 0;
_parameters = _this select 1;
_vehicleID = _parameters select 0;
_ammount = _parameters select 1;
_vehicle = objectFromNetId _vehicleID;
if(local _vehicle)then
{
	[_vehicle,_ammount] call ExileClient_util_fuel_setFuel;
}
else
{
	_crew = crew _vehicle;
	if!(_crew isEqualTo [])then
	{
		_crew = _crew select 0;
		_sessionIDcrew = _crew getVariable ["ExileSessionID", ""];
		[_sessionIDcrew, "setFuelRequest", [_vehicleID,_ammount]] call ExileServer_system_network_send_to;
	};
};
true