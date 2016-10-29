/////////////////////
/// ALTIS ///////////
/////////////////////

ExileRebornVersion = "0.8.2";
publicVariable "ExileRebornVersion";

Event_DEBUG_Location = [0,0,0];
Persistent_UID = "76561197972232595";												// Change me..
Event_extraDebugLogging = true;

Event_world_size = 0;

switch (toLower worldName) do
{
	case "altis":
	{
		Event_DEBUG_Location = [14482.4,5879.49,0];
		Event_world_size = 30000;
		Event_world_centerPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
		Event_world_blackListWEST = [[[8318.59,26057],[28606.6,1865.55]]];
		Event_world_blackListEAST = [[[1022.59,29321],[21470.6,2857.55]]];
		Event_world_ARMA_fuckYourWierdnessPosition = [10800.6,10604.9,0.00151062];

		Event_RadAI_SpawnLocations = 
		[
			// Ghost hotel
			[22150.9,21125,0],[21793,20884.1,0],[21781.4,21084.1,0],[22055.8,20882.1,0],
			// Cap strigla
			[28336.5,25675,0],[28271.4,25748.3,0],[28150.5,25658,0],[28332.1,25802.2,0]
		];
		ExileReborn_allMapBuildings = [0,0,0] nearObjects ["House", 100000];
		{
			_x setDamage 0.9;
		} forEach ExileReborn_allMapBuildings;	

	};
	case "esseker":
    {
        Event_DEBUG_Location = [196.887,354.436,0];
        Event_world_size = 4000;
        Event_world_centerPosition = [6049.26,6239.63,0];
        Event_world_blackListWEST = [[[0,12288],[6300,0]]];
        Event_world_blackListEAST = [[[12288,12288],[6300,0]]];

        Event_RadAI_SpawnLocations = 
        [
            // Novi Grad
            [11854.8,7837.71,0],[11928.2,7939.78,0],[11813.9,8023.99,0]
        ];
    };
	case "tanoa":
	{
		Event_DEBUG_Location = [6709.97,6098.13,0];
		Event_world_size = 30000;
		Event_world_centerPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");

		Event_RadAI_SpawnLocations = 
		[
			[1858.75,11872.9,0],[1759.41,12091,0],[1847.33,12126.4,0],[2020.88,11825,0],
			[3082.74,11145.6,0],[3046,11278.4,0],[3031.87,11119.4,0],
			[2321.05,13168.1,0],[2496.01,12909.5,0],[2687.29,12310.9,0]
		];
		ExileReborn_allMapBuildings = [0,0,0] nearObjects ["House", 100000];
		{
			_x setDamage 0.9;
		} forEach ExileReborn_allMapBuildings;	
	};
	case "namalsk":
	{
		Event_DEBUG_Location = [0,0,0];
		Event_world_size = 15000;
		Event_world_centerPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");

		Event_RadAI_SpawnLocations = 
		[
			//To do
		];
	};
};

/** Zombie stuff **/

Event_IdleZombieArray = [];
Event_lastMoan = time;
Event_moanCD = 15;
Event_zombieHoard_lastActivated = time;
Event_zombieHoard_coolDown = 1800;

/** Animal Stuff **/

Event_animalWarth_Duration = 900;
Event_warmAnimals = [];

/** Storm stuff**/

Event_lightningSpawnInterval = 2400;

