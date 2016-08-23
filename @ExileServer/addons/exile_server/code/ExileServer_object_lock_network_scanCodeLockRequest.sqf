/**
 * ExileServer_object_lock_network_scanCodeLockRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_object","_player","_lastToggleAt","_pinCode","_signature"];
_sessionID = _this select 0;
_parameters = _this select 1;
try 
{
	_object = objectFromNetId (_parameters select 0);
	if (isNull _object) then 
	{
		throw "NOPE"; 
	};
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then 
	{
		throw "NOPE"; 
	};
	if ((_player distance _object) > 5) then 
	{
		throw "NOPE"; 
	};
	if !("Exile_Item_ThermalScannerPro" in (magazines _player)) then 
	{
		throw "NOPE"; 
	};
	if (_object call ExileClient_util_world_isInTraderZone) then 
	{
		throw "NOPE"; 
	};
	_lastToggleAt = _object getVariable ["ExileLastLockToggleAt", -1];
	if (_lastToggleAt isEqualTo -1) then 
	{
		throw "NOPE"; 
	};
	if ((time - _lastToggleAt) > (15 * 60)) then 
	{
		throw "NOPE"; 
	};
	_pinCode = _object getVariable ["ExileAccessCode", "0000"];
	_signature = _pinCode select [1, 3];
	throw _signature;
}
catch
{
	[_sessionID, "scanCodeLockResponse", [_exception]] call ExileServer_system_network_send_to;
};