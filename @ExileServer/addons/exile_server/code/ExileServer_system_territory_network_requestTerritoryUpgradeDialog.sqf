/**
 * ExileServer_system_territory_network_requestTerritoryUpgradeDialog
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_flag","_moderators","_playerObject","_level"];
_sessionID = _this select 0;
_parameters = _this select 1;
_flag = _parameters select 0;
_moderators = _flag getVariable ["ExileTerritoryModerators",[]];
_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
if((getPlayerUID _playerObject) in _moderators)then
{
	_level = _flag getVariable ["ExileTerritoryLevel",0];
	[_sessionID,"territoryUpgradeDialogResponse",[_level]] call ExileServer_system_network_send_to;
}
else
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to upgrade!", "You need to have moderator rights."]]] call ExileServer_system_network_send_to;
};
true