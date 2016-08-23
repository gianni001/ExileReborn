private ["_startOnRoad","_vehicleLead","_marker1","_driver","_spawnCenter"];

/**************/

Event_Convoy_monitorCount = Event_Convoy_monitorCount + 1;

_convoyDuration = Event_Convoy_Duration;
_scriptDelay = Event_Convoy_MinScriptDelay + floor (random Event_Convoy_MaxScriptDelay);
_lootPiles = Event_Convoy_AmountOfLoot;
ConvoyEventCompleted = false;
_debug = Event_Convoy_EnableDebug;

_world = toLower worldName;

/**************/

diag_log format ["[EVENT: Convoy] -- Began with paramters:: Script Delay [%1] :: Awaiting script delay to begin event",_scriptDelay];
if !(_debug) then
{	
	uiSleep _scriptDelay;
};	

diag_log format ["[EVENT: Convoy] -- Convoy event has begun -- Searching for valid spawn location"];

["toastRequest", ["InfoTitleAndText", ["Mafia Supplies", "The mafia are supplying goods between the traders..You are a convict right? Its yours for the taking"]]] call ExileServer_system_network_send_broadcast;

_convoyVehicleArray = Event_Convoy_ConvoyVehicles;
_convoyVehicle = selectRandom _convoyVehicleArray;

_eastCenter = createCenter east;
_group = createGroup east;
_group allowFleeing 0;
_group setCombatMode "RED";

_group1 = createGroup east;
_group1 allowFleeing 0;
_group1 setCombatMode "RED";

_unitDirection = 90;

_spawnCenter = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_min = Event_Convoy_Min;
_max = Event_Convoy_MaxDist;
_mindist = Event_Convoy_MinDist;
_water = Event_Convoy_WaterMode;
_shoremode = Event_Convoy_ShoreMode;

if !(_world isEqualTo "tanoa") then
{	
	_foundRoad = false;

	waitUntil //Loop the script until _foundRoad = true;
	{
		_startPosRoad = [_spawnCenter,_min,_max,_mindist,_water,1,_shoremode] call BIS_fnc_findSafePos; //Find random spot on the map
		_onRoadCheck = _startPosRoad nearRoads 100; //Find road objects 100m from spotws
		_countPossibleRoads = count _onRoadCheck; // count road objects

		if (_countPossibleRoads == 0) then
		{
			diag_log "[EVENT: Convoy] -- Found no roads -- checking again";
		}
		else
		{
			_road = _onRoadCheck select 0;
			_startOnRoad = getPos _road;
			_foundRoad = true;
			diag_log format ["[EVENT: Convoy] -- Found road position at:%1",_startOnRoad];
		};
		uiSleep 0.5;
		_foundRoad
	};
}
else
{
	_posibleLocations = [[9248.36,6388.77,0],[12376.1,2289.03,0],[9209.13,3737.66,0],[6158.05,12348.1,0]];
	_startOnRoad = selectRandom _posibleLocations;
};	

diag_log format ["[EVENT: Convoy] -- Convoy event has found valid spawn location at [%1]",_startOnRoad];

_spawnPos = _startOnRoad;

_escort = createvehicle [Event_Convoy_EscortVehicleLead,_startOnRoad,[],15,"NONE"];
_escort setVariable ["ExileIsPersistent", false];
_escort setDir _unitDirection;

_escortDriver = _group createUnit ["I_G_Soldier_F",_startOnRoad,[],0,"NONE"];
_escortDriver moveInDriver _escort;
_escortDriver setCaptive true;

_escortGunner = _group createUnit ["I_G_Soldier_F",_startOnRoad,[],0,"NONE"];
_escortGunner moveInGunner _escort;
_escortGunner setCaptive true;

_vehicleLead = createvehicle [_convoyVehicle,_startOnRoad,[],0,"NONE"];
_vehicleLead setVariable ["ExileIsPersistent", false];
_vehicleLead setDir _unitDirection;

_driver = _group createUnit ["I_G_Soldier_F",_startOnRoad,[],0,"NONE"];
_driver moveInDriver _vehicleLead;

