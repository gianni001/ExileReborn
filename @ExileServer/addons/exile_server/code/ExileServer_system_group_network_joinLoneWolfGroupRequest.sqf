/**
 * ExileServer_system_group_network_joinLoneWolfGroupRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_player"];
_sessionID = _this select 0;
try 
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then 
	{
		throw "Non-existent players cannot join lone wolf group!";
	};
	_group = call ExileServer_system_group_getOrCreateLoneWolfGroup;
	[_player] joinSilent _group;
}
catch 
{
	_exception call ExileServer_util_log;
};