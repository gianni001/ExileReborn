/**
 * ExileServer_system_breaching_network_breachingStart
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_constructionObject","_player","_explosiveClassName","_breachingClassname","_territory","_charge","_Veh"];
_sessionID = _this select 0;
_parameters = _this select 1;
_constructionObject = _parameters select 0;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if(isNull _player)then
	{
		throw "You do not exist! :)";
	};
	_explosiveClassName = _constructionObject call ExileClient_util_breaching_getBreachingMag;
	if(_explosiveClassName isEqualTo -1)then
	{
		throw "Invalid placing object";
	};
	_breachingClassname = (_explosiveClassName select 1);
	if((_explosiveClassName select 0) isEqualTo 0)then
	{
		if!(_breachingClassname in (magazines _player))then
		{
			throw (format ["You dont have: %1",_breachingClassname]);
		};
	}
	else
	{
		if!((backpack _player) isEqualTo (_breachingClassname))then
		{
			throw (format ["You dont have: %1",_breachingClassname]);
		};
	};
	if((_constructionObject getVariable ["ExileDatabaseID",-1]) isEqualTo -1)then
	{
		throw "Not a persistant?";
	};
	if(_constructionObject getVariable ["ExileBreachingActive",false])then
	{
		throw "You can only place one charge at a time.";
	};
	_territory = _player call ExileClient_util_world_getTerritoryAtPosition;
	if(isNull _territory)then
	{
		throw "Invalid Territory?";
	};
	if((getPlayerUID _player) in (_territory getVariable ["ExileTerritoryBuildRights",[]]))then
	{
		throw "You cannot breach through your own walls!";
	};
	_charge = createVehicle [((_explosiveClassName select 2) + "_Veh"), [0,0,0], [], 0, "CAN_COLLIDE"];
	_player setVariable ["ExileBreachingObject",_constructionObject];
	_player setVariable ["ExileBreachingCharge",_charge];
	_constructionObject setVariable ["ExileBreaching",true,true];
	if!(_charge setOwner (owner _player))then
	{
		[_charge, _player] call ExileServer_system_swapOwnershipQueue_add;
	};
	[_sessionID,"breachingResponse",[_charge,_constructionObject]] call ExileServer_system_network_send_to; 
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to breach!", _exception]]] call ExileServer_system_network_send_to;
};