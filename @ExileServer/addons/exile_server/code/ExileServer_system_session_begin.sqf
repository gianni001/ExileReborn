/**
 * ExileServer_system_session_begin
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionId"];
_sessionId = call ExileServer_system_session_createId;
ExileSessionIDs pushBack _sessionId;
[_sessionId, _this] call ExileServer_system_session_update;
format ["Starting session for '%1' with ID '%2'...", name _this, _sessionId] call ExileServer_util_log;
_sessionId