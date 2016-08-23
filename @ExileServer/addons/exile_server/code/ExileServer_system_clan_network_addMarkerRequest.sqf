/**
 * ExileServer_system_clan_network_addMarkerRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_player","_clanID","_clanHash","_icon","_color","_position","_iconSize","_text","_textSize","_maxChars","_alphabet","_forbiddenCharacter","_maxAmountOfMarkers","_data","_extDB2Message","_markerID","_markers"];
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
	_icon = _parameters select 0;
	_color = _parameters select 1;
	_position = _parameters select 2;
	_iconSize = _parameters select 3;
	_text = _parameters select 4;
	_textSize = _parameters select 5;
	_maxChars = getNumber (missionConfigFile >> "CfgClans" >> "maximumIconText");
	if((count _text) > _maxChars)then
	{
		throw format ["To big marker text MAX : %1",_maxChars];
	};
	_alphabet = getText (missionConfigFile >> "CfgClans" >> "clanNameAlphabet");
	_forbiddenCharacter = [_text, _alphabet] call ExileClient_util_string_containsForbiddenCharacter;
	if !(_forbiddenCharacter isEqualTo -1) then 
	{
		throw "Invalid character in input!";
	};
	if!((count _color) isEqualTo 4)then
	{
		throw "FuckOff and die in fire!";
	};
	if!((count _position) isEqualTo 2)then
	{
		throw "FuckOff and die in fire! #2";
	};
	_forbiddenCharacter = [_icon, _alphabet] call ExileClient_util_string_containsForbiddenCharacter;
	if !(_forbiddenCharacter isEqualTo -1) then 
	{
		throw "FuckOff and die in fire! #3";
	};
	_maxAmountOfMarkers = getNumber(missionConfigFile >> "CfgClans" >> "maximumIcons");
	if(count(_clanHash select 3) >= _maxAmountOfMarkers)then
	{
		throw "Maximum markers reached for family!";
	};
	_data = [_clanID,_position,_color,_icon,_iconSize,_text,_textSize];
	_extDB2Message = ["addMarker", _data] call ExileServer_util_extDB2_createMessage;
	_markerID = _extDB2Message call ExileServer_system_database_query_insertSingle;
	_markers = _clanHash select 3;
	_parameters pushback _markerID;
	_markers pushback _parameters;
	_clanHash set [3,_markers];
	missionNameSpace setVariable [format["ExileServer_clan_%1",_clanID],_clanHash];
	_clanID call ExileServer_system_clan_updateMarkers;
	[_sessionID, "toastRequest", ["SuccessTitleOnly", ["Added a family marker!"]]] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileServer_system_util_log;
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to add marker!", _exception]]] call ExileServer_system_network_send_to;
};