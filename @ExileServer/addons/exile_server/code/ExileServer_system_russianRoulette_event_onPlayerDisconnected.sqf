/**
 * ExileServer_system_russianRoulette_event_onPlayerDisconnected
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_playerObject"];
format ["Russian Roulette: %1 disconnected while playing!", name _this] call ExileServer_util_log;
format ["Russian Roulette: Ending game..."] call ExileServer_util_log;
{
	_playerObject = objectFromNetid (_x select 0);
	if !(isNull _playerObject) then 
	{
		_playerObject call ExileServer_system_russianRoulette_event_onPlayerLeft;
	};
}
forEach ExileServerRussianRoulettePlayers;
call ExileServer_system_russianRoulette_initialize;