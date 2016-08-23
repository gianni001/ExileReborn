/**
 * ExileServer_system_breaching_network_breachingPlaceRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_position","_vectorUP","_charge","_player","_constructionObject","_explosiveClassName"];
_sessionID = _this select 0;
_parameters = _this select 1;
_position = _parameters select 0;
_vectorUP = _parameters select 1;
_charge = _parameters select 2;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if(isNull _player)then
	{
		throw "You do not exist! :)";
	};
	_constructionObject = _player getVariable ["ExileBreachingObject",objNull];
	if(isNull _constructionObject)then
	{
		throw "Construction object null";
	};
	_explosiveClassName = _constructionObject call ExileClient_util_breaching_getBreachingMag;
	if(_explosiveClassName isEqualTo -1)then
	{
		throw "Invalid placing object";
	};
	if((_explosiveClassName select 0) isEqualTo 0)then
	{
		if!((_explosiveClassName select 1) in (magazines _player))then
		{
			throw (format ["You dont have: %1",_explosiveClassName select 1]);
		};
	}
	else
	{
		if!((backpack _player) isEqualTo (_explosiveClassName select 1))then
		{
			throw (format ["You dont have: %1",_explosiveClassName select 1]);
		};
	};
	if(isNull _charge)then
	{
		throw "charge null";
	};
	[_sessionID,"breachingPlaceResponse",[_charge]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to breach!", _exception]]] call ExileServer_system_network_send_to;
};
