/**
 * ExileServer_system_rcon_event_kickAll
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_i"];
for "_i" from 0 to ((playableSlotsNumber independent) - 1) do 
{
	format ["#kick %1", _i] call ExileServer_system_rcon_event_sendCommand;
};
true