_driver disableAI "AUTOTARGET";
_driver disableAI "TARGET";
_driver disableAI "SUPPRESSION";
_driver setCaptive true;

_escort1 = createvehicle [Event_Convoy_EscortVehicleRear,_startOnRoad,[],15,"NONE"];
_escort1 setVariable ["ExileIsPersistent", false];
_escort1 setDir _unitDirection;

_escortDriver1 = _group createUnit ["I_G_Soldier_F",_startOnRoad,[],0,"NONE"];
_escortDriver1 moveInDriver _escort1;
_escortDriver1 setCaptive true;

_escortGunner1 = _group createUnit ["I_G_Soldier_F",_startOnRoad,[],0,"NONE"];
_escortGunner1 moveInGunner _escort1;
_escortGunner1 setCaptive true;

_chopper = createvehicle [Event_Convoy_EscortChopper,_startOnRoad,[],0,"FLY"];
_chopper setVariable ["ExileIsPersistent", false];

_chopper addEventHandler ["Fuel",
{
	_chopper = _this select 0;
	_chopper setFuel 1;
	//hint format ["Chopper fuel:%1", fuel _chopper];
}];

_driverChopper = _group1 createUnit ["I_G_Soldier_F",_startOnRoad,[],0,"NONE"];
_driverChopper moveInDriver _chopper;
_driverChopper setCaptive true;

_gunner1Chopper = _group1 createUnit ["I_G_Soldier_F",_startOnRoad,[],0,"FLY"];
_gunner1Chopper moveInTurret [_chopper,[0]];
_gunner1Chopper setCaptive true;

_gunner2Chopper = _group1 createUnit ["I_G_Soldier_F",_startOnRoad,[],0,"NONE"];
_gunner2Chopper moveInTurret [_chopper,[1]];
_gunner2Chopper setCaptive true;

Event_RoamingAI_CurrentAlive = Event_RoamingAI_CurrentAlive + 6;

_escort lock 2;
_vehicleLead lock 2;
_escort1 lock 2;
_chopper lock 2;

{
	_X addMPEventHandler 
	["MPKilled",
		{

			private ["_killer","_currentRespect","_amountEarned","_newRespect","_killSummary"];

			_killed = _this select 0;
			_killer = _this select 1;

			[_killed] joinSilent Event_RadAI_deadGroup;

			_killingPlayer = _killer call ExileServer_util_getFragKiller;

			_currentRespect = _killingPlayer getVariable ["ExileScore", 0];
			_amountEarned = 50;
			_newRespect = _currentRespect + 50;

			_killingPlayer setVariable ["ExileScore", _newRespect];
			_killSummary = [];
			_killSummary pushBack ["BANDIT FRAGGED", _amountEarned];
			[_killingPlayer, "showFragRequest", [_killSummary]] call ExileServer_system_network_send_to;

			format["setAccountScore:%1:%2", _newRespect, getPlayerUID _killingPlayer] call ExileServer_system_database_query_fireAndForget;
			_killingPlayer call ExileServer_object_player_sendStatsUpdate;

			Event_RoamingAI_CurrentAlive = Event_RoamingAI_CurrentAlive - 1;
		}
	];
} forEach [_escortDriver,_escortGunner,_driver,_escortDriver1,_escortGunner1,_driverChopper];

sleep 5;

for "_i" from 0 to _lootPiles do
{	
	_item = [1] call JohnO_fnc_getRandomItems_new;	
	[_vehicleLead, _item] call ExileClient_util_containerCargo_add;	
};

_wayPointOne = Event_Convoy_WayPointOne;					// Central Trader
_wayPointTwo = Event_Convoy_WayPointTwo;					// Northern Trader
_wayPointThree = Event_Convoy_WayPointThree;				// Western Trader

_wp1 = _group addWaypoint [_wayPointOne, 0];															
_wp1 setWaypointType "MOVE";
_wp1 setWaypointBehaviour "CARELESS";

