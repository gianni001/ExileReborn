private ["_buildings","_buildingToSpawn","_positionsToSpawn"];

_chance = 50;

if (ExileReborn_playerIsWounded) then {_chance = _chance + 25;};
if (ExileReborn_playerIsInfected) then {_chance = _chance + 40;};

if (_chance >= random 100) then
{
	_buildings = player nearObjects ["Building", 600];
	if !(_buildings isEqualTo []) then 
	{
		_buildingToSpawn = selectRandom _buildings;
		_positionsToSpawn = _buildingToSpawn buildingPos -1;

		["spawnZombiesNearTarget", [_positionsToSpawn]] call ExileClient_system_network_send;
	};
};	