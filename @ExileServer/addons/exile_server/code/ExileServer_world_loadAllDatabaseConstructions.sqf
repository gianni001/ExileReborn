/**
 * ExileServer_world_loadAllDatabaseConstructions
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_continueLoading","_page","_pageSize","_constructionIDs","_numberOfConstructions","_i"];
"Loading constructions from database..." call ExileServer_util_log;
_continueLoading = true;
_page = 0;
_pageSize = 100;
while {_continueLoading} do 
{
	_constructionIDs = format ["loadConstructionIdPage:%1:%2", _page * _pageSize, _pageSize] call ExileServer_system_database_query_selectFull;
	_numberOfConstructions = count _constructionIDs;
	if (_numberOfConstructions > 0) then 
	{
		for "_i" from 0 to _numberOfConstructions - 1 do 
		{
			((_constructionIDs select _i) select 0) call ExileServer_object_construction_database_load;
		};
	};
	_page = _page + 1;
	if (_numberOfConstructions < 100) then
	{
		_continueLoading = false;
	};
};
"Done loading constructions!" call ExileServer_util_log;
true