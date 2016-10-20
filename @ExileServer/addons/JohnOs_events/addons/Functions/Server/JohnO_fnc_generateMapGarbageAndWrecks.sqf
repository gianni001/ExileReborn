private ["_wrecks","_randWreck","_roadPosition","_position","_wreckVehicle","_invisibleSelections","_randomSmoke","_holder","_holders","_randomSelection","_selection","_item","_smoke","_tabsSpawned"];

ExileReborn_allWorldPersistantObjects = profileNamespace getVariable "ExileReborn_allWorldPersistantObjects";

if (isNil "ExileReborn_allWorldPersistantObjects") then
{
	ExileReborn_allWorldPersistantObjects = [];
	format ["[EVENT: World Map Objects] No world map objects detected - Creating world map objects and saving.."] call ExileServer_util_log;
}
else
{
	format ["[EVENT: World Map Objects] World objects detected - Re creating them in their original positions"] call ExileServer_util_log;
};	

//"Generating map wreckages, garbage and objects.." call ExileServer_util_log;

if (ExileReborn_allWorldPersistantObjects isEqualTo []) then
{
	for "_i" from 1 to 300 do 
	{
		_wrecks =
		[
			"a3\structures_f\wrecks\wreck_skodovka_f.p3d",
			"a3\structures_f\wrecks\wreck_Car_f.p3d",
			"a3\structures_f\wrecks\Wreck_Ural_F.p3d",
			"a3\structures_f\wrecks\Wreck_Truck_F.p3d",
			"a3\structures_f\wrecks\Wreck_UAZ_F.p3d",
			"a3\structures_f\wrecks\Wreck_BRDM2_F.p3d",
			"a3\structures_f\wrecks\Wreck_Hunter_F.p3d",
			"a3\structures_f\wrecks\Wreck_Offroad_F.p3d",
			"a3\structures_f\wrecks\Wreck_Car2_F.p3d",
			"a3\structures_f\wrecks\Wreck_Car3_F.p3d",
			"a3\structures_f\wrecks\Wreck_Offroad2_F.p3d",
			"a3\structures_f\wrecks\Wreck_Slammer_F.p3d",
			"a3\structures_f\wrecks\Wreck_Slammer_hull_F.p3d"
		];

		_randWreck = selectRandom _wrecks;
		_roadPosition = [Event_world_centerPosition,30000] call ExileClient_util_world_findRoadPosition;
		_position = [_roadPosition,10] call ExileClient_util_math_getRandomPositionInCircle;

		_wreckVehicle = createSimpleObject [_randWreck,_position];

		_invisibleSelections = ["zasleh", "zasleh2", "box_nato_grenades_sign_f", "box_nato_ammoord_sign_f", "box_nato_support_sign_f"];
		{
	        if ((toLower _x) in _invisibleSelections) then 
	        {
	            _wreckVehicle hideSelection [_x, true];
	        };
	    }
	    forEach (selectionNames _wreckVehicle);

		_wreckVehicle setDir random 360;
	    _wreckVehicle setPosATL [position _wreckVehicle select 0,position _wreckVehicle select 1, 0];
	    _wreckVehicle setVectorUp surfaceNormal position _wreckVehicle;
	    _smoke = false;
	    if (random 1 > 0.95) then
	    {	
		    _randomSmoke = "test_EmptyObjectForSmoke" createVehicle _position;  
			_randomSmoke setPosATL (position _wreckVehicle);
			_smoke = true;
		};

		ExileReborn_allWorldPersistantObjects pushBack [(getPosATL _wreckVehicle),(getDir _wreckVehicle),_randWreck,_smoke];
			
		//_marker = createMarker [ format["HeliCrash%1", diag_tickTime], _position];
		//_marker setMarkerType "hd_dot";	

		uiSleep 0.1;
	};

	profileNamespace setVariable ["ExileReborn_allWorldPersistantObjects",ExileReborn_allWorldPersistantObjects];
	saveProfileNamespace;
}
else
{
	_tabsSpawned = 0;
	{
		_wreckVehicle = createSimpleObject [(_x select 2),(_x select 0)];

		_invisibleSelections = ["zasleh", "zasleh2", "box_nato_grenades_sign_f", "box_nato_ammoord_sign_f", "box_nato_support_sign_f"];
		{
			private "_x";
	        if ((toLower _x) in _invisibleSelections) then 
	        {
	            _wreckVehicle hideSelection [_x, true];
	        };
	    }
	    forEach (selectionNames _wreckVehicle);

		_wreckVehicle setDir (_x select 1);
	    _wreckVehicle setPosATL [position _wreckVehicle select 0,position _wreckVehicle select 1, 0];
	    _wreckVehicle setVectorUp surfaceNormal position _wreckVehicle;

	    if ((_x select 3) isEqualTo true) then
	    {
	    	if (random 1 > 0.5) then
	    	{	
	    		_randomSmoke = "test_EmptyObjectForSmoke" createVehicle (position _wreckVehicle);  
				_randomSmoke setPosATL (position _wreckVehicle);
			};	
	    };

	    if (random 1 > 0.97) then
	    {
	    	_popTabsObject = createVehicle ["Exile_PopTabs", (position _wreckVehicle), [], 10, "NONE"];
	    	_amount = 500 + floor (random 5000);
			_popTabsObject setVariable ["ExileMoney", _amount, true];

			_tabsSpawned = _tabsSpawned + _amount;
	    };	

	} forEach ExileReborn_allWorldPersistantObjects;
};	

format["[Event: World Map Objects] Finished spawning world map objects -- Generated %1 popTabs as treasure",_tabsSpawned] call ExileServer_util_log;