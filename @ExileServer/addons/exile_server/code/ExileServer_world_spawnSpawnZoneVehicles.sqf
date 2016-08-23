/**
 * ExileServer_world_spawnSpawnZoneVehicles
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_spawnRadius","_vehiclesToSpawn","_markerName","_markerCenterPosition","_numberOfVehiclesToSpawn","_vehicleClassName","_i","_vehiclePosition","_vehicleDirection"];
"Creating spawn zone vehicles..." call ExileServer_util_log;
_spawnRadius = getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "spawnZoneRadius");
_vehiclesToSpawn = getArray(configFile >> "CfgSettings" >> "BambiSettings" >> "spawnZoneVehicles");
{
	_markerName = _x;
	if (getMarkerType _markerName == "ExileSpawnZone") then
	{
		_markerCenterPosition = getMarkerPos _markerName;
		{
			_numberOfVehiclesToSpawn = _x select 0;
			_vehicleClassName = _x select 1;
			for "_i" from 1 to _numberOfVehiclesToSpawn do
			{
				_vehiclePosition = [_markerCenterPosition, _spawnRadius] call ExileClient_util_world_findRoadPosition;
				if(_vehiclePosition isEqualTo [])exitWith{};
				_vehicleDirection = (random 360);
				[_vehicleClassName, _vehiclePosition, _vehicleDirection, true] call ExileServer_object_vehicle_createNonPersistentVehicle;
			};
		}
		forEach _vehiclesToSpawn;
	};
}
forEach allMapMarkers;
true