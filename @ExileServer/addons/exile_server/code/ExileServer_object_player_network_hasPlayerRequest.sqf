/**
 * ExileServer_object_player_network_hasPlayerRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_player","_hasAlivePlayer"];
_sessionID = _this select 0;
_player = _sessionID call ExileServer_system_session_getPlayerObject;
try 
{
	format ["Dispatching hasPlayerRequest for session '%1'...", _sessionID] call ExileServer_util_log;
	if (isNull _player) then
	{
		throw "Player object is null!";
	};
	_uid = getPlayerUID _player;
	if (isNil "_uid") then 
	{
		throw "getPlayerUID returned nil!";
	};
	if (_uid isEqualTo "") then 
	{
		throw "getPlayerUID returned an empty string!";
	};
	_hasAlivePlayer = format["hasAlivePlayer:%1", _uid] call ExileServer_system_database_query_selectSingleField;
	[_sessionID, "hasPlayerResponse", [_hasAlivePlayer]] call ExileServer_system_network_send_to;
}
catch
{
	"hasPlayerRequest failed!" call ExileServer_util_log;
	_exception call ExileServer_util_log;
};
true