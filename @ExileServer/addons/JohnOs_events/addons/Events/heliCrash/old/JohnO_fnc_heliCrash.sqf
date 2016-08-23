private ["_randomTimer","_limit","_timer","_spawnCenter","_min","_max","_mindist","_water","_shoremode","_spawnPos","_wayPointOne","_wayPointTwo","_wayPointThree","_wayPointFour","_wayPointFive","_spawnedHeli","_airCraftSelection","_airCraftLead","_lootPiles","_scriptDelay","_holder","_marker","_wps","_actualWP","_reachedDestination","_wreckType"];

/*

	Settings

*/
Event_HeliCrash_monitorCount = Event_HeliCrash_monitorCount + 1;
Event_HeliCrash_Count = Event_HeliCrash_Count + 1;

if (isNil "Event_HeliCrash_FirstScript") then
{
	Event_HeliCrash_FirstScript = false;
};	

if (Event_HeliCrash_Count < Event_HeliCrash_MaxEvents) then
{
	[] spawn
	{
		if !(Event_HeliCrash_DebugEvent) then
		{	
			_timer = floor (random 720);
			uiSleep _timer;
		}
		else
		{
			_timer = floor 10 + (random 15);
			uiSleep _timer;
		};

		[] execVM "JohnOs_events\addons\Events\heliCrash\JohnO_fnc_heliCrash.sqf";
	};
};	

_randomTimer = Event_HeliCrash_MinUptime + floor (random Event_HeliCrash_MaxUpTime);
_lootPiles = Event_HeliCrash_AmountOfLoot;
_scriptDelay = Event_HeliCrash_ScriptDelay;
_debug = Event_HeliCrash_DebugEvent;

_limit = 360;
_timer = 0;

if (_debug) then
{
	hint format ["[EVENT: HeliCrash] -- Current HeliCrash events running: %1",Event_HeliCrash_Count];
};	

if (Event_HeliCrash_FirstScript) then
{	
	diag_log format ["[EVENT: HeliCrash] -- Began with paramters:: Random timer [%1] :: Awaiting script delay to begin event",_scriptDelay];
}
else
{
	diag_log format ["[EVENT: HeliCrash] -- Began with paramters:: First script of server session -- NO DELAY"];
};	

if !(_debug) then
{	
	if (Event_HeliCrash_FirstScript) then
	{	
		uiSleep _scriptDelay;
	};	
};	

Event_HeliCrash_FirstScript = true;

diag_log format ["[EVENT: HeliCrash] -- Heli crash event is now under way"];

/**********************************************************/

["toastRequest", ["InfoTitleAndText", ["Unkown Aircraft", "An unkown high altitude aircraft has been seen roaming the skies"]]] call ExileServer_system_network_send_broadcast;

_potentialVehicles = Event_HeliCrash_PotentialCrashVehicles;																				

_group = createGroup WEST;																				
_group setCombatMode "BLUE";

_heli = selectRandom _potentialVehicles;

switch (_heli) do
{
	case "I_Heli_Transport_02_F":
	{
		_wreckType = "Land_UWreck_Heli_Attack_02_F";
	};

	case "B_T_VTOL_01_vehicle_F":
	{
		_wreckType = "Land_UWreck_MV22_F";
	};
};																

_spawnCenter = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"); 					
_min = Event_HeliCrash_Min; 																								
_max = Event_HeliCrash_MaxDist; 																							
_mindist = Event_HeliCrash_MinDist; 																							
_water = Event_HeliCrash_WaterMode; 																							
_shoremode = Event_HeliCrash_ShoreMode; 																						

if !(_debug) then
{	
	_spawnPos = [0,0,0];
}
else
{
	_Pos = getPos player;
	_spawnPos = [_pos,50] call ExileClient_util_math_getRandomPositionInCircle;
};			

_wayPointOne = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;			
_wayPointTwo = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;
_wayPointThree = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;
_wayPointFour = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;		
_wayPointFive = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;		

_waypoints = [_wayPointOne,_wayPointTwo,_wayPointThree,_wayPointFour];

if (_debug) then
{
	{
		_marker = createMarker [ format["HeliCrash%1", diag_tickTime], _x];
		_marker setMarkerType Event_HeliCrash_MarkerType;
		_marker setMarkerText "WAYPOINT";
		SLEEP 1;
	} forEach _waypoints;
};																	

_spawnedHeli = [_spawnPos,random 360,_heli,_group] call BIS_fnc_spawnVehicle;							
_airCraftSelection = nearestObjects [_spawnPos, ["air"], 100];											

_airCraftLead = _airCraftSelection select 0;															

_airCraftLead flyInHeight 350;																			
_airCraftLead allowDamage false;																		

{																										
	_x disableAI "AUTOTARGET";
	_x disableAI "TARGET";
	_x disableAI "SUPPRESSION";
	_x setCaptive true;
	//_x allowFleeing false;
	_x allowDamage false;

} forEach units _group;

_wp1 = _group addWaypoint [_wayPointOne, 0];															
_wp1 setWaypointType "MOVE";
_wp1 setWaypointBehaviour "CARELESS";
_wp1 setWaypointspeed "NORMAL";
_wp1 setWaypointCompletionRadius 100;

