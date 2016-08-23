/**
 * ExileServer_system_breaching_network_chargePlanted
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_player","_constructionObject","_charge"];
_sessionID = _this select 0;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then
	{
		throw "You do not exist! :)";
	};
	_constructionObject = _player getVariable ["ExileBreachingObject",objNull];
	if (isNull _constructionObject) then
	{
		throw "Construction null!";
	};
	_charge = _player getVariable ["ExileBreachingCharge",objNull];
	if (isNull _charge) then
	{
		throw "Charge null!";
	};
	ExileServerBreachingCharges pushBack [_charge, _constructionObject, getPlayerUID _player];
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to breach!", _exception]]] call ExileServer_system_network_send_to;
};