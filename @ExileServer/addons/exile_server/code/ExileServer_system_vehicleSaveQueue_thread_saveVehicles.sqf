/**
 * ExileServer_system_vehicleSaveQueue_thread_saveVehicles
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicleObject","_removeFromQueue"];
{
	_vehicleObject = _x;
	_removeFromQueue = false;
	if (isNull _vehicleObject) then
	{
		_removeFromQueue = true;
	}
	else 
	{
		if (diag_tickTime - (_vehicleObject getVariable ["ExileVehicleSaveQueuedAt", 30]) > 60) then
		{
			if(_vehicleObject getVariable ["ExileIsContainer",false])then
			{
				_vehicleObject call ExileServer_object_container_database_update;
			}
			else
			{
				if(isNumber(configFile >> "CfgVehicles" >> typeOf _vehicleObject >> "exileIsDoor"))then
				{
					_vehicleObject call ExileServer_object_construction_database_lockUpdate;
				}
				else
				{
					_vehicleObject call ExileServer_object_vehicle_database_update;
				};
			};
			_vehicleObject setVariable ["ExileVehicleSaveQueuedAt", nil];
			_removeFromQueue = true;
		};
	};
	if (_removeFromQueue) then
	{
		ExileServerVehicleSaveQueue deleteAt _forEachIndex;
	};
}
forEach ExileServerVehicleSaveQueue;
true