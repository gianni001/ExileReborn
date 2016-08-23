/**
 * ExileServer_system_network_setupEventHandlers
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
if(getNumber(configFile >> "CfgSettings" >> "CBA" >> "useStackedEH") isEqualTo 1)then
{
	["ExileOnPlayerConnected", "onPlayerConnected", { [_uid, _name] call ExileServer_system_network_event_onPlayerConnected; }] call BIS_fnc_addStackedEventHandler;
	["ExileOnPlayerDisconnected", "onPlayerDisconnected", { [_uid, _name] call ExileServer_system_network_event_onPlayerDisconnected; }] call BIS_fnc_addStackedEventHandler;
	"Added STACKED EH!" call ExileServer_util_log;
	if (getNumber(configFile >> "CfgSettings" >> "CBA" >> "iReallyWantToGetHackedAndImRetarded") isEqualTo 1)then
	{
		"Full retard mode active." call ExileServer_util_log;
	}
	else
	{
		CBAr = compileFinal "format['CBAr called with: %1 ¯\_(ツ)_/¯',_this] call ExileServer_util_log;";
		CBAt = compileFinal "format['CBAt called with: %1 ¯\_(ツ)_/¯',_this] call ExileServer_util_log;";
	};
}
else
{
	onPlayerConnected {[_uid, _name] call ExileServer_system_network_event_onPlayerConnected};
	onPlayerDisconnected {[_uid, _name] call ExileServer_system_network_event_onPlayerDisconnected};
};
addMissionEventHandler ["HandleDisconnect", { _this call ExileServer_system_network_event_onHandleDisconnect; }];