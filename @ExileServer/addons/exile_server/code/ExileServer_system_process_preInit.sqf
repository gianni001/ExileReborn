/**
 * ExileServer_system_process_preInit
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_MySql"];
"Server is loading..." call ExileServer_util_log;
call ExileServer_system_rcon_initialize;
finishMissionInit;
ExileSessionIDs = [];
ExileServerGraveyardGroup = grpNull;
ExileServerBreachingCharges = [];
independent setFriend [sideEnemy, 1];
call ExileServer_system_process_noobFilter;
_MySql_connection = [] call ExileServer_system_database_connect;
call ExileServer_system_network_setupEventHandlers;
if !(getRemoteSensorsDisabled) then
{
	disableRemoteSensors true;
};
PublicServerIsLoaded = false; 
PublicServerVersion = getText(configFile >> "CfgMods" >> "Exile" >> "version");
publicVariable "PublicServerVersion";