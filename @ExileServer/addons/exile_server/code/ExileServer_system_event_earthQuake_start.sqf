/**
 * ExileServer_system_event_earthQuake_start
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_i","_magnitude","_maxPlayers","_n","_player","_buildings","_building"];
for "_i" from 1 to 4 do
{
	format ["Earth Quake - Rumble %1...", _i] call ExileServer_util_log;
	_magnitude = 5 - _i;
	["playEarthQuakeEffectRequest", [_magnitude]] call ExileServer_system_network_send_broadcast;
	uiSleep 4;
	_maxPlayers = (random (count allPlayers)) max 1;
	for "_n" from 1 to _maxPlayers do
	{
		_player = selectRandom allPlayers;
		if !(isNull _player) then 
		{
			_buildings = _player nearObjects ["Building", 300];
			if !(_buildings isEqualTo []) then 
			{
				{
					_building = _x;
					if ((random 100) < ([6, 3, 2, 1] select (_i - 1))) then 
					{
						if !((getPos _building) call ExileClient_util_world_isInTraderZone) then
						{
							_building setDamage 1;
						};
					};
				}
				forEach _buildings;
			};
		};
	};
	if (_i < 4) then
	{
		uiSleep 25 + (random (_i * 30));
	};
};
