/**
 * ExileServer_system_network_event_onHandleDisconnect
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_unit","_id","_pos","_newUnitDeaths","_constructionObject","_sessionID"];
_unit = _this select 0;
_id = _this select 1;
_uid = _this select 2;
_name = _this select 3;
_pos = getPos _unit;
_newUnitDeaths = _unit getVariable ["ExileDeaths", 0];
if !(_uid in ["", "__SERVER__", "__HEADLESS__"]) then
{
	_constructionObject = _unit getVariable ["ExileConstructionObject", objNull];
	if !(isNull _constructionObject) then 
	{
		deleteVehicle _constructionObject;
	};
	if (_unit getVariable ["IsPlayingRussianRoulette", false]) then 
	{
		_unit call ExileServer_system_russianRoulette_event_onPlayerDisconnected;
		_unit setVariable ["ExileIsDead", false];
	};
	format["endAccountSession:%1", _uid] call ExileServer_system_database_query_fireAndForget;
	_sessionID = _unit getVariable ["ExileSessionID", ""];
	_sessionID call ExileServer_system_session_end;
	_unit setVariable ["ExileSessionID", nil];
	if !(_unit getVariable ["ExileIsDead", false]) then
	{
		if (_unit getVariable ["ExileIsHandcuffed", false]) then 
		{
			_unit setDamage 999;
			format["insertPlayerHistory:%1:%2:%3:%4:%5", _uid, _name, _pos select 0, _pos select 1, _pos select 2] call ExileServer_system_database_query_fireAndForget;
			format["deletePlayer:%1", _unit getVariable ["ExileDatabaseId", -1]] call ExileServer_system_database_query_fireAndForget;
			_unit setVariable ["ExileIsDead", true];
			_unit setVariable ["ExileName", _name, true]; 
			_unit call ExileServer_object_flies_spawn;
			_newUnitDeaths = _newUnitDeaths + 1;
			_unit setVariable ["ExileDeaths", _newUnitDeaths];
			format["addAccountDeath:%1", _uid] call ExileServer_system_database_query_fireAndForget;
			_unit call ExileServer_object_player_sendStatsUpdate;
			["systemChatRequest", [format["HANDCUFF LOGOUT: %1 has been killed.", name _unit]]] call ExileServer_system_network_send_broadcast;
		}
		else 
		{
			_unit call ExileServer_object_player_database_update;	
			deleteVehicle _unit;
			_unit = objNull;
		};
	};
};
if !(isNull _unit) then 
{
	[_unit] joinSilent (createGroup independent);
};
false