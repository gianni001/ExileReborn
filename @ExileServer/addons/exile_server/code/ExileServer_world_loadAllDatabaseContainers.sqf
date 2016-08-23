/**
 * ExileServer_world_loadAllDatabaseContainers
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_continueLoading","_page","_pageSize","_containerIDs","_numberOfContainers","_i"];
"Loading containers from database..." call ExileServer_util_log;
_continueLoading = true;
_page = 0;
_pageSize = 100;
ExileAbandondedSafes = [];
ExileContainerCargo = [];
while {_continueLoading} do 
{
	_containerIDs = format ["loadContainerIdPage:%1:%2", _page * _pageSize, _pageSize] call ExileServer_system_database_query_selectFull;
	_numberOfContainers = count _containerIDs;
	if (_numberOfContainers > 0) then 
	{
		for "_i" from 0 to _numberOfContainers - 1 do 
		{
			((_containerIDs select _i) select 0) call ExileServer_object_container_database_load;
		};
	};
	_page = _page + 1;
	if (_numberOfContainers < 100) then
	{
		_continueLoading = false;
	};
};
"Done loading containers!" call ExileServer_util_log;
true