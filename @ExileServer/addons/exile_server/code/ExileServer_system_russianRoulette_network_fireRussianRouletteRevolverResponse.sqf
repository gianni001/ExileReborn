/**
 * ExileServer_system_russianRoulette_network_fireRussianRouletteRevolverResponse
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_playerObject"];
_sessionID = _this select 0;
_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
format ["Russian Roulette: %1 has fired a dry shot.", name _playerObject] call ExileServer_util_log;
call ExileServer_system_russianRoulette_letNextPlayerFire;