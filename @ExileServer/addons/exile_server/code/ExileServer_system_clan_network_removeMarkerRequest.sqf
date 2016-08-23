/**
 * ExileServer_system_clan_network_removeMarkerRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_player","_clanID","_clanHash","_array","_markerID","_markerArray","_index"];
_sessionID = _this select 0;
_parameters = _this select 1;
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
	_array = _parameters select 0;
	_markerID = _parameters select 1;
	_markerArray = _clanHash select _array;
	_index = [_markerArray,_markerID] call ExileClient_util_find;
	if(_index isEqualTo -1)then
	{
		throw "Marker not owned by your family!";
	};	
	format["deleteMarker:%1",_markerID] call ExileServer_system_database_query_fireAndForget;
	_markerArray deleteAt _index;
	_clanHash set [_array,_markerArray];
	missionNameSpace setVariable [format ["ExileServer_clan_%1",_clanID],_clanHash];
	if(_array isEqualTo 3)then
	{
		_clanID call ExileServer_system_clan_updateMarkers;
	}
	else
	{
		_clanID call ExileServer_system_clan_updatePolys;
	};
	[_sessionID, "toastRequest", ["SuccessTitleOnly", ["Marker has been removed!"]]] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileServer_system_util_log;
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to remove!", _exception]]] call ExileServer_system_network_send_to;
};