/** Convoy Settings -- DO NOT USE CONVOY **/
/*
Event_Convoy_Duration = 2700;														// Duration the convoy will last before self terminating
Event_Convoy_MinScriptDelay = 1600; 												// Minimum amount of time between convoy events
Event_Convoy_MaxScriptDelay = 4000; 												// Maximum amount of time between convoy events
Event_Convoy_AmountOfLoot = 15; 													// Amount of loot "Piles" inside the convoy truck		
Event_Convoy_EnableDebug = false; 													// Enable debug for testing purposes only

Event_Convoy_ConvoyVehicles =  														// Array of potential vehicles for the convoy truck
[
	"Exile_Car_Van_Guerilla01",
	"Exile_Car_Ural_Covered_Yellow",
	"Exile_Car_Ural_Covered_Blue",
	"Exile_Car_Van_Fuel_Guerilla01"
];

Event_Convoy_EscortVehicleLead = "Exile_Car_BTR40_MG_Green"; 						// Escort vehicle that leads the convoy
Event_Convoy_EscortVehicleRear = "Exile_Car_HMMWV_M134_Desert"; 					// Escort vehicle that is at the rear of the convoy
Event_Convoy_EscortChopper = "Exile_Chopper_Huey_Armed_Desert"; 					// Escort chopper, follows the convoy at the rear

/** Convoy Safe pos settings **/
/*
Event_Convoy_Min = 5; 																// Minimum distance from center position in meters
Event_Convoy_MaxDist = 25000;														// Maximum position from center position in meters	
Event_Convoy_MinDist = 5;															// Minimum distance from objects		
Event_Convoy_WaterMode = 0;															// 1 - Pos will be on water 0 - Pos will be on land
Event_Convoy_ShoreMode = 1;															// 1 - Pos will be on a shoreline 0 - Pos will not be on a shoreline 

Event_Convoy_WayPointOne = [11805.7,12961.7,0]; 									// Waypoint 1 - First waypoint the convoy will head to
Event_Convoy_WayPointTwo = [12240.5,6749.07,0]; 									// Waypoint 2 - Second waypoint..
Event_Convoy_WayPointThree = [5804.46,7667.04,0]; 									// Waypoint 3 - Waypoint the convoy will cycle

Event_Convoy_MarkerType = "ExileMissionDifficultIcon"; 								// Convoy marker type
Event_Convoy_MarkerText = "Supply Convoy"; 											// Convoy marker text
*/

/** Air Patrol Settings **/

Event_AirPatrol_Duration = 600;														// Time it takes for the aircraft to self terminate if not shot down
Event_AirPatrol_InterceptorDuration = 360;											// If using interceptor, interceptor has this amount of time to hunt the jet down and kill it
Event_AirPatrol_MinScriptDelay = 1800; 												
Event_AirPatrol_MaxScriptDelay = 3600;
Event_AirPatrol_ChanceForEvent = 0.2; 												// Chance for the event to occur - Only one of these events happens per server session 												
Event_AirPatrol_MaxAmountOfWeapons = 6;
Event_AirPatrol_MaxAmountOfItems = 10; 													
Event_AirPatrol_EnableDebug = false; 												

/** Air Patrol safe pos settings **/

Event_AirPatrol_Min = 5; 															// Minimum distance from center position in meters
Event_AirPatrol_MaxDist = Event_world_size; 										// Maximum position from center position in meters	
Event_AirPatrol_MinDist = 10; 														// Minimum distance from objects		
Event_AirPatrol_WaterMode = 0; 														// 1 - Pos will be on water 0 - Pos will be on land
Event_AirPatrol_ShoreMode = 0; 														// 1 - Pos will be on a shoreline 0 - Pos will not be on a shoreline 

Event_AirPatrol_PatrolAirCraft = "B_Plane_CAS_01_F"; 								// Patrol aircraft that will be destroyed 
Event_AirPatrol_InterceptorAirCraft = "I_Plane_Fighter_03_AA_F"; 					// Interceptor aircraft that will hunt the patrol
Event_AirPatrol_RescueChopper = "Exile_Chopper_Huey_Armed_Desert"; 					// Rescue chopper that will fly to the crash site

Event_AirPatrol_MarkerType = "ExileMissionEasyIcon"; 								// Marker type for the crash site
Event_AirPatrol_MarkerText = "NATO Crash Site"; 									// Marker text for the crash site -- Markers are disabled in EXILE REBORN

/** Supply Drop settings **/

Event_SupplyDrop_MinLootAmount = 1; 												// Minimum amount of loot in the vehicle drop
Event_SupplyDrop_MaxLootAmount = 5;                                                 // Maximum amount of loot = Min + random max
Event_SupplyDrop_DebugEvent = false; 												// Debug event for testing

Event_SupplyDrop_PotentialSupplyVehicles = ["B_Heli_Transport_03_unarmed_F"];
Event_SupplyDrop_PotentialSupplyDropVehicles = 
[
	"Exile_Car_Ifrit",
	"Exile_Car_Hunter",
	"Exile_Car_HEMMT",
	"Exile_Car_Strider"
];

