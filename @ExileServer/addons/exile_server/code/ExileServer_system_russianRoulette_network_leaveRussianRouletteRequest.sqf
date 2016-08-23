/**
 * ExileServer_system_russianRoulette_network_leaveRussianRouletteRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_playerObject"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then 
	{
		throw "Unknown player!";
	};
	if !(_playerObject getVariable ["IsPlayingRussianRoulette", false]) then 
	{
		throw "You are not playing!";
	};
	if ((count ExileServerRussianRoulettePlayers) > 1) then
	{
		throw "You cannot leave!";
	};
	_playerObject call ExileServer_system_russianRoulette_event_onPlayerLeft;
	call ExileServer_system_russianRoulette_initialize;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to leave!", _exception]]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;
};