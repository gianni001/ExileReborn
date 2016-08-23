/**
 * ExileServer_system_clan_network_leaveClanRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_player","_clanID","_clanHash","_playerUID","_isLeader","_leaderUID","_clanMembers","_clanMembersCount","_index","_message"];
_sessionID = _this select 0;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if(isNull _player)then
	{
		throw "You do not exist!";
	};
	_clanID = _player getVariable ["ExileClanID",-1];
	if(_clanID isEqualTo -1)then
	{
		throw "You are not in a family!";
	};	
	_clanHash = missionNameSpace getVariable [format["ExileServer_clan_%1",_clanID],[]];
	if(_clanHash isEqualTo [])then
	{
		throw "Broken family data!";
	};	
	_playerUID = (getPlayerUID _player);
	_isLeader = _playerUID isEqualTo (_clanHash select 1);
	_leaderUID = _clanHash select 1;
	_clanMembers = _clanHash select 2;
	_clanMembersCount = count _clanMembers;
	if(_clanMembersCount > 1)then
	{
		_index = [_clanMembers,_playerUID] call ExileClient_util_find;
		if(_index isEqualTo -1)then
		{
			throw "Something is really wrong! Contact an admin!";
		};
		_clanMembers deleteAt _index;
		_clanHash set [2,_clanMembers];
		if(_isLeader)then
		{
			_leaderUID = ((_clanMembers select 0) select 0);
			_clanHash set [1,_leaderUID];
			format["updateClanLeader:%1:%2",_leaderUID,_clanID] call ExileServer_system_database_query_fireAndForget;
			_message = format ["You have left the family. %1 has been promoted to be the new papa.",(_clanMembers select 0) select 1];
		}
		else
		{
			_message = "You have left the family.";
		};
		format["unLinkClanLink:%1", _playerUID] call ExileServer_system_database_query_fireAndForget;
		missionNameSpace setVariable [format["ExileServer_clan_%1",_clanID],_clanHash];
		_clanID call ExileServer_system_clan_updateClients;
	}
	else
	{
		missionNameSpace setVariable [format["ExileServer_clan_%1",_clanID],nil];
		format["deleteClan:%1",_clanID] call ExileServer_system_database_query_fireAndForget;
		_message = "The family has been disbanded.";
	};
	_player setVariable ["ExileClanID", -1];
	_player setVariable ["ExileData", []];
	[_sessionID,"leaveClanResponse",[_clanMembersCount > 1,_message]] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileServer_util_log;
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to leave!", _exception]]] call ExileServer_system_network_send_to;
};