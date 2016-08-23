/**
 * ExileServer_system_territory_database_insert
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_flagObject","_territoryName","_flagTexture","_territorySize","_owner","_position","_build","_moderators","_data","_extDB2Message","_territoryID"];
_flagObject = _this select 0;
_territoryName = _this select 1;
_flagTexture = _this select 2;
_territorySize = ((getArray(missionConfigFile >> "CfgTerritories" >> "prices")) select 0)select 1;
_owner = _flagObject getVariable ["ExileOwnerUID",""];
_position = getPosATL _flagObject;
_build_rights = _flagObject getVariable ["ExileTerritoryBuildRights",[]];
_moderators = _flagObject getVariable ["ExileTerritoryModerators",[]];
_data =
[
	_owner,
	_territoryName,
	_position select 0,
	_position select 1,
	_position select 2,
	_territorySize,
	1,
	_flagTexture,
	0,
	_build_rights,
	_moderators,
	"Null"
];
_extDB2Message = ["createTerritory", _data] call ExileServer_util_extDB2_createMessage;
_territoryID = _extDB2Message call ExileServer_system_database_query_insertSingle;
_flagObject setVariable ["ExileDatabaseID",_territoryID];
_flagObject setVariable ["ExileFlagTexture",_flagTexture];
true