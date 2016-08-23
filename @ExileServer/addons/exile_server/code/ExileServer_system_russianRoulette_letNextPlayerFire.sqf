/**
 * ExileServer_system_russianRoulette_letNextPlayerFire
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_playerObject","_currentShot","_probabilities","_nextShotIsFatal"];
_playerObject = ExileServerRussianRouletteAlivePlayers select 0;
ExileServerRussianRouletteAlivePlayers deleteAt 0;
ExileServerRussianRouletteAlivePlayers pushBack _playerObject;
format ["Russian Roulette: %1 is asked to fire next.", name _playerObject] call ExileServer_util_log;
ExileServerRussianRouletteCountDownEndTime = serverTime + 30;
ExileServerRussianRouletteCurrentPlayerNetId = netId _playerObject;
ExileServerRussianRouletteCurrentShot = ExileServerRussianRouletteCurrentShot + 1;
_currentShot = _playerObject getVariable ["RussianRouletteCurrentShot", -1];
_currentShot = _currentShot + 1;
_playerObject setVariable ["RussianRouletteCurrentShot", _currentShot];
_probabilities = _playerObject getVariable ["RussianRouletteProbabilities", [true, true, true, true, true, true]];
_nextShotIsFatal = _probabilities select _currentShot;
call ExileServer_system_russianRoulette_broadcastGameStatus;
[_playerObject, "fireRussianRouletteRevolverRequest", [_nextShotIsFatal]] call ExileServer_system_network_send_to;