_wp2 = _group addWaypoint [_wayPointTwo, 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointBehaviour "CARELESS";
_wp2 setWaypointspeed "NORMAL";
_wp2 setWaypointCompletionRadius 100;

_wp3 = _group addWaypoint [_wayPointThree, 0];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointBehaviour "CARELESS";
_wp3 setWaypointspeed "NORMAL";
_wp3 setWaypointCompletionRadius 100;

_wp4 = _group addWaypoint [_wayPointFour, 0];
_wp4 setWaypointType "MOVE";
_wp4 setWaypointBehaviour "CARELESS";
_wp4 setWaypointspeed "NORMAL";
_wp4 setWaypointCompletionRadius 100;

_wp5 = _group addWaypoint [_wayPointOne, 0];
_wp5 setWaypointType "CYCLE";
_wp5 setWaypointBehaviour "CARELESS";
_wp5 setWaypointspeed "NORMAL";
_wp5 setWaypointCompletionRadius 100;

if (_debug) then
{	
	_marker1 = createMarker [ format["HeliCrash%1", diag_tickTime], _airCraftLead];
	_marker1 setMarkerType Event_HeliCrash_MarkerType;

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

_reachedDestination = false;																			

if !(_debug) then
{	
	uiSleep _randomTimer;
}
else
{
	uiSleep 30;
};

if !(_debug) then
{	
	_reachedDestination = false;
	_wps = [_wayPointOne,_wayPointTwo,_wayPointThree,_wayPointFour];																		// This variable is set to false, we will use it below

	_actualWP = selectRandom _wps;

	waitUntil 																								// waitUntil our condition is met, before this script proceedes
	{
		if ((_airCraftLead distance2D _actualWP < 150) || (_timer > _limit)) then 													// If the aircraft object is closer then 50m from the third (drop) waypoint, set the _reachedDestination TRUE thus exiting the waitUntil
		{ 
			_reachedDestination = true;
		};
		uiSleep 1;
		_timer = _timer + 1;
	 	_reachedDestination																					// The condition for the waitUntil -- We are waiting until _reachedDestination is TRUE and NOT FALSE
	};
};

_airCraftLead setFuel 0;
_airCraftLead setDamage 1;

{
    _airCraftLead deleteVehicleCrew _x
} forEach crew _airCraftLead;

waituntil {(getPos _airCraftLead select 2) < 50};

diag_log format ["[EVENT: HeliCrash] -- Timer has been reached and the Heli has crashed"];

_isWater = surfaceIsWater position _airCraftLead;

if !(_isWater) then
{	

	uiSleep 8;

	_landPos = position _airCraftLead;

	deleteVehicle _airCraftLead;

	_crash = createVehicle [_wreckType,_landPos,[], 0, "can_collide"];
	_crash setPos [position _crash select 0,position _crash select 1, 0.1];
	_crash setVectorUp surfaceNormal position _crash;
	//_smoke = createVehicle ["test_EmptyObjectForFireBig",position _crash,[], 0, "can_collide"];
	//_smoke attachTo [_crash, [0.5, -2, 1] ];

	_pos = [(_landPos select 0) + 10,(_landPos select 1), (_landPos select 2)];

	_holder = createVehicle ["Exile_Container_SupplyBox", _Pos, [], 10, "CAN COLLIDE"];

	_aiPos = getPosATL _holder;
	_debug = [6550.84,6270.12,0];

	_safeToDebug = _aiPos distance _debug;

	if (_safeToDebug > 1000) then
	{	
		[
			_aiPos, 							//Position of AI
			1, 									//Amount of AI groups
			2,									//Minimum AI per group
			4,									//Max AI per group
			35,									//Patrol Radius
			true,								//Add to sim manager
			true,								//Add to cleanup manager
			Event_HeliCrash_MarkerDuration		//Clean up duration
		] call JohnO_fnc_spawnAIGroup;
	};	
	_marker = createMarker [ format["HeliCrash%1", diag_tickTime], _landPos];
	_marker setMarkerType Event_HeliCrash_MarkerType;
	_marker setMarkerText Event_HeliCrash_MarkerText;
	
	Event_Cleanup_objectArray pushBack [_marker,time + Event_HeliCrash_MarkerDuration,true];
	Event_Cleanup_objectArray pushBack [_crash,time + Event_HeliCrash_MarkerDuration,false];

	for "_i" from 0 to _lootPiles do
	{	
		_item = [2] call JohnO_fnc_getRandomItems_new;
				
		[_holder, _item] call ExileClient_util_containerCargo_add;

		_magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");	
		_holder addMagazineCargoGlobal [(_magazines select 0), 1 + floor (random 3)];

		if (random 1 > 0.5) then
		{	
			_item = [3] call JohnO_fnc_getRandomItems_new;
			[_holder, _item] call ExileClient_util_containerCargo_add;
		};
		if (random 1 > 0.4) then
		{	
			_item = [4] call JohnO_fnc_getRandomItems_new;
			[_holder, _item] call ExileClient_util_containerCargo_add;	
		};		
	};	 																				
}
else
{
	diag_log format ["[EVENT: HeliCrash] -- Heli crashed in water -- Cancelling event"];
	deleteVehicle _airCraftLead;
};	

Event_HeliCrash_Count = Event_HeliCrash_Count - 1;

diag_log format ["[EVENT: HeliCrash] -- Loot populated, crash site created. Creating new event"];

[] execVM "JohnOs_events\addons\Events\heliCrash\JohnO_fnc_heliCrash.sqf";