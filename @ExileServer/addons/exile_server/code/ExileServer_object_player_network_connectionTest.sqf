/**
 * ExileServer_object_player_network_connectionTest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID"];
_sessionID = _this select 0;
[_sessionID, "connectionTest", [true]] call ExileServer_system_network_send_to;
true