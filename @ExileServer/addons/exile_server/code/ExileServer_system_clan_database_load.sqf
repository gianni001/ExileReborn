/**
 * ExileServer_system_clan_database_load
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_clanID","_clanInfo","_clanMembers","_allMarkers","_markers","_polys","_markerID","_markerType","_position","_color","_icon","_iconSize","_text","_textSize","_marker","_poly","_hashValue"];
_clanID = _this;
_clanInfo = format ["getClanInfo:%1",_clanID] call ExileServer_system_database_query_selectSingle;
_clanMembers = format ["getClanMembers:%1",_clanID] call ExileServer_system_database_query_selectFull;
_allMarkers = format ["getClanMarkers:%1",_clanID] call ExileServer_system_database_query_selectFull;
_markers = [];
_polys = [];
{
	_markerID = _x select 0;
	_markerType = _x select 1;
	_position = _x select 2;
	_color = _x select 3;
	switch _markerType do 
	{ 
		case 0 : 
		{
			_icon = _x select 4;
			_iconSize = _x select 5;
			_text = _x select 6;
			_textSize = _x select 7;
			_marker = [_icon,_color,_position,_iconSize,_text,_textSize,_markerID];
			_markers pushback _marker;
		}; 
		case 1 : 
		{
			_poly = [_position,_color,_markerID];
			_polys pushback _poly;
		}; 
		default
		{
		}; 
	};
}
forEach _allMarkers;
_hashValue = 
[
	_clanInfo select 0,		
	_clanInfo select 1,		
	_clanMembers,			
	_markers,				
	_polys,					
	grpNull
];
missionNamespace setVariable [format ["ExileServer_clan_%1",_clanID],_hashValue];
true