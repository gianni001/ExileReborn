/**
 * ExileServer_object_player_network_resetPlayerRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_player"];
_sessionID = _this select 0;
_player = _sessionID call ExileServer_system_getPlayerObject;
if (!isNull _player) then
{
	deleteVehicle _player;
};
true