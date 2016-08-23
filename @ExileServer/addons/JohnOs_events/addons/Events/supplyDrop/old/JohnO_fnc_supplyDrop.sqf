/*

	Will create an Chinnook supply chopper to fly around the map, and para drop a random vehicle with equipment in it

*/

Event_SupplyDrop_monitorCount = Event_SupplyDrop_monitorCount + 1;

_sleepTimer = Event_SupplyDrop_MinScriptDelay + floor (random Event_SupplyDrop_MaxScriptDelay);
_debug = Event_SupplyDrop_DebugEvent;

diag_log format ["[EVENT: SupplyDrop] -- Starting supply drop event awaiting [%1] seconds to begin event",_sleepTimer];

if !(_debug) then
{	
	uiSleep _sleepTimer;
};	

private ["_airCraftLead","_reachedDestination","_airCraftPosition","_group","_spawnPos","_potentialVehicles","_potentialSupplyVehicle","_supplyVehicle","_limit","_timer"];

SupplyDropEvent_active = false;

_limit = time + Event_SupplyDrop_Duration;
_timer = time;
_debug = Event_SupplyDrop_DebugEvent;

if !(SupplyDropEvent_active) then
{
	SupplyDropEvent_active = true;

	diag_log format ["[EVENT: SupplyDrop] -- Supply drop event is active and running"];

	["toastRequest", ["InfoTitleAndText", ["Vehicle Drop", "A Chinook has been seen preparing to drop its cargo"]]] call ExileServer_system_network_send_broadcast;

	_potentialVehicles = Event_SupplyDrop_PotentialSupplyVehicles;													// Array of potential supply vehicles (carriers)
	_PotentialSupplyVehicle = Event_SupplyDrop_PotentialSupplyDropVehicles;									// Array of potential supply objects

	_supplyVehicle = selectRandom _PotentialSupplyVehicle;													// Select a random supply vehicle from the _potentialSupplyVehicle array

	_group = createGroup WEST;																				// Create the group -- Needed when creating units that are going to have waypoints
	_group setCombatMode "BLUE";

	_heli = selectRandom _potentialVehicles;																// Select a random supply aircraft from the _potentialVehicles array

	_spawnCenter = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"); 					//Center of your map -- this is Altis
	_min = Event_SupplyDrop_Min; 																			// minimum distance from the center position (Number) in meters
	_max = Event_SupplyDrop_MaxDist; 																		// maximum distance from the center position (Number) in meters
	_mindist = Event_SupplyDrop_MinDist; 																	// minimum distance from the nearest object (Number) in meters, ie. create waypoint this distance away from anything within x meters..
	_water = Event_SupplyDrop_WaterMode; 																	// water mode 0: cannot be in water , 1: can either be in water or not , 2: must be in water
	_shoremode = Event_SupplyDrop_ShoreMode; 																// 0: does not have to be at a shore , 1: must be at a shore

	_spawnPos = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;				// Find a safe location on the map based on the above parameters

	_wayPointOne = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;			// Do the same for our waypoints -- Creating randomized pathing for the vehicle
	_wayPointTwo = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;
	_wayPointThree = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;
	_wayPointFour = [0,0,0];																				// Final waypoint is the edge of the map

	_spawnedHeli = [_spawnPos,random 360,_heli,_group] call BIS_fnc_spawnVehicle;							// Create the vehicle with our populated variables for _spawnPos _heli and _group
	_airCraftSelection = nearestObjects [_spawnPos, ["air"], 100];											// We need to get a variable that holds the aircraft OBJECT this will search all objects with a type of AIR within 100m of our spawnPos

	_airCraftLead = _airCraftSelection select 0;															// This will select the first object in the searched array, with will be our chopper 100% of the time

	_airCraftLead flyInHeight 200;																			// Set the flying height of the chopper - 200m
	_airCraftLead allowDamage false;																		// Do not allow damage to the chopper

	{																										// Disable certain aspects of the AI to ensure it does exactly what we tell it
		_x disableAI "AUTOTARGET";
		_x disableAI "TARGET";
		_x disableAI "SUPPRESSION";
		_x setCaptive true;
		//_x allowFleeing false;
		_x allowDamage false;

	} forEach units _group;

	_wp1 = _group addWaypoint [_wayPointOne, 0];															// Add waypoints and prey they work because #ARMA choppers
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "CARELESS";
	_wp1 setWaypointspeed "FULL";

	_wp2 = _group addWaypoint [_wayPointTwo, 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointBehaviour "CARELESS";
	_wp2 setWaypointspeed "LIMITED";

	_wp3 = _group addWaypoint [_wayPointThree, 0];
	_wp3 setWaypointType "MOVE";
	_wp3 setWaypointBehaviour "CARELESS";
	_wp3 setWaypointspeed "LIMITED";

	_wp4 = _group addWaypoint [_wayPointFour, 0];
	_wp4 setWaypointType "MOVE";
	_wp4 setWaypointBehaviour "CARELESS";
	_wp4 setWaypointspeed "FULL";

	if (_debug) then
	{	
		_marker1 = createMarker ["SupplyDrop",position _airCraftLead];
		_marker1 setMarkerType Event_SupplyDrop_MarkerType;

		[_marker1,_airCraftLead] spawn
		{
			private ["_marker"];
			_marker = _this select 0;
			_aircraft = _this select 1;
			while {true} do
			{
				_marker setmarkerPos position _aircraft;
				sleep 1
			};	
		};
	};

	_reachedDestination = false;																			// This variable is set to false, we will use it below

	waitUntil 																								// waitUntil our condition is met, before this script proceedes
	{
		if ((_airCraftLead distance2D _wayPointThree < 100) || (_timer >= _limit )) then 					// If the aircraft object is closer then 50m from the third (drop) waypoint, set the _reachedDestination TRUE thus exiting the waitUntil
		{ 
			_reachedDestination = true;
		};
		_timer = time;
	 	_reachedDestination																					// The condition for the waitUntil -- We are waiting until _reachedDestination is TRUE and NOT FALSE
	};

	diag_log format ["[EVENT: SupplyDrop] -- Supply drop event has reached its destination"];

	_airCraftPosition = getPos _airCraftLead; 																// populate a variable with the current relative position of the aircraft

	[_supplyVehicle,_airCraftPosition,_airCraftLead,_group] spawn JohnO_fnc_supplyDropObject; 						// Spawn a new script, and pass into that script important variables -- See JohnO_fnc_supplyDropObject.sqf
};

/**/


