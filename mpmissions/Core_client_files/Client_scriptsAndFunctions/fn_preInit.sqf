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
	["JohnO_fnc_getRespectTier","Client_scriptsAndFunctions\Functions\JohnO_fnc_getRespectTier.sqf"],
	["JohnO_fnc_displayCurrentRespectTier","Client_scriptsAndFunctions\Functions\JohnO_fnc_displayCurrentRespectTier.sqf"],
	["JohnO_fnc_headHunterWarning","Client_scriptsAndFunctions\Functions\JohnO_fnc_headHunterWarning.sqf"],
	["JohnO_fnc_studyCorpse","Client_scriptsAndFunctions\Functions\JohnO_fnc_studyCorpse.sqf"],
	["JohnO_fnc_temperatureStatsUpdate","Client_scriptsAndFunctions\Functions\JohnO_fnc_temperatureStatsUpdate.sqf"],
	["JohnO_fnc_startingLoadout","Client_scriptsAndFunctions\Functions\JohnO_fnc_startingLoadout.sqf"],
	["JohnO_fnc_getEventLocations","Client_scriptsAndFunctions\Functions\JohnO_fnc_getEventLocations.sqf"],
	["JohnO_fnc_getBulletRating","Client_scriptsAndFunctions\Functions\JohnO_fnc_getBulletRating.sqf"],
	["JohnO_fnc_maintainKnockOut","Client_scriptsAndFunctions\Functions\JohnO_fnc_maintainKnockOut.sqf"],
	//JohnO_handleCustomActions","Client_scriptsAndFunctions\Functions\JohnO_handleCustomActions.sqf"],
	["JohnO_fnc_applyPressureToWound","Client_scriptsAndFunctions\Functions\JohnO_fnc_applyPressureToWound.sqf"],
	["JohnO_fnc_applyBandageToPlayer","Client_scriptsAndFunctions\Functions\JohnO_fnc_applyBandageToPlayer.sqf"],
	["JohnO_fnc_applyInstaDocToPlayer","Client_scriptsAndFunctions\Functions\JohnO_fnc_applyInstaDocToPlayer.sqf"],
	["JohnO_fnc_handleCustomEffects","Client_scriptsAndFunctions\Functions\JohnO_fnc_handleCustomEffects.sqf"],
	["JohnO_fnc_handleChemlightActions","Client_scriptsAndFunctions\Functions\JohnO_fnc_handleChemlightActions.sqf"],
	// Vehicle repair
	["JohnO_fnc_displayVehicleRepairInfo","Client_scriptsAndFunctions\Functions\JohnO_fnc_displayVehicleRepairInfo.sqf"],
	["JohnO_fnc_vehicleRepairCar","Client_scriptsAndFunctions\Functions\JohnO_fnc_vehicleRepairCar.sqf"],
	["JohnO_fnc_repairWheels","Client_scriptsAndFunctions\Functions\JohnO_fnc_repairWheels.sqf"],
	["JohnO_fnc_repairSingleWheel","Client_scriptsAndFunctions\Functions\JohnO_fnc_repairSingleWheel.sqf"],
	["JohnO_fnc_scavengeWheel","Client_scriptsAndFunctions\Functions\JohnO_fnc_scavengeWheel.sqf"],
	["JohnO_fnc_repairchopperhalf","Client_scriptsAndFunctions\Functions\JohnO_fnc_repairchopperhalf.sqf"],
	["JohnO_fnc_repairchopper","Client_scriptsAndFunctions\Functions\JohnO_fnc_repairchopper.sqf"],
	// Zombies
	["JohnO_fnc_handlePlayerZombieDetection","Client_scriptsAndFunctions\Functions\JohnO_fnc_handlePlayerZombieDetection.sqf"],
	// Season
	["JohnO_fnc_getCurrentSeason","Client_scriptsAndFunctions\Functions\JohnO_fnc_getCurrentSeason.sqf"],
	// Rest at fire
	["JohnO_fnc_restAtFire","Client_scriptsAndFunctions\Functions\JohnO_fnc_restAtFire.sqf"],
	["JohnO_fnc_crudeLightFire","Client_scriptsAndFunctions\Functions\JohnO_fnc_crudeLightFire.sqf"],
	// Cooking / hunting
	["JohnO_fnc_handlePlayerActions","Client_scriptsAndFunctions\Functions\JohnO_fnc_handlePlayerActions.sqf"],
	["JohnO_fnc_customConsume","Client_scriptsAndFunctions\Functions\JohnO_fnc_customConsume.sqf"],
	["JohnO_fnc_getAnimalType","Client_scriptsAndFunctions\Functions\JohnO_fnc_getAnimalType.sqf"],
	// Get amount of wheels on vehicles
	["JohnO_fnc_getVehicleType","Client_scriptsAndFunctions\Functions\JohnO_fnc_getVehicleType.sqf"],
	// Scavenge
	["JohnO_fnc_canScavenge","Client_scriptsAndFunctions\Functions\JohnO_fnc_canScavenge.sqf"],
	["JohnO_fnc_canSearchForBerries","Client_scriptsAndFunctions\Functions\JohnO_fnc_canSearchForBerries.sqf"],
	["JohnO_fnc_randomItem","Client_scriptsAndFunctions\Functions\JohnO_fnc_randomItem.sqf"],
	// Clothing value
	["JohnO_fnc_getClothingWarmthValue","Client_scriptsAndFunctions\Functions\JohnO_fnc_getClothingWarmthValue.sqf"],
	// hints
	["JohnO_fnc_displayHints","Client_scriptsAndFunctions\Functions\JohnO_fnc_displayHints.sqf"],
	// animal warmth
	["JohnO_fnc_handleDeadAnimalWarmth","Client_scriptsAndFunctions\Functions\JohnO_fnc_handleDeadAnimalWarmth.sqf"],
	// Quests
	["JohnO_fnc_updateAndAddQuests","Client_scriptsAndFunctions\Functions\JohnO_fnc_updateAndAddQuests.sqf"],
	// AI Survivor spawn
	["JohnO_fnc_handleSurvivorSpawns","Client_scriptsAndFunctions\Functions\JohnO_fnc_handleSurvivorSpawns.sqf"],
	// AI survivor behaviour
	["JohnO_fnc_survivorFollowMe","Client_scriptsAndFunctions\Functions\JohnO_fnc_survivorFollowMe.sqf"],
	["JohnO_fnc_survivorLeave","Client_scriptsAndFunctions\Functions\JohnO_fnc_survivorLeave.sqf"],
	["JohnO_fnc_bribeSurvivor","Client_scriptsAndFunctions\Functions\JohnO_fnc_bribeSurvivor.sqf"],
	// Update respect and tabs
	["JohnO_fnc_updateRespectAndTabs","Client_scriptsAndFunctions\Functions\JohnO_fnc_updateRespectAndTabs.sqf"],
	// Custom hit sounds
	["JohnO_fnc_playCustomHitSound","Client_scriptsAndFunctions\Functions\JohnO_fnc_playCustomHitSound.sqf"]
];

true

