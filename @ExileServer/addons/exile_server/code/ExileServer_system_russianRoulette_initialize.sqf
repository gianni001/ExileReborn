/**
 * ExileServer_system_russianRoulette_initialize
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_chair"];
if !(isNil "ExileServerRussianRouletteStartGameCountDownThread") then 
{
	terminate ExileServerRussianRouletteStartGameCountDownThread;
	ExileServerRussianRouletteStartGameCountDownThread = nil;
};
ExileServerRussianRouletteStatus = 0;
ExileServerRussianRoulettePlayers = [];
ExileServerRussianRouletteAlivePlayers = [];
ExileServerRussianRouletteCurrentShot = -1;
ExileServerRussianRoulettePotValue = 0;
ExileServerRussianRouletteCountDownEndTime = -1;
ExileServerRussianRouletteCurrentPlayerNetId = "";
if (isNil "ExileRouletteChairPositions") exitWith
{
	"There are no Russian Roulette chairs defined. Russian Roulette will not work!" call ExileServer_util_log;
	ExileServerRussianRouletteStatus = 1;
	ExileRouletteChairs = [];
	ExileRouletteChairPositions = [];
};
{
	_chair = ExileRouletteChairs select _forEachIndex;
    _chair setDir (deg (_x select 1));
    _chair setPosWorld (_x select 0);
}
forEach ExileRouletteChairPositions;
"Russian Roulette: Game initialized." call ExileServer_util_log;
