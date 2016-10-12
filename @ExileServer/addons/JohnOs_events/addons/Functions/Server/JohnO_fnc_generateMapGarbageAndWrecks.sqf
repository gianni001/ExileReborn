private ["_foundRoad","_randomPosition","_onRoadCheck","_countPossibleRoads","_road","_roadPosition","_wreck","_offSetRoadPos","_wreckVehicle","_invisibleSelections","_positionArray","_pos"];

"Generating map wreckages, garbage and objects.." call ExileServer_util_log;

for "_i" from 1 to 300 do 
{
	_foundRoad = false;

	waitUntil 
	{
		_randomPosition = [position player,10,30000,10,0,1,0] call BIS_fnc_findSafePos; 
		_onRoadCheck = _randomPosition nearRoads 100;
		_countPossibleRoads = count _onRoadCheck;

		if (_countPossibleRoads == 0) then 
		{

		}
		else
		{
			_road = _onRoadCheck select 0;
			_roadPosition = getPos _road;
			_foundRoad = true;
		};
		_foundRoad
	};

	//_wreck = ["Land_Wreck_Car_F","Land_Wreck_Skodovka_F","Land_Wreck_Ural_F","Land_Wreck_Truck_F","Land_Wreck_UAZ_F"];
	_wreck =
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
		"a3\structures_f\wrecks\Wreck_Slammer_F_F.p3d",
		"a3\structures_f\wrecks\Wreck_Slammer_hull_F.p3d"
	];
	_offSetRoadPos = [_roadPosition,15] call ExileClient_util_math_getRandomPositionInCircle;

	_dirAdjustment = [0 + floor (random 20),60 + floor (random 30),140 + floor (random 40),200 + floor (random 70)];
	_positionArray = [];
	{	
		_dir = 0 + _x;
		_pos = _offSetRoadPos;  
		_dist = 5 + floor (random 20); 
		 
		_pos = (_pos getPos [_dist, _dir] select [0, 2]) + ([[],[_pos select 2]] select (count _pos > 2)); 

		_positionArray pushBack [(_pos select 0),(_pos select 1),0];
	} forEach _dirAdjustment;
	
	{	

		_objectsNearPos = nearestObjects [_x, ["Car","Tank","House","Building","Air"], 10];

		if ((random 1 > 0.5) && ((count _objectsNearPos) <= 0)) then
		{	
			_randWreck = selectRandom _wreck;

			_wreckVehicle = createSimpleObject [_randWreck,_x];

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


			//_marker = createMarker [ format["HeliCrash%1", diag_tickTime], _offSetRoadPos];
			//_marker setMarkerType "hd_dot";
		};	
	} forEach _positionArray;

	_onRoadCheck = [];
	_road = []; 	
	_roadPosition = [];
};

"Finished generating map wreckages,garbage and objects" call ExileServer_util_log;




