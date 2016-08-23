/**
 * ExileServer_system_rcon_initialize
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_useAutoLock","_passwordCorrect"];
_useAutoLock = getNumber(configFile >> "CfgSettings" >> "RCON" >> "useAutoLock");
if (_useAutoLock isEqualTo 1) then
{
	_passwordCorrect = "#lock" call ExileServer_system_rcon_event_sendCommand;
	if (_passwordCorrect) then
	{
		"ServerPassword MATCH! server locked for init" call ExileServer_util_log;
		ExileServerIsLocked = true;
		ExilePasswordMatch = true;
		ExileServerRestartMode = false;
		call ExileServer_system_rcon_event_kickAll;
	}
	else
	{
		"ServerPassword MISMATCH!!! rcon features DISABLED!" call ExileServer_util_log;
		ExilePasswordMatch = false;
		ExileServerIsLocked = false;
	};
}
else 
{
	ExilePasswordMatch = false;
	ExileServerIsLocked = false;
};