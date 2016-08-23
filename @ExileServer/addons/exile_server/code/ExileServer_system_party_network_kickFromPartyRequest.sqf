/**
 * ExileServer_system_party_network_kickFromPartyRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_playerToKick"];
_sessionID = _this select 0;
_parameters = _this select 1;
_playerToKick = objectFromNetId (_parameters select 0);
[_playerToKick, "kickFromPartyRequest", [""]] call ExileServer_system_network_send_to;
true