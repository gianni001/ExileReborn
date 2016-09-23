/**
 * ExileClient_object_animal_spawn
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_animalType","_animalConfig","_animalClass","_position","_animal","_animalArray"];

"ExileReborn - Spawning world animals" call ExileServer_util_log;

_animalArray =
[
	"Exile_Animal_Goat_Black", "Exile_Animal_Goat_Dirty", "Exile_Animal_Goat_White", "Exile_Animal_Goat_Old", "Exile_Animal_Goat_Spotted",
	"Exile_Animal_Rooster_Gold", "Exile_Animal_Rooster_Brown", "Exile_Animal_Rooster_White",
	"Exile_Animal_Sheep_Beige", "Exile_Animal_Sheep_White", "Exile_Animal_Sheep_Brown", "Exile_Animal_Sheep_Spotted", "Exile_Animal_Sheep_Tricolor"
];

for "_i" from 0 to 200 do
{
	_spawnCenter = Event_world_centerPosition;
	_min = 1;
	_max = Event_world_size;
	_mindist = 1;
	_water = 0;
	_shoremode = 0;
	_position = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;

	_animalType = selectRandom _animalArray;
	_animalConfig = configFile >> "CfgVehicles" >> _animalType >> "Exile";
	_animalClass = selectRandom (getArray (_animalConfig >> "variations"));

	_animal = createAgent [_animalClass, _position, [], 20, "FORM"];

	_animal setVariable ["BIS_fnc_animalBehaviour_disable", true];
	_animal setVariable ["State", 0];
	_animal setVariable ["SpawnedAt", time];
	_animal playMoveNow (getText (_animalConfig >> "idleMove"));
	_animal addEventHandler ["FiredNear", 	{ _this call ExileClient_object_animal_event_onFiredNear; 	}];
	_animal addEventHandler ["Hit", 		{ _this call ExileClient_object_animal_event_onHit; 		}];
	_animal addEventHandler ["Killed", 		{ _this call ExileClient_object_animal_event_onKilled; _this call JohnO_fnc_animalEventOnKilled;}];
};	

"ExileReborn - World animals spawned and ready to be eaten..." call ExileServer_util_log;