/**
 * ExileServer_system_clan_network_inviteToClanRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_playerNetID","_invitedPlayer","_player","_clanID","_clanHash"];
_sessionID = _this select 0;
_playerNetID = (_this select 1) select 0;
_invitedPlayer = objectFromNetId _playerNetID;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if(isNull _player)then
	{
		throw "You do not exist! :)";
	};
	_clanID = _player getVariable ["ExileClanID",-1];
	if(_clanID isEqualTo -1)then
	{
		throw "You are not in a family!";
	};
	_clanHash = missionNameSpace getVariable [format["ExileServer_clan_%1",_clanID],[]];
	if(_clanHash isEqualTo [])then
	{
		throw "Family data is broken!";
	};
	if!(getPlayerUID _player isEqualTo (_clanHash select 1))then
	{
		throw "You are not the papa!";
	};
	if(isNull _invitedPlayer)then
	{
		throw "Cannot invite unknown player!";
	};
	if!(_invitedPlayer getVariable ["ExileClanID",-1] isEqualTo -1)then
	{
		throw "That player is already in a family!";
	};
	if(_invitedPlayer getVariable ["ExileClanInvite",false])then
	{
		throw "That player already has a family invite!";
	};
	_invitedPlayer setVariable ["ExileClanInvite",true];
	_invitedPlayer setVariable ["ExileClanInviteID",_clanID];
	_invitedPlayer setVariable ["ExileClanInviteOwner",_player];
	[_invitedPlayer,"inviteToClanRequestClient",[name _player,_clanHash select 0]] call ExileServer_system_network_send_to;
	[_sessionID, "toastRequest", ["SuccessTitleOnly", ["Family invite sent!"]]] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileServer_system_util_log;
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to invite!", _exception]]] call ExileServer_system_network_send_to;
};