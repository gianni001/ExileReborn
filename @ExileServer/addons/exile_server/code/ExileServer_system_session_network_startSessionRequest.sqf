/**
 * ExileServer_system_session_network_startSessionRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_parameters","_netId","_player","_existingSessionID","_sessionId"];
_parameters = _this select 1;
_netId = _parameters select 0;
try 
{
	_player = objectFromNetId _netId;
	if (isNull _player) then 
	{
		throw "Cannot start session for unknown network ID!";
	};
	_existingSessionID = _player getVariable ["ExileSessionID",-1];
	if !(_existingSessionID isEqualTo -1) then 
	{
		throw "Trying to get a second session ID!";
	};
	_sessionId = _player call ExileServer_system_session_begin;
	[_sessionId, "startSessionResponse", [_sessionId]] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileServer_util_log;
};
true