/**
 * ExileServer_system_event_initialize
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_events"];
_events = getArray (configFile >> "CfgSettings" >> "Events" >> "enabledEvents");
{
	missionNamespace setVariable [format ["ExileServerEvent%1LastExecutedAt", _x], 0];
}
forEach _events;
[60, ExileServer_system_event_thread_spawn, [], true] call ExileServer_system_thread_addtask;