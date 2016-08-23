/**
 * ExileServer_system_territory_maintenance_recalculateDueDate
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_flag","_currentTimestamp","_flagBuild","_maintenancePeriod","_maintenancePeriodDueDate"];
_flag = _this;
_currentTimestamp = call ExileServer_util_time_currentTime;
_flagBuild = _flag getVariable ["ExileTerritoryLastPayed", _currentTimestamp];
_maintenancePeriod = getNumber(configFile >> "CfgSettings" >> "GarbageCollector" >> "Database" >> "territoryLifeTime");
_maintenancePeriodDueDate = call compile ("extDB2" callExtension format["9:DATEADD:%1:[%2,0,0,0]",_flagBuild,_maintenancePeriod]);
_flag setVariable ["ExileTerritoryMaintenanceDue", _maintenancePeriodDueDate select 1, true];
true