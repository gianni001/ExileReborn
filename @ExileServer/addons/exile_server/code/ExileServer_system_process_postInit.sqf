/**
 * ExileServer_system_process_postInit
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
if (!isNil "PublicServerVersion") then
{
	call ExileClient_system_map_initialize;
	call ExileServer_system_thread_initialize;
	call ExileServer_system_playerSaveQueue_initialize;
	call ExileServer_system_swapOwnershipQueue_initialize;
	call ExileServer_system_vehicleSaveQueue_initialize;
	call ExileServer_system_simulationMonitor_initialize;
	call ExileServer_system_lootManager_initialize;
	call ExileServer_system_weather_initialize;
	call ExileServer_system_garbageCollector_cleanDatabase;
	call ExileServer_system_event_initialize;
	call ExileServer_world_initialize;
	call ExileServer_system_russianRoulette_initialize;
	PublicServerIsLoaded = true; 
	publicVariable "PublicServerIsLoaded";
	format ["Server is up and running! Version: %1", PublicServerVersion] call ExileServer_util_log;
	call ExileServer_system_garbageCollector_start;
	call ExileServer_system_rcon_event_ready;
};