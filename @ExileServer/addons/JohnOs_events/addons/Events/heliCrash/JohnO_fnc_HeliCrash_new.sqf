private ["_spawnCenter","_min","_max","_mindist","_water","_shoremode","_landPos","_wreckTypes","_wreckType","_pos","_holder","_safeToDebug","_marker","_debug","_aiPos","_item","_crash","_smoke","_chem","_chemlights","_chemlight"];

if ((Event_HeliCrash_Count < Event_HeliCrash_MaxEvents) && (random 1 > 0.3)) then
{
	_spawnCenter = Event_world_centerPosition;
	_min = Event_HeliCrash_Min;
	_max = Event_HeliCrash_MaxDist;
	_mindist = Event_HeliCrash_MinDist;
	_water = Event_HeliCrash_WaterMode;
	_shoremode = Event_HeliCrash_ShoreMode;

	_landPos = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;	

	_debug = Event_DEBUG_Location; //Tanoa debug island
	_safeToDebug = _landPos distance _debug;

	if (([_landPos, 600] call ExileClient_util_world_isTraderZoneInRange) || (_safeToDebug < 1000)) exitWith
	{
		"Helicrash spawned too close to Debug or trade zone" call ExileServer_util_log;
	};
	
	_wreckTypes = 
	[
		"Land_UWreck_Heli_Attack_02_F",
		"Land_HistoricalPlaneWreck_02_front_F",
		"Land_UWreck_MV22_F",
		"Land_Wreck_Plane_Transport_01_F"
	];

	_wreckType = selectRandom _wreckTypes;

	_crash = createVehicle [_wreckType,_landPos,[], 0, "can_collide"];
	_crash setPos [position _crash select 0,position _crash select 1, 0.1];
	_crash setVectorUp surfaceNormal position _crash;
	_smoke = createVehicle ["SmokeShell",position _crash,[], 0, "can_collide"];
	_smoke attachTo [_crash, [0, 0, -5] ];

	if (daytime > 17 || daytime < 5) then
	{
		_chemlights = ["Chemlight_green","Chemlight_yellow","Chemlight_red","Chemlight_blue"];

		for "_i" from 0 to 4 do
		{
			_chemlight = selectRandom _chemlights;
			_chem = createVehicle [_chemlight,position _crash,[], 7, "NONE"]; 
		};
	};
	//_holder = createVehicle ["Exile_Container_SupplyBox", _landPos, [], 10, "CAN COLLIDE"];

	_aiPos = getPosATL _crash;
	if (random 1 > 0.5) then
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

	/*
	_marker = createMarker [ format["HeliCrash%1", diag_tickTime], _landPos];
	_marker setMarkerType Event_HeliCrash_MarkerType;
	_marker setMarkerText Event_HeliCrash_MarkerText;
	
	Event_Cleanup_objectArray pushBack [_marker,time + Event_HeliCrash_MarkerDuration,true];
	*/

	_holder = createVehicle ["Exile_Container_SupplyBox", _landPos, [], 10, "CAN COLLIDE"];
	for "_i" from 0 to 5 + floor (random 5) do
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

	Event_Cleanup_objectArray pushBack [_crash,time + Event_HeliCrash_MarkerDuration,false];
	Event_HeliCrash_Positions pushBack [position _crash, time + Event_HeliCrash_MarkerDuration];
	
	publicVariable "Event_HeliCrash_Positions";

	Event_HeliCrash_Count = Event_HeliCrash_Count + 1;
	Event_HeliCrash_monitorCount = Event_HeliCrash_monitorCount + 1;

	format ["[EVENT: HeliCrash] Spawned a helicrash at -- %1 | Current HELICRASH Count -- %2", _landPos,Event_HeliCrash_Count] call ExileServer_util_log;
}
else
{	
	format ["[EVENT: HeliCrash] Crash did not spawn -- Current crash count:%1 | Chance was not succesful",Event_HeliCrash_Count] call ExileServer_util_log;
};	