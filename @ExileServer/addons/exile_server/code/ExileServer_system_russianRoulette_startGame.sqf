/**
 * ExileServer_system_russianRoulette_startGame
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_chair","_deadBodies"];
ExileServerRussianRouletteStatus = 1;
_chair = ExileRouletteChairs select 0;
_deadBodies = _chair nearObjects ["Exile_Unit_Player", 20];
{
	if !(alive _x) then 
	{
		deleteVehicle _x;
	};
} 
forEach _deadBodies;
"Russian Roulette: Game starts!" call ExileServer_util_log;
["systemChatRequest", ["Russian Roulette starts!"]] call ExileServer_system_network_send_broadcast;
ExileServerRussianRouletteCurrentShot = 0;
ExileServerRussianRouletteAlivePlayers = ExileServerRussianRouletteAlivePlayers call ExileClient_util_array_shuffle;
call ExileServer_system_russianRoulette_letNextPlayerFire;
ExileServerRussianRouletteStartGameCountDownThread = nil;
