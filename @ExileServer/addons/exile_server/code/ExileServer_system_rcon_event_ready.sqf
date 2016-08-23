/**
 * ExileServer_system_rcon_event_ready
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
if (ExileServerIsLocked) then
{
	call ExileServer_system_rcon_setupEvents;
	"Rcon events initialized!" call ExileServer_util_log;
	"#unlock" call ExileServer_system_rcon_event_sendCommand;
	ExileServerIsLocked = false;
	"Server unlocked and accepting players. Have fun! :)" call ExileServer_util_log;
};
true