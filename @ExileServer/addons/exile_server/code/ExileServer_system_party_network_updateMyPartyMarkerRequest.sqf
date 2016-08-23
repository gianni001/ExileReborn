/**
 * ExileServer_system_party_network_updateMyPartyMarkerRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_update","_position","_sendingPlayer"];
_sessionID = _this select 0;
_parameters = _this select 1;
_update = _parameters select 0;
_position = _parameters select 1;
try 
{
	_sendingPlayer = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _sendingPlayer) then
	{
		throw "Invalid player object while updating party marker."; 
	};
	if (_update) then 
	{
		_sendingPlayer setVariable ["ExilePartyMarker", _position];
	}
	else 
	{
		_sendingPlayer setVariable ["ExilePartyMarker", -1];
	};
	{
		if !(_x isEqualTo _sendingPlayer) then 
		{
			[_x, "updatePartyMarkerRequest", [netId _sendingPlayer, _update, _position]] call ExileServer_system_network_send_to;
		};
	}
	forEach (units (group _sendingPlayer));
}
catch 
{
	_x call ExileServer_util_log;
};