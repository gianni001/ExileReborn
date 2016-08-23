/**
 * ExileServer_system_clan_network_addPolyRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_player","_clanID","_clanHash","_positions","_color","_maxAmountOfPolys","_maxAmountOfPolyLines","_data","_extDB2Message","_polyID","_polys"];
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
	_positions = _parameters select 0;
	_color = _parameters select 1;
	if!((count _color) isEqualTo 4)then
	{
		throw "FuckOff and burn in fire #5";
	};
	_maxAmountOfPolys = getNumber(missionConfigFile >> "CfgClans" >> "maximumPolys");
	if(count(_clanHash select 4) >= _maxAmountOfPolys)then
	{
		throw "Maximum polys reached for family!";
	};
	_maxAmountOfPolyLines = getNumber(missionConfigFile >> "CfgClans" >> "maximumPolyNode");
	if(count _positions > _maxAmountOfPolyLines)then
	{
		throw "Too many poly nodes!";
	};
	_data = [_clanID,_positions,_color];
	_extDB2Message = ["addPoly", _data] call ExileServer_util_extDB2_createMessage;
	_polyID = _extDB2Message call ExileServer_system_database_query_insertSingle;
	_polys = _clanHash select 4;
	_parameters pushback _polyID;
	_polys pushback _parameters;
	_clanHash set [4,_polys];
	missionNameSpace setVariable [format["ExileServer_clan_%1",_clanID],_clanHash];
	_clanID call ExileServer_system_clan_updatePolys;
	[_sessionID, "toastRequest", ["SuccessTitleOnly", ["Added a family polygon!", _exception]]] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileServer_system_util_log;
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to add polygon!", _exception]]] call ExileServer_system_network_send_to;
};