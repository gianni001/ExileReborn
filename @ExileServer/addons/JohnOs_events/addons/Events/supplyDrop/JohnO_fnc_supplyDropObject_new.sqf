private ["_spawnCenter","_min","_max","_mindist","_water","_shoremode","_randomPosition","_position","_supply","_chuteType","_chuteType","_drop","_wheels","_item","_magazines","_smoke","_dropPos","_marker","_markerPos","_debug","_uid","_count"];

if (random 1 > 0.3) then
{
	_spawnCenter = Event_world_centerPosition;		
	_min = Event_SupplyDrop_Min; 																
	_max = Event_SupplyDrop_MaxDist; 															
	_mindist = Event_SupplyDrop_MinDist; 														
	_water = Event_SupplyDrop_WaterMode; 														
	_shoremode = Event_SupplyDrop_ShoreMode; 		

	if !(Event_SupplyDrop_DebugEvent) then
	{	
		_randomPosition = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;
	}
	else
	{
		_randomPosition = getPos player;
	};

	_debug = Event_DEBUG_Location;
	_safeToDebug = _randomPosition distance _debug;

	if (([_randomPosition, 600] call ExileClient_util_world_isTraderZoneInRange) || (_safeToDebug < 1000)) exitWith
	{
		format ["[EVENT: SupplyDrop] -- Supply spawned to close too trader zone OR debug island @ %1. Cancelling event",_randomPosition] call ExileServer_util_log;
	};

	_randomPosition set [2, Event_SupplyDrop_Height];

	_supply = selectRandom Event_SupplyDrop_PotentialSupplyDropVehicles;
	_uid = Persistent_UID;
	_count = count allMissionObjects _supply;

	if (_count < Event_SupplyDrop_maxPersistentArmoured) then
	{	
		_chuteType = "B_Parachute_02_F";   																		
		_chute = createVehicle [_chuteType, [100, 100, 200], [], 0, 'FLY'];										
		_chute setPos _randomPosition;

		_pinCode = format ["%1%2%3%4",round (random 8 +1),round (random 8 +1),round (random 8 +1),round (random 8 +1)];
		_drop = [_supply, [0,0,0], (random 360), true,_pinCode] call ExileServer_object_vehicle_createPersistentVehicle;
		_drop setDamage 0.8;
		_drop setFuel 0;
		if !(_drop isKindOf "AIR") then
		{
			_wheels = ["HitLF2Wheel","HitLFWheel","HitRFWheel","HitRF2Wheel"];
			{
				if (random 1 > 0.5) then
				{	
					_drop setHitPointDamage [_x,1];
				};	
			} forEach _wheels;
		};	
		_drop setVariable ["ExileOwnerUID", _uid];
		_drop setVariable ["ExileIsLocked",0];
		_drop lock 0;

		_drop allowDamage false;

		_drop setPosATL _randomPosition;

		_drop attachTo [_chute, [0, 0, -0.2]];																	

		_drop disableTIEquipment true;
		_drop lock 2;

		/*
			Clear the cargo contents of the supply vehicle
		*/

		clearWeaponCargoGlobal _drop;
		clearItemCargoGlobal _drop;
		clearMagazineCargoGlobal _drop;

		/*
			Populate the contents of the vehicle
		*/

		for "_i" from 0 to Event_SupplyDrop_MinLootAmount + floor (random Event_SupplyDrop_MaxLootAmount) do 		
		{
			_item = [2] call JohnO_fnc_getRandomItems_new;

			[_drop, _item] call ExileClient_util_containerCargo_add;

			_magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");
			_drop addMagazineCargoGlobal [(_magazines select 0), 1 + floor (random 3)];

			if (random 1 > 0.5) then
			{
				_item = [3] call JohnO_fnc_getRandomItems_new;
				[_drop, _item] call ExileClient_util_containerCargo_add;
			};
			if (random 1 > 0.4) then
			{
				_item = [4] call JohnO_fnc_getRandomItems_new;
				[_drop, _item] call ExileClient_util_containerCargo_add;
			};

		};

		"[EVENT: SupplyDrop] -- Supply drop event has spawned its cargo and populated loot" call ExileServer_util_log;

		_smoke = "SmokeShellRed" createVehicle position _drop; 														
		_smoke attachto [_drop,[0,0,0]];

		waitUntil
		{
			position _drop select 2 < 35 || isNull _chute
		};

		uiSleep 12;
																													
		detach _drop;                      																			
		_drop setPos [position _drop select 0, position _drop select 1, 0]; 										

		_drop setDamage 0;
		_drop allowDamage true;																						
		_drop lock 0;

		_drop call ExileServer_object_vehicle_database_insert;
		_drop call ExileServer_object_vehicle_database_update;

		sleep 2;

		_wheels = ["HitLF2Wheel","HitLFWheel","HitRFWheel","HitRF2Wheel"];											
		{
			if (random 1 > 0.3) then
			{
				_drop setHitPointDamage [_x,1];
			};

		} forEach _wheels;

		_smoke = "SmokeShellRed" createVehicle position _drop; 														
		_smoke attachto [_drop,[0,0,0]];
		/*
		_markerPos = getPos _drop;

		_marker = createMarker [ format["Supply%1", diag_tickTime], _markerPos];
		_marker setMarkerType Event_SupplyDrop_MarkerType;
		_marker setMarkerText Event_SupplyDrop_MarkerText;
		*/
		_DropPos = getPosATL _drop;

		if (random 1 > 0.3) then
		{
			[
				_DropPos, 							//Position of AI
				1, 									//Amount of AI groups
				2,									//Minimum AI per group
				4,									//Max AI per group
				35,									//Patrol Radius
				true,								//Add to sim manager
				true,								//Add to cleanup manager
				Event_SupplyDrop_MarkerDuration		//Clean up duration
			] call JohnO_fnc_spawnAIGroup;
		};

		//["toastRequest", ["InfoTitleAndText", ["Vehicle Drop", "A heart for inmates have organized a vehicle drop"]]] call ExileServer_system_network_send_broadcast;

		//Event_Cleanup_objectArray pushBack [_marker,time + Event_SupplyDrop_MarkerDuration,true];
		Event_HeliCrash_Positions pushBack [position _drop, time + Event_SupplyDrop_MarkerDuration];
		publicVariable "Event_HeliCrash_Positions";	
		format ["[EVENT: SupplyDrop] Spawned supply drop event @ %1",_randomPosition] call ExileServer_util_log;
		Event_SupplyDrop_monitorCount = Event_SupplyDrop_monitorCount + 1;
	}
	else
	{
		"[EVENT: SupplyDrop] Did not spawn a supply drop vehicle - Vehicle selected max count on server reached" call ExileServer_util_log;	
	};	
}
else
{
	
	"[EVENT: SupplyDrop] Supply drop did not spawn | Chance was not succesful" call ExileServer_util_log;
};	
