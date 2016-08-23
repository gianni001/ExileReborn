/**
 * ExileServer_object_construction_network_repairConstructionRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_constructionObject","_object","_requestingPlayer","_repairKitClass","_databaseId"];
_sessionID = _this select 0;
_parameters = _this select 1;
_constructionObject = _parameters select 0;
try 
{
	if (isNull _object) then 
	{
		throw "Construction object is null!";
	};
	_requestingPlayer = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _requestingPlayer)then 
	{
		throw "Player null";
	};
	_repairKitClass = _constructionObject call ExileClient_util_breaching_getRepairMag;
	if(_repairKitClass isEqualTo "")then
	{
		throw "Invalid repair kit.";
	};
	if!(_repairKitClass in (magazines _requestingPlayer))then
	{
		throw "You do not have a repair kit.";
	};
	_databaseId = _constructionObject getVariable ["ExileDatabaseID",-1];
	if(_databaseId isEqualTo -1)then
	{
		Throw "database ID null";
	};
	_constructionObject setVariable ["ExileConstructionDamage",0,true];
	format ["updateDamage:0:%1",_databaseId] call ExileServer_system_database_query_fireAndForget;
	_constructionObject call ExileServer_util_setDamageTexture;
	[_requestingPlayer,"repairConstructionResponse",[_repairKitClass]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to repair!", _exception]]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;
};