/**
 * ExileServer_system_russianRoulette_event_onPlayerWin
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_playerObject","_playerMoney","_positionBefore","_directionBefore"];
_playerObject = _this;
["Russian Roulette: %1 has won the game and %2 pop tabs!", name _playerObject, ExileServerRussianRoulettePotValue] call ExileServer_util_log;
["systemChatRequest", [format ["%1 has won a round of Russian Roulette!", name _playerObject]]] call ExileServer_system_network_send_broadcast;
_playerMoney = _playerObject getVariable ["ExileMoney", 0];
_playerMoney = _playerMoney + ExileServerRussianRoulettePotValue;
_playerObject setVariable ["ExileMoney", _playerMoney, true];
format["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
_positionBefore = _playerObject getVariable ["SavedRussianRoulettePosition", [0, 0, 0]];
_directionBefore = _playerObject getVariable ["SavedRussianRouletteDirection", 0];
_playerObject setVariable ["IsPlayingRussianRoulette", nil];
_playerObject setVariable ["SavedRussianRoulettePosition", nil];
_playerObject setVariable ["SavedRussianRouletteDirection", nil];
_playerObject setVariable ["RussianRouletteProbabilities", nil];
_playerObject setVariable ["RussianRouletteCurrentShot", nil];
[_playerObject, "winRussianRouletteRequest", [_positionBefore, _directionBefore, ExileServerRussianRoulettePotValue]] call ExileServer_system_network_send_to;
call ExileServer_system_russianRoulette_initialize;