/**
 * ExileServer_system_russianRoulette_event_onPlayerLeft
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_playerObject","_buyInAmount","_playerMoney","_positionBefore","_directionBefore"];
_playerObject = _this;
_buyInAmount = getNumber (missionConfigFile >> "CfgExileRussianRoulette" >> "buyInAmount");
_playerMoney = _playerObject getVariable ["ExileMoney", 0];
_playerMoney = _playerMoney + _buyInAmount;
_playerObject setVariable ["ExileMoney", _playerMoney, true];
format["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
_positionBefore = _playerObject getVariable ["SavedRussianRoulettePosition", [0, 0, 0]];
_directionBefore = _playerObject getVariable ["SavedRussianRouletteDirection", 0];
_playerObject setVariable ["IsPlayingRussianRoulette", nil];
_playerObject setVariable ["SavedRussianRoulettePosition", nil];
_playerObject setVariable ["SavedRussianRouletteDirection", nil];
_playerObject setVariable ["RussianRouletteProbabilities", nil];
_playerObject setVariable ["RussianRouletteCurrentShot", nil];
format ["Russian Roulette: %1 has left the game.", name _playerObject] call ExileServer_util_log;
if (alive _playerObject) then 
{
	[_playerObject, "leaveRussianRouletteResponse", [_positionBefore, _directionBefore]] call ExileServer_system_network_send_to;
};
