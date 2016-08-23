/**
 * ExileServer_world_loadAllTerritories
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_continueLoading","_page","_pageSize","_territoryIDs","_numberOfTerritories","_i"];
ExileLocations = [];
"Loading territories from database..." call ExileServer_util_log;
_continueLoading = true;
_page = 0;
_pageSize = 100;
while {_continueLoading} do 
{
	_territoryIDs = format ["loadTerriotryIdPage:%1:%2", _page * _pageSize, _pageSize] call ExileServer_system_database_query_selectFull;
	_numberOfTerritories = count _territoryIDs;
	if (_numberOfTerritories > 0) then 
	{
		for "_i" from 0 to _numberOfTerritories - 1 do 
		{
			((_territoryIDs select _i)select 0) call ExileServer_system_territory_database_load;
		};
	};
	_page = _page + 1;
	if (_numberOfTerritories < 100) then
	{
		_continueLoading = false;
	};
};
"Done loading territories!" call ExileServer_util_log;
true