Event_SupplyDrop_maxPersistentArmoured = 2; 										// The server will only para drop new persistent armoured vehicles upto this amount each

/** Supply drop Safe Pos settings **/

Event_SupplyDrop_Min = 5; 															// Minimum distance from center position in meters
Event_SupplyDrop_MaxDist = Event_world_size;										// Maximum position from center position in meters	
Event_SupplyDrop_MinDist = 10; 														// Minimum distance from objects		
Event_SupplyDrop_WaterMode = 0; 													// 1 - Pos will be on water 0 - Pos will be on land
Event_SupplyDrop_ShoreMode = 0; 													// 1 - Pos will be on a shoreline 0 - Pos will not be on a shoreline 
Event_SupplyDrop_Height = 150; 														// Height of the supply drop

Event_SupplyDrop_MarkerType = "ExileMissionModerateIcon"; 							// Marker type at the vehicle drop location
Event_SupplyDrop_MarkerText = "Vehicle Drop";										// Marker text at the vehicle drop location
Event_SupplyDrop_MarkerDuration = 1800; 											// Time the marker will be visible at the drop location

/** Helicrash settings **/

Event_HeliCrash_MaxEvents = 6;
Event_HeliCrash_Count = 0;
Event_HeliCrash_AmountOfLoot = 7; 													// Amount of loot piles in the crate
Event_HeliCrash_DebugEvent = false; 												// Debug for testing purposes
Event_HeliCrash_Positions = [];

/** HeliCrash safe pos settings **/

Event_HeliCrash_Min = 5; 															// Minimum distance from center position in meters
Event_HeliCrash_MaxDist = Event_world_size;											// Maximum position from center position in meters	
Event_HeliCrash_MinDist = 10; 														// Minimum distance from objects		
Event_HeliCrash_WaterMode = 0; 														// 1 - Pos will be on water 0 - Pos will be on land
Event_HeliCrash_ShoreMode = 0; 														// 1 - Pos will be on a shoreline 0 - Pos will not be on a shoreline 

Event_HeliCrash_MarkerType = "ExileMissionHardcoreIcon"; 							// Marker type at crash site
Event_HeliCrash_MarkerText = "Crash Site";											// Marker text at crash site
Event_HeliCrash_MarkerDuration = 1800; 											    // Time the event will last
Event_HeliCrash_timeStamp = diag_tickTime;

/** AI stuff **/

Event_RadAI_MaxAllowedAI = 30;
Event_RadAI_GroupAmountMin = 1;
Event_RadAI_GroupAmountMax = 4;
Event_RadAI_DebugEvent = false;

/** Survivor AI **/

ExileReborn_survivor_lootCoolDown = 20;												// How often the AI will loot if in range of a loot pile
ExileReborn_survivor_antiStick_check = 300;											// How often the AI's position is checked, if it is within 2m of eacher within this time frame anti Stuck occurs

/** Head hunter AI **/

Event_HeadHunterAI_Interval_Base = 1080;
Event_HeadHunterAI_Interval_Actual = Event_HeadHunterAI_Interval_Base;
Event_HeadHunterAI_GroupAmountMin = 1;
Event_HeadHunterAI_GroupAmountMax = 3;
Event_HeadHunterAI_playerLimit = 25;

/** Roaming AI **/

CenterLogicLocation = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"); 
_logic = "logic" createVehicleLocal CenterLogicLocation;
allTownLocations = nearestLocations [_logic, ["NameVillage","NameCity","NameCityCapital"], 30000];

Event_RoamingAI_SpawnLocations = [];																// Towns

Event_RoamingAI_MaxAllowedAI = 70;
Event_RoamingAI_GroupAmountMin = 1;
Event_RoamingAI_GroupAmountMax = 2;
Event_RoamingAI_TownMin = 1;
Event_RoamingAI_TownMax = 5;
Event_RoamingAI_DebugEvent = false;
Event_RoamingAI_lastTarget = [];
Event_RoamingAI_lastTown = [];
Event_RoamingAI_despawnTime = 1080;

