/**
 * ExileServer_system_xm8_sendProtectionMoneyDue
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_flags","_maintenancePeriod","_territoryIDs","_id","_flag","_recipients","_territoryName"];
_flags = allMissionObjects "Exile_Construction_Flag_Static";
_maintenancePeriod = getNumber(configFile >> "CfgSettings" >> "GarbageCollector" >> "Database" >> "territoryLifeTime");
_territoryIDs = format ["getAllNotifTerritory:%1",_maintenancePeriod] call ExileServer_system_database_query_selectFull;
if!(_territoryIDs isEqualTo [])then
{
	if!(_flags isEqualTo [])then
	{
		{
			_id = _x select 0; 
			{
				_flag = _x;
				if((_flag getVariable ["ExileDatabaseID",-1]) isEqualTo _id)exitWith
				{
					_recipients = _flag getVariable ["ExileTerritoryBuildRights", []];
					_territoryName = _flag getVariable ["ExileTerritoryName", ""];
					["protection-money-due", _recipients, _territoryName] call ExileServer_system_xm8_send;
					format ["setTerritoryNotified:1:%1",_id] call ExileServer_system_database_query_fireAndForget;
				};
			}
			forEach _flags;
		}
		forEach _territoryIDs;
	};
};
true