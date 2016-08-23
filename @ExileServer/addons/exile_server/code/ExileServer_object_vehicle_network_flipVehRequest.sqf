/**
 * ExileServer_object_vehicle_network_flipVehRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_vehicleID","_vehicle","_player","_pos"];
_sessionID = _this select 0;
_parameters = _this select 1;
_vehicleID = _parameters select 0;
_vehicle = objectFromNetId _vehicleID;
_player = _sessionID call ExileServer_system_session_getPlayerObject;
try
{
	if (_vehicle distance _player > 7) then
	{
		throw "Player to far";
	};
	if !((crew _vehicle) isEqualTo []) then
	{
		throw "Vehicle not empty";
	};
	if (local _vehicle) then
	{
		_pos = getPosATL _vehicle;
		_pos set [2,(_pos select 2) + 0.1];
		_vehicle setPosATL _pos;
		_vehicle setVectorUp [0, 0, 1];
	}
	else
	{
		_vehicle setOwner (owner _player);
		[_sessionID,"flipVehRequest",[_vehicleID]] call ExileServer_system_network_send_to;
	};
}
catch
{
	format["FlipVehicleRequest: %1", _exception] call ExileServer_util_log;
};
true