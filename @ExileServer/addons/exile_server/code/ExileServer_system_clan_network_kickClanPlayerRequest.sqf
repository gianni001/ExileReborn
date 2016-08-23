/**
 * ExileServer_system_clan_network_kickClanPlayerRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_requestedKickPlayerUID","_player","_clanID","_clanHash","_clanMembers","_index","_memberName","_kickPlayer"];
_sessionID = _this select 0;
_requestedKickPlayerUID = (_this select 1) select 0;
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
	if!((getPlayerUID _player) isEqualTo (_clanHash select 1))then
	{
		throw "You are not the papa!";
	};
	_clanMembers = _clanHash select 2;
	_index = [_clanMembers,_requestedKickPlayerUID] call ExileClient_util_find;
	if(_index isEqualTo -1)then
	{
		throw "You are not in a family!";
	};
	_memberName = (_clanMembers select _index) select 1; 
	_clanMembers deleteAt _index;
	_clanHash set [2,_clanMembers];
	format["unLinkClanLink:%1", _requestedKickPlayerUID] call ExileServer_system_database_query_fireAndForget;
	missionNameSpace setVariable [format["ExileServer_clan_%1",_clanID],_clanHash];
	_clanID call ExileServer_system_clan_updateClients;
	_kickPlayer = _requestedKickPlayerUID call ExileClient_util_player_objectFromPlayerUid;
	if!(isNull _kickPlayer)then
	{
		_memberName = name _kickPlayer;
		_kickPlayer setVariable ["ExileClanID",-1];
		_kickPlayer setVariable ["ExileData",[]];
		[_kickPlayer, "updateClanGotKicked", ["ErrorTitleOnly",["You have been kicked from your family!"]]] call ExileServer_system_network_send_to;
	};
	[_sessionID, "toastRequest", ["SuccessTitleOnly", [format["%1 was kicked from the family!", _memberName]]]] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileServer_util_log;
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to kick!", _exception]]] call ExileServer_system_network_send_to;
};