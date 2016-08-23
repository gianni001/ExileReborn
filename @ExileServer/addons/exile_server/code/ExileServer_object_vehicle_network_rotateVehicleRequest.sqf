/**
 * ExileServer_object_vehicle_network_rotateVehicleRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_vehicleID","_vehicle","_rotation","_player"];
_sessionID = _this select 0;
_parameters = _this select 1;
_vehicleID = _parameters select 0;
_vehicle = objectFromNetId _vehicleID;
_rotation = _parameters select 1;
if(local _vehicle)then
{
	[_vehicle,_rotation] call ExileClient_object_vehicle_rotate;
}
else
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	_vehicle setOwner (owner _player);
	[_sessionID,"rotateVehicleRequest",[_vehicleID,_rotation]] call ExileServer_system_network_send_to;
};
true