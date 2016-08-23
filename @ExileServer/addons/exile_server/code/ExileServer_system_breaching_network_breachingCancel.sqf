/**
 * ExileServer_system_breaching_network_breachingCancel
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_charge","_player","_constructionObject"];
_sessionID = _this select 0;
_parameters = _this select 1;
_charge = _parameters select 0;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if(isNull _player)then
	{
		throw "You do not exist! :)";
	};
	if(isNull _charge)then
	{
		throw "Charge is null";
	};
	_constructionObject = _player getVariable ["ExileBreachingObject",objNull];
	if(isNull _constructionObject)then
	{
		throw "Breaching object is null";
	};
	_constructionObject setVariable ["ExileBreaching",false,true];
	_player setVariable ["ExileBreachingObject",objNull];
	_player setVariable ["ExileBreachingCharge",objNull];
	deleteVehicle _charge;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to breach!", _exception]]] call ExileServer_system_network_send_to;
};