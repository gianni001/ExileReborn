/**
 * ExileServer_system_territory_updateNearConstructions
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_flag","_territoryDatabaseID","_territoryRange","_constructionDatabaseIDs","_constructionDatabaseID"];
_flag = _this;
_territoryDatabaseID = _flag getVariable ["ExileDatabaseID", 0];
_territoryRange = _flag getVariable ["ExileTerritorySize", 0];
_constructionDatabaseIDs = [];
{
	_constructionDatabaseID = _x getVariable ["ExileDatabaseID", ""];
	if !(_constructionDatabaseID isEqualTo "") then 
	{
		_constructionDatabaseIDs pushBack _constructionDatabaseID;
	};
}
forEach (_flag nearObjects ["Exile_Construction_Abstract", _territoryRange]);
if !(_constructionDatabaseIDs isEqualTo []) then 
{
	(format ["updateConstructionTerritoryIDs:%1:%2", _territoryDatabaseID, _constructionDatabaseIDs joinString ',']) call ExileServer_system_database_query_fireAndForget;
};