/**
 * ExileServer_object_player_network_switchMoveRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionId","_parameters","_playerNetID","_move","_player"];
_sessionId = _this select 0;
_parameters = _this select 1;
_playerNetID = _parameters select 0;
_move = _parameters select 1;
_player = objectFromNetId _playerNetID;
if !(isNull _player) then
{
	["switchMoveRequest", _parameters, _sessionId] call ExileServer_system_network_send_broadcast;
};
