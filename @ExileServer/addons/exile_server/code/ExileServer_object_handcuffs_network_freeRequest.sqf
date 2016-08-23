/**
 * ExileServer_object_handcuffs_network_freeRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_victimNetID","_player","_victim","_respect","_newScore"];
_sessionID = _this select 0;
_parameters = _this select 1;
_victimNetID = _parameters select 0;
try 
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then 
	{
		throw "Unknown player cannot free someone!";
	};
	if !(alive _player) then 
	{
		throw "The dead cannot free others!"; 
	};
	_victim = objectFromNetID _victimNetID;
	if (isNull _victim) then 
	{
		throw "Cannot free unknown victim!"; 
	};
	if !(_victim getVariable ["ExileIsHandcuffed", false]) then 
	{
		throw "Cannot free not-handcuffed ones!"; 
	};
	if !(_player call ExileClient_object_handcuffs_hasFreeItems) then 
	{
		throw "Missing tools to break free!"; 
	};
	["switchMoveRequest", [netId _victim, "Acts_AidlPsitMstpSsurWnonDnon_out"]] call ExileServer_system_network_send_broadcast;
	if ((getPlayerUID _player) isEqualTo (_victim getVariable ["ExileHostageTakerUID", ""])) then 
	{
		_respect = getNumber (configFile >> "CfgSettings" >> "Respect" >> "Handcuffs" >> "releasedByHostageTaker");
	}
	else 
	{
		_respect = getNumber (configFile >> "CfgSettings" >> "Respect" >> "Handcuffs" >> "releasedByHero");
	};
	[_victim, "freeRequest", [""]] call ExileServer_system_network_send_to;
	[_player, "freeResponse", [str _respect]] call ExileServer_system_network_send_to;
	_newScore = _player getVariable ["ExileScore", 0];
	_newScore = _newScore + _respect;
	_player setVariable ["ExileScore", _newScore];
	format["setAccountScore:%1:%2", _newScore, getPlayerUID _player] call ExileServer_system_database_query_fireAndForget;
	_victim setVariable ["ExileIsHandcuffed", false, true];
	_victim setVariable ["ExileHostageTakerNetID", nil];
	_victim setVariable ["ExileHostageTakerUID", nil];
}
catch 
{
	_exception call ExileServer_util_log;
};