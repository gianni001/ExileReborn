/**
 * ExileServer_world_spawnVehicles
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_mapsizeX","_mapsizeY","_gridSize","_gridVehicles","_gridSizeOffset","_vehicleCount","_debugMarkers","_vehicleClassNames","_maximumDamage","_damageChance","_randomizeFuel","_fuel","_randomizeAmmo","_ammo","_xSize","_workingXSize","_ySize","_workingYSize","_position","_spawned","_spawnedPositions","_positionReal","_spawnControl","_vehicleClassName","_vehicle","_hitpointsData","_hitpoints","_debugMarker"];
_mapsizeX = worldSize; 
_mapsizeY = worldSize; 
_gridSize = getNumber(configFile >> "CfgSettings" >> "VehicleSpawn" >> "vehiclesGridSize");
_gridVehicles = getNumber(configFile >> "CfgSettings" >> "VehicleSpawn" >> "vehiclesGridAmount");
format ["Spawning Dynamic Vehicles. GridSize: %1 Vehs/Grid: %2",_gridSize,_gridVehicles] call ExileServer_util_log;
_gridSizeOffset = _gridSize % 2;
_vehicleCount = 0;
_debugMarkers = ((getNumber(configFile >> "CfgSettings" >> "VehicleSpawn" >> "vehiclesDebugMarkers")) isEqualTo 1);
_vehicleClassNames = getArray (configFile >> "CfgSettings" >> "VehicleSpawn" >> "ground");
_maximumDamage = getNumber (configFile >> "CfgSettings" >> "VehicleSpawn" >> "maximumDamage");
_damageChance = getNumber (configFile >> "CfgSettings" >> "VehicleSpawn" >> "damageChance");
_randomizeFuel = ((getNumber(configFile >> "CfgSettings" >> "VehicleSpawn" >> "randomizeFuel")) isEqualTo 1);
_fuel = (getNumber(configFile >> "CfgSettings" >> "VehicleSpawn" >> "fuel"));
_randomizeAmmo = ((getNumber(configFile >> "CfgSettings" >> "VehicleSpawn" >> "randomizeAmmo")) isEqualTo 1);
_ammo = (getNumber(configFile >> "CfgSettings" >> "VehicleSpawn" >> "ammo"));
for "_xSize" from 0 to _mapsizeX step _gridSize do
{
	_workingXSize = _xSize + _gridSizeOffset;
	for "_ySize" from 0 to _mapsizeY step _gridSize do
	{
		_workingYSize = _ySize + _gridSizeOffset;
		_position = [_workingXSize,_workingYSize];
		_spawned = 0;
		_spawnedPositions = [];
		while {_spawned < _gridVehicles} do 
		{
			_positionReal = [_position, 25, _gridSize, 5, 0 , 1 , 0 , _spawnedPositions] call BIS_fnc_findSafePos;
			if(count _positionReal isEqualTo 3)exitWith{};
			_spawnControl = [[(_positionReal select 0) - 50, (_positionReal select 1) + 50],[(_positionReal select 0) + 50,(_positionReal select 1) - 50]];
			_spawnedPositions pushBack _spawnControl;
			_positionReal pushBack 0;
			_vehicleClassName = selectRandom _vehicleClassNames;
			_vehicle = [_vehicleClassName, _positionReal, random 360, true] call ExileServer_object_vehicle_createNonPersistentVehicle;
			_hitpointsData = getAllHitPointsDamage _vehicle;
			if !(_hitpointsData isEqualTo []) then 
			{
				_hitpoints = _hitpointsData select 0;
				{
				    if ((random 100) < _damageChance) then
				    {
				        _vehicle setHitPointDamage [_x, random _maximumDamage];
				    };
				}
				forEach _hitpoints;
			};
			if (_randomizeFuel) then 
			{
				_vehicle setFuel (random _fuel);
			}
			else 
			{
				_vehicle setFuel _fuel;
			};
			if (_randomizeAmmo) then 
			{
				_vehicle setVehicleAmmo (random _ammo);
			}
			else 
			{
				_vehicle setVehicleAmmo _ammo;
			};
			if (_debugMarkers) then
			{
				_debugMarker = createMarker ["vehicleMarker#"+str _vehicleCount, _positionReal];
				_debugMarker setMarkerColor "ColorOrange";
				_debugMarker setMarkerType "mil_dot_noShadow";
			};
			_spawned = _spawned + 1;
			_vehicleCount = _vehicleCount + 1;
		};
	};
};
format ["Dynamic vehicles spawned. Count : %1",_vehicleCount] call ExileServer_util_log;
true