/**
 * ExileServer_system_territory_network_moderationTerritoryRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_paramaters","_flagNetID","_moderatedPlayerUID","_mode","_flag","_territoryName","_requestingPlayer","_moderatedPlayer","_moderatedPlayerAccess","_requestingPlayerAccess","_newUserLevel"];
_sessionID = _this select 0;
_paramaters = _this select 1;
_flagNetID = _paramaters select 0;
_moderatedPlayerUID = _paramaters select 1;
_mode = _paramaters select 2;
try
{
	_flag = objectFromNetId _flagNetID;
	_territoryName = _flag getVariable ["ExileTerritoryName",""];
	_requestingPlayer = _sessionID call ExileServer_system_session_getPlayerObject;
	_moderatedPlayer = _moderatedPlayerUID call ExileClient_util_player_objectFromPlayerUid;
	_moderatedPlayerAccess = [_flag,_moderatedPlayerUID] call ExileClient_util_territory_getAccessLevel;
	_requestingPlayerAccess = [_flag,(getPlayerUID _requestingPlayer)] call ExileClient_util_territory_getAccessLevel;
	if ((_moderatedPlayerAccess select 0) >= (_requestingPlayerAccess select 0))then
	{
		if (isNull _moderatedPlayer) then
		{
			throw format ["You do not have the required rights to moderate a %1.",_moderatedPlayerAccess select 1];
		}
		else
		{
			throw format ["You do not have the required rights to moderate %1(%2).",name _moderatedPlayer,_moderatedPlayerAccess select 1];
		};
	};
	if (_mode) then
	{
		if !((_requestingPlayerAccess select 0) isEqualTo 3) then
		{
			throw "Only owners can promote to moderators!";
		};
		if ((_moderatedPlayerAccess select 0) isEqualTo 2) then
		{
			throw "Player is already a moderator!"; 
		};
		_newUserLevel  = (_moderatedPlayerAccess select 0) + 1;
		[_requestingPlayer, "toastRequest", ["InfoTitleAndText", ["Player has been promoted!", _territoryName]]] call ExileServer_system_network_send_to;
		if !(isNull _moderatedPlayer) then
		{
			[_moderatedPlayer, "toastRequest", ["InfoTitleAndText", ["You have been promoted!", _territoryName]]] call ExileServer_system_network_send_to;
		};
	}
	else
	{
		if ((_moderatedPlayerAccess select 0) isEqualTo 1) then
		{
			throw format ["Player is already a %1",_moderatedPlayerAccess select 1]; 
		};
		_newUserLevel = (_moderatedPlayerAccess select 0) - 1;
		[_requestingPlayer, "toastRequest", ["InfoTitleAndText", ["Player has been demoted!", _territoryName]]] call ExileServer_system_network_send_to;
		if !(isNull _moderatedPlayer) then
		{
			[_moderatedPlayer, "toastRequest", ["InfoTitleAndText", ["You have been demoted!", _territoryName]]] call ExileServer_system_network_send_to;
		};
	};
	[_flag,_moderatedPlayerUID,_newUserLevel] call ExileServer_system_territory_updateRights;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed!", _exception]]] call ExileServer_system_network_send_to;
};
