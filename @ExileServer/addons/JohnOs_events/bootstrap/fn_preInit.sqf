private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;

    _code = compileFinal (preprocessFileLineNumbers _file);                    

    missionNamespace setVariable [_function, _code];
}
forEach 
[
	// Initialize
	['JohnO_events_initialize','JohnOs_events\addons\Events\events_config.sqf'],
	// Functions
	['JohnO_fnc_handleCrashSmoke','JohnOs_events\addons\functions\Server\JohnO_fnc_handleCrashSmoke.sqf'],
	['JohnO_fnc_headHunters','JohnOs_events\addons\functions\Server\JohnO_fnc_headHunters.sqf'],
	['JohnO_fnc_taskPatrol','JohnOs_events\addons\functions\Server\JohnO_fnc_taskPatrol.sqf'],
	['JohnO_fnc_spawnAIGroup','JohnOs_events\addons\functions\Server\JohnO_fnc_spawnAIGroup.sqf'],
	['ExileServer_JohnO_network_spawnAIgroup','JohnOs_events\addons\functions\Server\ExileServer_JohnO_network_spawnAIgroup.sqf'],
	['ExileServer_JohnO_network_spawnHuntersOnTarget','JohnOs_events\addons\functions\Server\ExileServer_JohnO_network_spawnHuntersOnTarget.sqf'],
	['JohnO_fnc_wages','JohnOs_events\addons\functions\Server\JohnO_fnc_wages.sqf'],
	['JohnO_fnc_findSafeTownPosition','JohnOs_events\addons\functions\Server\JohnO_fnc_findSafeTownPosition.sqf'],
	['JohnO_fnc_simulationManager','JohnOs_events\addons\Events\JohnO_fnc_simulationManager.sqf'],
	['JohnO_fnc_getRandomItems_new','JohnOs_events\addons\functions\Server\JohnO_fnc_getRandomItems_new.sqf'],
	['JohnO_fnc_AIgear','JohnOs_events\addons\functions\Server\JohnO_fnc_AIgear.sqf'],
	['JohnO_fnc_eventMonitor','JohnOs_events\addons\functions\Server\JohnO_fnc_eventMonitor.sqf'],
	['ExileServer_JohnO_network_spawnZombieNearTarget','JohnOs_events\addons\functions\Server\ExileServer_JohnO_network_spawnZombieNearTarget.sqf'],
	['JohnO_fnc_zombieIdleBehaviour','JohnOs_events\addons\functions\Server\JohnO_fnc_zombieIdleBehaviour.sqf'],
	['JohnO_fnc_zombieLogic','JohnOs_events\addons\functions\Server\JohnO_fnc_zombieLogic.sqf'],
	['JohnO_fnc_findZombieTarget','JohnOs_events\addons\functions\Server\JohnO_fnc_findZombieTarget.sqf'],
	['JohnO_zombie_eventOnFiredNear','JohnOs_events\addons\functions\Server\JohnO_zombie_eventOnFiredNear.sqf'],
	['JohnO_fnc_createZombieHoard','JohnOs_events\addons\functions\Server\JohnO_fnc_createZombieHoard.sqf'],
	['JohnO_fnc_hoardLogic','JohnOs_events\addons\functions\Server\JohnO_fnc_hoardLogic.sqf'],
	['JohnO_fnc_spawnZombieHoardEvent','JohnOs_events\addons\functions\Server\JohnO_fnc_spawnZombieHoardEvent.sqf'],
	['ExileServer_JohnO_network_hideObjectGlobal','JohnOs_events\addons\functions\Server\ExileServer_JohnO_network_hideObjectGlobal.sqf'],
	['JohnO_fnc_getCurrentSeason_server','JohnOs_events\addons\functions\Server\JohnO_fnc_getCurrentSeason_server.sqf'],
	['JohnO_fnc_animalEventOnKilled','JohnOs_events\addons\functions\Server\JohnO_fnc_animalEventOnKilled.sqf'],
	['ExileServer_JohnO_network_spawnSurvivorNearTarget','JohnOs_events\addons\functions\Server\ExileServer_JohnO_network_spawnSurvivorNearTarget.sqf'],
	['JohnO_fnc_survivorAIBrain','JohnOs_events\addons\functions\Server\JohnO_fnc_survivorAIBrain.sqf'],
	['ExileServer_JohnO_network_updateRespectAndTabs','JohnOs_events\addons\functions\Server\ExileServer_JohnO_network_updateRespectAndTabs.sqf'],
	['JohnO_fnc_countAIunits','JohnOs_events\addons\functions\Server\JohnO_fnc_countAIunits.sqf'],
	['JohnO_fnc_generateMapGarbageAndWrecks','JohnOs_events\addons\functions\Server\JohnO_fnc_generateMapGarbageAndWrecks.sqf'],
	['JohnO_fnc_getSpawnPositionInRegion','JohnOs_events\addons\functions\Server\JohnO_fnc_getSpawnPositionInRegion.sqf'],
	// Events	
	['JohnO_fnc_heliCrash_new','JohnOs_events\addons\Events\heliCrash\JohnO_fnc_heliCrash_new.sqf'],
	['JohnO_fnc_supplyDropObject_new','JohnOs_events\addons\Events\supplyDrop\JohnO_fnc_supplyDropObject_new.sqf'],
	['JohnO_fnc_supplyDrop_spawnEvent','JohnOs_events\addons\Events\supplyDrop\JohnO_fnc_supplyDrop_spawnEvent.sqf'],
	['JohnO_fnc_spawnStormEvent','JohnOs_events\addons\Events\lightningStorm\JohnO_fnc_spawnStormEvent.sqf'],
	['JohnO_fnc_createStorm','JohnOs_events\addons\Events\lightningStorm\JohnO_fnc_createStorm.sqf'],
	['JohnO_fnc_spawnRoamingAI','JohnOs_events\addons\Events\Radiation_AI\JohnO_fnc_spawnRoamingAI.sqf'],
	['JohnO_fnc_spawnDynamicAI','JohnOs_events\addons\Events\Radiation_AI\JohnO_fnc_spawnDynamicAI.sqf'],
	['JohnO_fnc_spawnHeadHunters','JohnOs_events\addons\Events\Radiation_AI\JohnO_fnc_spawnHeadHunters.sqf']	
];

[] spawn JohnO_events_initialize;

diag_log "Initializing JohnOs_events...";
true
