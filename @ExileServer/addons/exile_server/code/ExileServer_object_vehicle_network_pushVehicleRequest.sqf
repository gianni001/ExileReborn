/**
 * ExileServer_object_vehicle_network_pushVehicleRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_vehicleID","_vehicle","_direction","_magnitude","_callerID","_caller","_actualCaller"];
_sessionID = _this select 0;
_parameters = _this select 1;
_vehicleID = _parameters select 0;
_vehicle = objectFromNetId _vehicleID;
_direction = _parameters select 1;
_magnitude = _parameters select 2;
_callerID = _parameters select 3;
_caller = objectFromNetId _caller;
_actualCaller = _sessionID call ExileServer_system_session_getPlayerObject;
try
{
	if!(_caller isEqualTo _actualCaller)then
	{
		throw format ["Caller Sppofing: %1 tryied to spoof %2!",_actualCaller, _caller];
	};
	if(_magnitude > 15)then
	{
		throw format ["To high magnitude(%1) by %2",_magnitude, _caller];
	};
	if(local _vehicle)then
	{
		[_vehicle,_direction,_magnitude,_caller] call ExileClient_util_vehicle_push;
	}
	else
	{
		_vehicle setOwner (owner _caller);
		[_sessionID,"pushVehicleRequest",[netId _vehicle,_direction,_magnitude,netId _caller]] call ExileServer_system_network_send_to;
	};
}
catch
{
	format["PushVehicleRequest: %1", _exception] call ExileServer_util_log;
};