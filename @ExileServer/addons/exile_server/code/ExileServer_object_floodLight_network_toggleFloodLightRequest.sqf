/**
 * ExileServer_object_floodLight_network_toggleFloodLightRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_floodLightNetID","_damage","_floodLight","_player"];
_sessionID = _this select 0;
_parameters = _this select 1;
_floodLightNetID = _parameters select 0;
_damage = _parameters select 1;
_floodLight = objectFromNetId _floodLightNetID;
if (local _floodLight) then
{
	_floodLight setHit ["light_1_hitpoint", _damage];
}
else 
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	_floodLight setOwner (owner _player);
	[_sessionID, "toggleFloodLightRequest", [_floodLightNetID, _damage]] call ExileServer_system_network_send_to;
};
true