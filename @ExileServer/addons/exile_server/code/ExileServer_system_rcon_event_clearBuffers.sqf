/**
 * ExileServer_system_rcon_event_clearBuffers
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_playerObject","_vehicleObject"];
if !(ExileSystemPlayerSaveASYNC isEqualTo []) then
{
	{
		_playerObject = _x;
		if (!isNull _playerObject) then
		{
			_playerObject call ExileServer_object_player_database_update;
		};
		ExileSystemPlayerSaveASYNC deleteAt _forEachIndex;
	} 
	forEach ExileSystemPlayerSaveASYNC;
};
if !(ExileServerVehicleSaveQueue isEqualTo []) then
{
	{
		_vehicleObject = _x;
		if (!isNull _vehicleObject) then
		{
			if (_vehicleObject getVariable ["ExileIsContainer", false]) then
			{
				_vehicleObject call ExileServer_object_container_database_update;
			}
			else
			{
				if (isNumber(configFile >> "CfgVehicles" >> typeOf _vehicleObject >> "exileIsDoor")) then
				{
					_vehicleObject call ExileServer_object_construction_database_lockUpdate;
				}
				else
				{
					_vehicleObject call ExileServer_object_vehicle_database_update;
				};
			};
		};
		ExileServerVehicleSaveQueue deleteAt _forEachIndex;
	}
	forEach ExileServerVehicleSaveQueue;
};
true