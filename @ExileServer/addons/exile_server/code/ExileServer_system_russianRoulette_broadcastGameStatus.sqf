/**
 * ExileServer_system_russianRoulette_broadcastGameStatus
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_playerInfo","_player","_currentShot"];
_playerInfo = [];
{
	_player = objectFromNetid (_x select 0);
	_currentShot = 0;
	if !(isNull _player) then 
	{
		_currentShot = (_player getVariable ["RussianRouletteCurrentShot", 0]) + 1;
	};
	_playerInfo pushBack
	[
		_x select 0,
		_x select 1,
		_currentShot
	];
}
forEach ExileServerRussianRoulettePlayers;
{
	[
		_x, 
		"updateRussianRouletteGameStatusRequest", 
		[
			ExileServerRussianRouletteStatus,
			ExileServerRussianRoulettePotValue, 
			_playerInfo,
			ExileServerRussianRouletteCurrentPlayerNetId,
			ExileServerRussianRouletteCurrentShot,
			ExileServerRussianRouletteCountDownEndTime
		]
	] call ExileServer_system_network_send_to;
}
forEach ExileServerRussianRouletteAlivePlayers;