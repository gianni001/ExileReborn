/**
 * ExileServer_object_player_network_hideBodyRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionId","_parameters","_corpse","_player","_sessionID"];
_sessionId = _this select 0;
_parameters = _this select 1;
_corpse = _parameters select 0;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if(isNull _player)then
	{
		throw "player NULL";
	};
	if(isNull _corpse)then
	{
		throw "corpse NULL";
	};
	if !('Exile_Melee_Shovel' isEqualTo (currentWeapon _player)) then
	{
		throw "You need a shovel to do that.";
	};
	if !((typeOf _corpse) isEqualTo "Exile_Unit_Player") then 
	{
		throw "You can only bury players.";
	};
	if !(_corpse getVariable ["ExileIsDead", false]) then
	{
		throw "You can only bury the dead.";
	};
	if (_player getVariable ["ExileIsDead", false]) then
	{
		throw "You are too dead for this.";
	};
	deleteVehicle _corpse;
	[_sessionID, "toastRequest", ["SuccessTitleOnly", ["Corpse hidden!"]]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to bury corpse!", _exception]]] call ExileServer_system_network_send_to;
};
true