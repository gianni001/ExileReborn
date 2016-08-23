/**
 * ExileServer_object_vehicle_network_resetCodeDialogRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_vehicle","_player","_responseCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_vehicle = objectFromNetId (_parameters select 0);
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then
	{
		throw "Invalid player.";
	};
	if !(alive _player) then
	{
		throw "Dead player.";
	};
	_responseCode = "Reset Code";
	[_sessionID,"resetCodeDialogResponse",[_responseCode, netId _vehicle]] call ExileServer_system_network_send_to;
}
catch 
{
	[_sessionID,"resetCodeDialogResponse",[_exception,""]] call ExileServer_system_network_send_to;
};
true