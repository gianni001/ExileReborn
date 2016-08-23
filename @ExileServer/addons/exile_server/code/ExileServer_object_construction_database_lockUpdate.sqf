/**
 * ExileServer_object_construction_database_lockUpdate
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_door","_databaseID","_lock"];
_door = _this;
_databaseID = _door getVariable ["ExileDatabaseID",0];
_lock = _door getVariable ["ExileIsLocked",1];
format ["updateLock:%1:%2",_lock,_databaseID] call ExileServer_system_database_query_fireAndForget;
true
