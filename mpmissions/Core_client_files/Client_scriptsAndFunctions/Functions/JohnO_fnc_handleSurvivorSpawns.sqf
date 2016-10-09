private ["_chance","_buildings","_positionsToSpawn","_buildingPositions"];

_chance = 10;
_positionsToSpawn = [];

if (_chance >= random 100) then
{
	_buildings = player nearObjects ["House", 300];
	{
		if !(_buildings isEqualTo []) then 
		{
			_buildingPositions = _x buildingPos -1;
			{
				_positionsToSpawn pushBack _x;
			} forEach _buildingPositions;	
		};
	} forEach _buildings;
	if ((count _positionsToSpawn) > 0) then
	{	
		["spawnSurvivorNearTarget", [_positionsToSpawn]] call ExileClient_system_network_send;
	};	
};