Event_TownInvasion_AmountOfLoot = 4;
Event_TownInvasion_DespawnTime = 2100;

Event_RoamingAI_MoneyMin = 1;
Event_RoamingAI_MoneyMax = 100;

//Event_RadAI_deadGroup = createGroup EAST;
Resistance setFriend [East, 0];
East setFriend [Resistance, 0];
Resistance setFriend [West, 0];
West setFriend [Resistance, 0];


{
	_index = _forEachIndex;
	_positionIndex = allTownLocations select _index;
	_position = position _positionIndex;
	Event_RoamingAI_SpawnLocations pushBack _position;
} forEach allTownLocations;


if (Event_RoamingAI_DebugEvent) then
{
	{
		_index = _forEachIndex;
		_posIdex = allTownLocations select _index;
		_pos = position _posIdex;
		_marker = createMarker [ format["HeliCrash%1", diag_tickTime],_pos];
		_marker setMarkerType "mil_warning";
		_marker setMarkerText "AI SPAWN POINT";
		sleep 0.01;
	} forEach allTownLocations;
};

/** Player wages **/

Event_Wages_AmountEarned = 200;
Event_Wages_Interval = 600;

/** SIMULATION MANAGER **/

Event_SimulationManager_Interval = 15;
Event_SimulationManager_SimulateRange = 800;
Event_ALLAI_SimulatedUnits = [];
Event_SimulationManager_DebugEvent = false;

/*
	Usage:
	Event_Cleanup_objectArray pusback [Object,deletion time, is marker (boolean)];
*/

Event_Cleanup_objectArray = [];

/*

	Compile required functions and execute the scripts

*/

Event_HeliCrash_monitorCount = 0;
Event_AirPatrol_monitorCount = 0;
Event_Convoy_monitorCount = 0;
Event_SupplyDrop_monitorCount = 0;
Event_RadAI_CurrentAlive = 0;

uiSleep 20;

[] execVM "JohnOs_events\addons\Events\airPatrol\airPatrol.sqf";
//[] execVM "JohnOs_events\addons\Events\Convoy\JohnO_fnc_Convoy.sqf";
[] execVM "JohnOs_events\addons\Events\Adjust_Server_DateAndTime.sqf";
[] execVM "JohnOs_events\addons\Events\Persistent_vehicles\spawn_vehicles.sqf";
[] execVM "JohnOs_events\addons\Events\spawnAnimals\ExileClient_object_animal_spawn.sqf";
[] spawn JohnO_fnc_generateMapGarbageAndWrecks;

	
[360, JohnO_fnc_eventMonitor, [], true] call ExileServer_system_thread_addtask;
[Event_Wages_Interval, JohnO_fnc_wages, [], true] call ExileServer_system_thread_addtask;
	
[700, JohnO_fnc_spawnRoamingAI, [], true] call ExileServer_system_thread_addtask;
[1000, JohnO_fnc_spawnDynamicAI, [], true] call ExileServer_system_thread_addtask;

[660, JohnO_fnc_heliCrash_new, [], true] call ExileServer_system_thread_addtask;
[60, JohnO_fnc_handleCrashSmoke, [], true] call ExileServer_system_thread_addtask;

[900, JohnO_fnc_supplyDrop_spawnEvent, [], true] call ExileServer_system_thread_addtask;
[Event_HeadHunterAI_Interval_Actual, JohnO_fnc_spawnHeadHunters, [], true] call ExileServer_system_thread_addtask;

[Event_lightningSpawnInterval, JohnO_fnc_spawnStormEvent, [], true] call ExileServer_system_thread_addtask;

[2, JohnO_fnc_zombieIdleBehaviour, [], true] call ExileServer_system_thread_addtask;
[30, JohnO_fnc_spawnZombieHoardEvent, [], true] call ExileServer_system_thread_addtask;

[15, JohnO_fnc_simulationManager, [], true] call ExileServer_system_thread_addtask;
	

_fuelStations = nearestObjects [[0,0,0], ['Land_fs_feed_F','Land_FuelStation_Feed_F'], 2000000];
{
	_x enableSimulationGlobal false;
} forEach _fuelStations;


// Make the map look damaged


