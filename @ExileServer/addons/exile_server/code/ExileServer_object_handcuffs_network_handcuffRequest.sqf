/**
 * ExileServer_object_handcuffs_network_handcuffRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_victimNetID","_hostageTaker","_victim","_respect","_newScore"];
_sessionID = _this select 0;
_parameters = _this select 1;
_victimNetID = _parameters select 0;
try 
{
	_hostageTaker = _sessionID call ExileServer_system_session_getPlayerObject;
	_victim = objectFromNetID _victimNetID;
	if (isNull _hostageTaker) then 
	{
		throw "Unknown player cannot handcuff someone!";
	};
	if !(alive _hostageTaker) then 
	{
		throw "The dead cannot handcuff others!"; 
	};
	if (isNull _victim) then 
	{
		throw "Cannot handcuff unknown victim!"; 
	};
	if !(isPlayer _victim) then 
	{
		throw "Cannot handcuff bots!"; 
	};
	if !(_victim isKindOf "Exile_Unit_Player") then 
	{
		throw "Can only handcuff players!"; 
	};
	if !(alive _victim) then 
	{
		throw "Dead people cannot be handcuffed!"; 
	};
	if !("Exile_Item_ZipTie" in (magazines _hostageTaker)) then 
	{
		throw "Cannot handcuff others without handcuffs!"; 
	};
	if (_victim getVariable ["ExileIsHandcuffed", false]) then 
	{
		throw "Cannot double handcuff someone!"; 
	};
	if ((_hostageTaker distance _victim) > 2) then 
	{
		throw "No long distance bondage!"; 
	};
	_victim setVariable ["ExileIsHandcuffed", true, true];
	_victim setVariable ["ExileHostageTakerNetID", netId _hostageTaker];
	_victim setVariable ["ExileHostageTakerUID", getPlayerUID _hostageTaker]; 
	["switchMoveRequest", [_victimNetID, "Acts_AidlPsitMstpSsurWnonDnon_loop"]] call ExileServer_system_network_send_broadcast;
	[_victim, "handcuffRequest", [netId _hostageTaker]] call ExileServer_system_network_send_to;
	_respect = getNumber (configFile >> "CfgSettings" >> "Respect" >> "Handcuffs" >> "trapping");
	[_hostageTaker, "handcuffResponse", [str _respect]] call ExileServer_system_network_send_to;
	_newScore = _hostageTaker getVariable ["ExileScore", 0];
	_newScore = _newScore + _respect;
	_hostageTaker setVariable ["ExileScore", _newScore];
	format["setAccountScore:%1:%2", _newScore, getPlayerUID _hostageTaker] call ExileServer_system_database_query_fireAndForget;
}
catch 
{
	_exception call ExileServer_util_log;
};