_wp2 = _group addWaypoint [_wayPointTwo, 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointBehaviour "CARELESS";

_wp3 = _group addWaypoint [_wayPointThree, 0];
_wp3 setWaypointType "CYCLE";
_wp3 setWaypointBehaviour "CARELESS";

while {(count (waypoints _group1)) > 0} do
{
    deleteWaypoint ((waypoints _group1) select 0);
};

_wpG1 = _group1 addWaypoint [getPos _vehicleLead, 0];															
_wpG1 setWaypointType "MOVE";
_wpG1 setWaypointBehaviour "CARELESS";
_wpG1 setWaypointStatements ["ConvoyEventCompleted", ""];

_vehicleLead forceSpeed 5;
_escort1 forceSpeed 5;
_escort forceSpeed 5;

_marker1 = createMarker ["Convoy",position _vehicleLead];
_marker1 setMarkerType Event_Convoy_MarkerType;
_marker1 setMarkerText Event_Convoy_MarkerText;

[_marker1,_vehicleLead,_convoyDuration,_driver,_escort,_escort1,_debug,_group,_wpG1,_group1,_chopper] spawn
{
	private ["_marker","_vehicle","_regulatingV1"];

	_marker = _this select 0;
	_vehicle = _this select 1;
	_timer = _this select 2;
	_timeStamp = 0;
	_driver = _this select 3;
	_v1 = _this select 4;
	_v2 = _this select 5;
	_debugRunning = _this select 6;
	_group = _this select 7;
	_chopperWP = _this select 8;
	_chopperGroup = _this select 9;
	_chopper = _this select 10;
	
	while {true} do
	{
		_marker setmarkerPos position _vehicle;
		_timeStamp = _timeStamp + 1;

		if ([_v1, 300] call ExileClient_util_world_isTraderZoneInRange) then 
		{
			_group setCombatMode "BLUE";
		}
		else
		{
			_group setCombatMode "RED";
		};

		if ([_chopper, 300] call ExileClient_util_world_isTraderZoneInRange) then 
		{
			_chopperGroup setCombatMode "BLUE";
		}
		else
		{
			_chopperGroup setCombatMode "RED";
		};		
		
		_distA = _v1 distance _vehicle;
		_distB = _v2 distance _vehicle;
		
		if (_distA > 35) then
		{
			_v1 forceSpeed 1;
		}
		else
		{
			_v1 forceSpeed 5;
		};	

			
		if (_distB > 35) then
		{
			_v2 forceSpeed 10;
		}
		else
		{
			_v2 forceSpeed 5;
		};

		_wpPos = getPos _v1;	
		_chopperWP setWaypointPosition [_wpPos,0];
		_chopper LimitSpeed 25;
		_chopper setFuel 1;
		
		_wpCount = count waypoints _chopperGroup;
	
		if (_debugRunning) then
		{
			hint format ["Chopper WP Count: %1 -- Chopper WPs: %2",_wpCount,waypoints _chopperGroup];
		};	
		
		if (_timeStamp > _timer) then
		{
			_vehicle setDamage 1;
			_driver setDamage 1;
			_v1 setDamage 1;
			_v2 setDamage 1;
			_chopper setDamage 1;
		};	

		sleep 1;

		if (!(alive _vehicle) || !(driver _vehicle isEqualTo _driver) || !(alive _driver)) exitWith 
		{
			deleteMarker _marker;
			if (alive _driver) then
			{
				_driver setDamage 1;
			};

			ConvoyEventCompleted = true;

			while {(count (waypoints _chopperGroup)) > 0} do
			{
			    deleteWaypoint ((waypoints _chopperGroup) select 0);
			};
			
			[_chopperGroup, getPos _chopper, 15000] call bis_fnc_taskPatrol;
			_chopperGroup setBehaviour "SAFE";
			_chopper forceSpeed -1;
			{
				if (alive _x) then
				{	
					_x lock 0;
				};
			} forEach [_v1,_v2,_vehicle,_chopper];	
		};
	};	
};

waitUntil 
{
	uiSleep 2;
	ConvoyEventCompleted
};

[] execVM "JohnOs_events\addons\Events\Convoy\JohnO_fnc_convoy.sqf";