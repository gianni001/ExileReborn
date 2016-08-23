/**
 * ExileServer_object_lock_network_hotwireLockRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_object","_player"];
_sessionID = _this select 0;
_parameters = _this select 1;
try 
{
	_object = objectFromNetId (_parameters select 0);
	if (isNull _object) then 
	{
		throw "Vehicle object is null."; 
	};
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then 
	{
		throw "Player is null."; 
	};
	if ((_player distance _object) > 10) then 
	{
		throw "You are too far away."; 
	};
	if !("Exile_Item_Knife" in (magazines _player)) then 
	{
		throw "You do not have a knife."; 
	};
	if (isNumber(configFile >> "CfgVehicles" >> typeOf _object >> "exileIsLockable")) then
	{
		_object setVariable ["ExileIsLocked", 0, true];
	}
	else
	{
		if (local _object) then
		{
			_object lock 0;
		}
		else
		{
			[owner _object, "hotwireLockRequest", [netId _object]] call ExileServer_system_network_send_to;
		};
		_object setVariable ["ExileIsLocked", 0];
		_object call ExileServer_system_vehicleSaveQueue_addVehicle;
	};
	_object enableRopeAttach true;
	_object setVariable ["ExileLastLockToggleAt", time];
	_object setVariable ["ExileAccessDenied", false];
	_object setVariable ["ExileAccessDeniedExpiresAt", 0];
	[_sessionID, "toastRequest", ["SuccessTitleOnly", ["Vehicle hotwired!"]]] call ExileServer_system_network_send_to;
}
catch 
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to hotwire!", _exception]]] call ExileServer_system_network_send_to;
};
