private ["_buildings","_buildingToSpawn","_positionsToSpawn","_zombies","_nearFlags"];
_zombies =
[
	"RyanZombieC_man_1slow","RyanZombieC_man_polo_1_Fslow","RyanZombieC_man_polo_2_Fslow","RyanZombieC_man_polo_4_Fslow","RyanZombieC_man_polo_5_Fslow","RyanZombieC_man_polo_6_Fslow","RyanZombieC_man_p_fugitive_Fslow","RyanZombieC_man_w_worker_Fslow","RyanZombieC_man_hunter_1_Fslow",
	"RyanZombieC_man_1medium","RyanZombieC_man_polo_1_Fmedium","RyanZombieC_man_polo_2_Fmedium","RyanZombieC_man_polo_4_Fmedium","RyanZombieC_man_polo_5_Fmedium","RyanZombieC_man_polo_6_Fmedium","RyanZombieC_man_p_fugitive_Fmedium","RyanZombieC_man_w_worker_Fmedium","RyanZombieC_man_hunter_1_Fmedium",
	"RyanZombieC_man_1walker","RyanZombieC_man_polo_1_Fwalker","RyanZombieC_man_polo_2_Fwalker","RyanZombieC_man_polo_4_Fwalker","RyanZombieC_man_polo_5_Fwalker","RyanZombieC_man_polo_6_Fwalker","RyanZombieC_man_p_fugitive_Fwalker","RyanZombieC_man_w_worker_Fwalker","RyanZombieC_scientist_Fwalker","RyanZombieC_man_hunter_1_Fwalker","RyanZombieC_man_pilot_Fwalker","RyanZombieC_journalist_Fwalker","RyanZombieC_Oresteswalker","RyanZombieC_Nikoswalker"
];

_chance = 75;

if (ExileReborn_playerIsWounded) then {_chance = _chance + 25;};
if (ExileReborn_playerIsInfected) then {_chance = _chance + 40;};	

if (_chance >= random 100) then
{
	_buildings = player nearObjects ["House", 300];
	{
		if !(_buildings isEqualTo []) then 
		{
			_nearZombies = getPos _x nearEntities [_zombies,150];
			_nearPlayers = getPos _x nearEntities ["Exile_Unit_Player",25];
			_nearFlags = getPos _x nearObjects ["Exile_Construction_Flag_Static",50];
			if (((count _nearZombies) > 25) || ((count _nearPlayers) > 0) || ((count _nearFlags) > 0)) exitWith {};
			_positionsToSpawn = _x buildingPos -1;
			
			["spawnZombieNearTarget", [_positionsToSpawn]] call ExileClient_system_network_send;
		};
	} forEach _buildings;
};	