/**
 * ExileServer_world_loadAllClans
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_continueLoading","_page","_pageSize","_clanIDs","_numberOfClans","_i"];
"Loading families from database..." call ExileServer_util_log;
_continueLoading = true;
_page = 0;
_pageSize = 100;
while {_continueLoading} do 
{
	_clanIDs = format ["loadClansIdPage:%1:%2", _page * _pageSize, _pageSize] call ExileServer_system_database_query_selectFull;
	_numberOfClans = count _clanIDs;
	if (_numberOfClans > 0) then 
	{
		for "_i" from 0 to _numberOfClans - 1 do 
		{
			((_clanIDs select _i) select 0) call ExileServer_system_clan_database_load;
		};
	};
	_page = _page + 1;
	if (_numberOfClans < 100) then
	{
		_continueLoading = false;
	};
};
"Done loading families!" call ExileServer_util_log;
true