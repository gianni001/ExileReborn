/**
 * ExileServer_system_garbageCollector_unscheduled_deleteLoot
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_lifeTime","_index","_building","_lootWeaponHolderNetIDs","_lootWeaponHolder"];
_lifeTime = 60 * getNumber (configFile >> "CfgSettings" >> "GarbageCollector" >> "Ingame" >> "Loot" >> "lifeTime");
_index = -1;
{
	_building = objectFromNetId _x;
	if ((time - (_building getVariable ["ExileLootSpawnedAt", 0])) < _lifeTime) exitWith {};
	_lootWeaponHolderNetIDs = _building getVariable ["ExileLootWeaponHolderNetIDs", []];
	{
		_lootWeaponHolder = objectFromNetId _x;
		if !(isNull _lootWeaponHolder) then
		{
			deleteVehicle _lootWeaponHolder;
		};
	}
	forEach _lootWeaponHolderNetIDs;
	_building setVariable ["ExileLootSpawnedAt", nil];
	_building setVariable ["ExileHasLoot", false];
	_building setVariable ["ExileLootWeaponHolderNetIDs", []];
   	_index = _forEachIndex;
}
forEach ExileServerBuildingNetIdsWithLoot;
ExileServerBuildingNetIdsWithLoot deleteRange [0,(_index+1)];  
