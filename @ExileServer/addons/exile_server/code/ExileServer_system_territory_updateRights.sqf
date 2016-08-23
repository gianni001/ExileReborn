/**
 * ExileServer_system_territory_updateRights
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_flag","_moderatedPlayerUID","_newUserLevel","_buildRights","_moderatorRights","_owner","_databaseID"];
_flag = _this select 0;
_moderatedPlayerUID = _this select 1;
_newUserLevel = _this select 2;
_buildRights = _flag getVariable ["ExileTerritoryBuildRights",[]];
_moderatorRights = _flag getVariable ["ExileTerritoryModerators",[]];
_owner = _flag getVariable ["ExileOwnerUID",""];
_databaseID = _flag getVariable ["ExileDatabaseID",0];
switch (_newUserLevel) do 
{ 
	case 1 :
	{
		if (_moderatedPlayerUID in _moderatorRights) then
		{	
			_moderatorRights deleteAt (_moderatorRights find _moderatedPlayerUID);
		};
	}; 
	case 2 : 
	{
		if !(_moderatedPlayerUID in _moderatorRights) then
		{
			_moderatorRights pushBack _moderatedPlayerUID;
		};
	}; 
	default {};
};
_flag setVariable ["ExileTerritoryModerators",_moderatorRights,true];
format ["updateTerritoryModerators:%1:%2",_moderatorRights,_databaseID] call ExileServer_system_database_query_fireAndForget;
true