/**
 * ExileServer_system_russianRoulette_event_onPlayerDied
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_playerObject"];
_playerObject = _this;
format ["Russian Roulette: %1 died!", name _playerObject] call ExileServer_util_log;
{
	if (_x isEqualTo _playerObject) exitWith
	{
		ExileServerRussianRouletteAlivePlayers deleteAt _forEachIndex;
	};
}
forEach ExileServerRussianRouletteAlivePlayers;
if ((count ExileServerRussianRouletteAlivePlayers) isEqualTo 1) then 
{
	(ExileServerRussianRouletteAlivePlayers select 0) call ExileServer_system_russianRoulette_event_onPlayerWin;
}
else 
{
	call ExileServer_system_russianRoulette_letNextPlayerFire;
};