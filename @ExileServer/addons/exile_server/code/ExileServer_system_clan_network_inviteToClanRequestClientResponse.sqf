/**
 * ExileServer_system_clan_network_inviteToClanRequestClientResponse
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_accepted","_player","_clanID","_invitedClanID","_inviteOwner","_clanHash","_members"];
_sessionID = _this select 0;
_accepted = (_this select 1) select 0;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if(isNull _player)then
	{
		throw "Invalid player!";
	};
	_clanID = _player getVariable ["ExileClanID",-1];
	if !(_clanID isEqualTo -1) then
	{
		throw "You are already in a family!";
	};
	if!(_player getVariable ["ExileClanInvite",false])then
	{
		throw "No pending family invites!";
	};
	_invitedClanID = _player getVariable ["ExileClanInviteID",-1];
	if(_invitedClanID isEqualTo -1)then
	{
		throw "Invalid family invite!";
	};
	_inviteOwner = _player getVariable ["ExileClanInviteOwner",objNull];
	if(_accepted)then
	{
		_clanHash = missionNameSpace getVariable [format["ExileServer_clan_%1",_invitedClanID],[]];
		if(_clanHash isEqualTo [])then
		{
			throw "Family hash is NULL!";
		};
		_members = _clanHash select 2;
		_members pushback [getPlayerUID _player,name _player];
		_clanHash set [2,_members];
		format["setAccountClanLink:%1:%2", _invitedClanID, getPlayerUID _player] call ExileServer_system_database_query_fireAndForget;
		missionNameSpace setVariable [format["ExileServer_clan_%1",_invitedClanID],_clanHash];
		_player setVariable ["ExileClanID", _invitedClanID];
		_player setVariable ["ExileClanData", _clanHash];
		_invitedClanID call ExileServer_system_clan_updateClients;
		[_inviteOwner, "toastRequest", ["InfoTitleOnly", [format ["%1 joined your family!", name _player]]]] call ExileServer_system_network_send_to;
	}
	else
	{
		[_inviteOwner, "toastRequest", ["InfoTitleOnly", [format ["%1 declined your family invite!", name _player]]]] call ExileServer_system_network_send_to;
	};
	_player setVariable ["ExileClanInvite",false];
	_player setVariable ["ExileClanInviteID",-1];
	_player setVariable ["ExileClanInviteOwner",objNull];
	[_sessionID,"clanInviteServerResponse",[_accepted]] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileServer_util_log;
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to join!", _exception]]] call ExileServer_system_network_send_to;
};