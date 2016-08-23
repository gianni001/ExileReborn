/**
 * ExileServer_system_territory_updateNearContainers
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_flag","_territoryDatabaseID","_territoryRange","_containerDatabaseIDs","_containerDatabaseID"];
_flag = _this;
_territoryDatabaseID = _flag getVariable ["ExileDatabaseID", 0];
_territoryRange = _flag getVariable ["ExileTerritorySize", 0];
_containerDatabaseIDs = [];
{
	_containerDatabaseID = _x getVariable ["ExileDatabaseID", ""];
	if !(_containerDatabaseID isEqualTo "") then 
	{
		_containerDatabaseIDs pushBack _containerDatabaseID;
	};
}
forEach (_flag nearObjects ["Exile_Container_Abstract", _territoryRange]);
if !(_containerDatabaseIDs isEqualTo []) then 
{
	(format ["updateContainerTerritoryIDs:%1:%2", _territoryDatabaseID, _containerDatabaseIDs joinString ',']) call ExileServer_system_database_query_fireAndForget;
};