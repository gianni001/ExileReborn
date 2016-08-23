/**
 * ExileServer_system_rcon_setupEvents
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_restartTime","_useRestartMessages"];
_restartTime = getArray (configFile >> "CfgSettings" >> "RCON" >> "restartTimer");
ExileServerRestartTime = ((_restartTime select 0) * 60) + (_restartTime select 1);
ExileServerKickTime = getNumber (configFile >> "CfgSettings" >> "RCON" >> "kickTime");
ExileServerLockTime = getNumber (configFile >> "CfgSettings" >> "RCON" >> "restartAutoLock");
ExileServerUseAutokick = getNumber (configFile >> "CfgSettings" >> "RCON" >> "useAutoKick");
_useRestartMessages = getNumber (configFile >> "CfgSettings" >> "RCON" >> "useRestartMessages");
if(_useRestartMessages isEqualTo 1)then
{
	ExileServerRestartMessages = getArray(configFile >> "CfgSettings" >> "RCON" >> "restartWarningTime");
}
else
{
	ExileServerRestartMessages = false;
};
[
	30,
	ExileServer_system_rcon_thread_check,
	[
		ExileServerRestartTime,
		ExileServerUseAutokick,
		ExileServerKickTime,
		ExileServerLockTime
	],
	true
] 
call ExileServer_system_thread_addTask;
true