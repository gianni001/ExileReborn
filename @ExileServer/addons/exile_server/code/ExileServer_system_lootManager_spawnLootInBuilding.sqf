/**
 * ExileServer_system_lootManager_spawnLootInBuilding
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_building","_buildingConfig","_lootTableName","_localPositions","_lootConfig","_maximumNumberOfLootPositions","_maximumPositionCoverage","_maximumNumberOfItemsPerLootSpot","_numberOfPositionsToUse","_lootPositions","_spawnedItemClassNames","_lootWeaponHolderNetIDs","_lootPosition","_lootHolder","_numberOfItemsToSpawn","_n","_itemClassName","_cargoType","_magazineClassNames","_magazineClassName","_numberOfMagazines"];
_building = _this;
_building setVariable ["ExileLootSpawnedAt", time];
_building setVariable ["ExileHasLoot", true];
_buildingConfig = configFile >> "CfgBuildings" >> typeOf _building;
_lootTableName = getText (_buildingConfig >> "table");
_localPositions = getArray (_buildingConfig >> "positions");
if ((getPosATL _building) call ExileClient_util_world_isInRadiatedZone) then 
{
	_lootTableName = "Radiation";
};
_lootConfig = missionConfigFile >> "CfgExileLootSettings";
_maximumNumberOfLootPositions = getNumber (_lootConfig >> "maximumNumberOfLootSpotsPerBuilding");
_maximumPositionCoverage = getNumber (_lootConfig >> "maximumPositionCoverage");
_maximumNumberOfItemsPerLootSpot = getNumber (_lootConfig >> "maximumNumberOfItemsPerLootSpot");
_numberOfPositionsToUse = 1 max (((count _localPositions) * _maximumPositionCoverage / 100) min _maximumNumberOfLootPositions);
_localPositions = _localPositions call ExileClient_util_array_shuffle;
_lootPositions = _localPositions select [0, _numberOfPositionsToUse];
_spawnedItemClassNames = [];
_lootWeaponHolderNetIDs = [];
{
	_lootPosition = ASLToATL (AGLToASL (_building modelToWorld _x));
	if (_lootPosition select 2 < 0.05) then
	{
		_lootPosition set [2, 0.05];
	};
	_lootHolder = objNull;
	_numberOfItemsToSpawn = (floor (random _maximumNumberOfItemsPerLootSpot)) + 1;
	for "_n" from 1 to _numberOfItemsToSpawn do
	{
		_itemClassName = _lootTableName call ExileServer_system_lootManager_dropItem;
		if !(_itemClassName in _spawnedItemClassNames) then
		{
			if (isNull _lootHolder) then 
			{
				_lootHolder = createVehicle ["LootWeaponHolder", _lootPosition, [], 0, "CAN_COLLIDE"];
				_lootHolder setDir (random 360);
				_lootHolder setPosATL _lootPosition;
				_lootHolder setVariable ["ExileSpawnedAt", time];
				_lootWeaponHolderNetIDs pushBack (netId _lootHolder);											
			};
			_cargoType = _itemClassName call ExileClient_util_cargo_getType;
			switch (_cargoType) do
			{
				case 1: 	
				{ 
					if (_itemClassName isEqualTo "Exile_Item_MountainDupe") then
					{
						_lootHolder addMagazineCargoGlobal [_itemClassName, 2]; 
					}
					else 
					{
						_lootHolder addMagazineCargoGlobal [_itemClassName, 1]; 
					};
				};
				case 3: 	
				{ 
					_lootHolder addBackpackCargoGlobal [_itemClassName, 1]; 
				};
				case 2: 	
				{ 
					_lootHolder addWeaponCargoGlobal [_itemClassName, 1]; 
					if !(_itemClassName isKindOf ["Exile_Melee_Abstract", configFile >> "CfgWeapons"]) then
					{
						_magazineClassNames = getArray(configFile >> "CfgWeapons" >> _itemClassName >> "magazines");
						if (count(_magazineClassNames) > 0) then
						{
							_magazineClassName = selectRandom _magazineClassNames;
							_numberOfMagazines = 2 + floor(random 3); 
							_lootHolder addMagazineCargoGlobal [_magazineClassName, _numberOfMagazines];
							_spawnedItemClassNames pushBack _magazineClassName;
						};
					};
					_numberOfItemsToSpawn = -1;
				};
				default
				{ 
					_lootHolder addItemCargoGlobal [_itemClassName, 1]; 
				};
			};
			_spawnedItemClassNames pushBack _itemClassName;
		};
	};
}
forEach _lootPositions;
_building setVariable ["ExileLootWeaponHolderNetIDs", _lootWeaponHolderNetIDs];
ExileServerBuildingNetIdsWithLoot pushBack (netId _building);