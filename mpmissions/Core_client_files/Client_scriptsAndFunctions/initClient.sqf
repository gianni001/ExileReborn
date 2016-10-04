player setVariable ["JohnO_isBeingHunted",false];

ExileReborn_highTemp_lastKnockoutCheck = time;
ExileReborn_highTemp_knockOutCooldown = 120;
lastCommsHack = time;
lastCommsHack_coolDown = 600;
ExileReborn_playerIsKnockedOut = false;

ExileReborn_userActionTimeout = 30;
ExileReborn_userActionTimeout_lastCheck = time;
ExileReborn_userActionArray = [];
ExileReborn_userActions = [];

ExileReborn_lastWoundUpdate = time;

ExileReborn_chanceForInfection = 30; 				// When wounded, chance to become infected
ExileReborn_woundCheckInterval = 300;				// How often infection is handled
ExileReborn_stageOneInfection = 30;					// Infection value to reach stage one -- increments by + 1 per 5 minutes
ExileReborn_stageTwoInfection = 60;					// Infection value stage 2
ExileReborn_stageThreeInfection = 90;				// Infection value stage 3

ExileReborn_ProfileSaveInterval = 1800; 			// Interval at which the players profileNameSpace is saved - default 15 mins, not terribly important, profile is saved on exit / disconnect.

ExileReborn_playerIsWounded = profileNamespace getVariable ["ExileReborn_playerIsWounded",false];
ExileReborn_woundWasTreated = profileNamespace getVariable ["ExileReborn_woundWasTreated",false];
ExileReborn_infectionAmount = profileNamespace getVariable ["ExileReborn_infectionAmount",0];
ExileReborn_playerIsInfected = profileNamespace getVariable ["ExileReborn_playerIsInfected",false];
/*
JohnO_fnc_getRespectTier = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_getRespectTier.sqf";
JohnO_fnc_displayCurrentRespectTier = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_displayCurrentRespectTier.sqf";
JohnO_fnc_headHunterWarning = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_headHunterWarning.sqf";
JohnO_fnc_studyCorpse = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_studyCorpse.sqf";
JohnO_fnc_temperatureStatsUpdate = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_temperatureStatsUpdate.sqf";
JohnO_fnc_startingLoadout = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_startingLoadout.sqf";
JohnO_fnc_getEventLocations = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_getEventLocations.sqf";

JohnO_fnc_getBulletRating = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_getBulletRating.sqf";
JohnO_fnc_maintainKnockOut = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_maintainKnockOut.sqf";

//JohnO_handleCustomActions = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_handleCustomActions.sqf";
JohnO_fnc_applyPressureToWound = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_applyPressureToWound.sqf";
JohnO_fnc_applyBandageToPlayer = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_applyBandageToPlayer.sqf";
JohnO_fnc_applyInstaDocToPlayer = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_applyInstaDocToPlayer.sqf";

JohnO_fnc_handleInfection = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_handleInfection.sqf";

JohnO_fnc_handleChemlightActions = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_handleChemlightActions.sqf";

// Vehicle repair
JohnO_fnc_displayVehicleRepairInfo = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_displayVehicleRepairInfo.sqf";
JohnO_fnc_vehicleRepairCar = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_vehicleRepairCar.sqf";
JohnO_fnc_repairWheels = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_repairWheels.sqf";
JohnO_fnc_repairSingleWheel = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_repairSingleWheel.sqf";
JohnO_fnc_scavengeWheel = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_scavengeWheel.sqf";
JohnO_fnc_repairchopperhalf = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_repairchopperhalf.sqf";
JohnO_fnc_repairchopper = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_repairchopper.sqf";

// Zombies
JohnO_fnc_handlePlayerZombieDetection = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_handlePlayerZombieDetection.sqf";

// Season
JohnO_fnc_getCurrentSeason = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_getCurrentSeason.sqf";

// Rest at fire

JohnO_fnc_restAtFire = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_restAtFire.sqf";
JohnO_fnc_crudeLightFire = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_crudeLightFire.sqf";

// Cooking / hunting

JohnO_fnc_handlePlayerActions = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_handlePlayerActions.sqf";
JohnO_fnc_customConsume = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_customConsume.sqf";
JohnO_fnc_getAnimalType = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_getAnimalType.sqf";

// Get amount of wheels on vehicles

JohnO_fnc_getVehicleType = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_getVehicleType.sqf";

// Scavenge

JohnO_fnc_canScavenge = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_canScavenge.sqf";
JohnO_fnc_canSearchForBerries = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_canSearchForBerries.sqf";
JohnO_fnc_randomItem = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_randomItem.sqf";

// Clothing value

JohnO_fnc_getClothingWarmthValue = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_getClothingWarmthValue.sqf";

// hints

JohnO_fnc_displayHints = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_displayHints.sqf";

// animal warmth

JohnO_fnc_handleDeadAnimalWarmth = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_handleDeadAnimalWarmth.sqf";

// Quests

JohnO_fnc_updateAndAddQuests = compileFinal preprocessFileLineNumbers "Client_scriptsAndFunctions\Functions\JohnO_fnc_updateAndAddQuests.sqf";
*/
[] execVM "Client_scriptsAndFunctions\Scripts\displayRespectInformation.sqf";
[] execVM "Client_scriptsAndFunctions\Scripts\JohnO_script_adjustPlayerStatsDecay.sqf";
[] execVM "Client_scriptsAndFunctions\Scripts\displayTerritoryDueDate.sqf";
[] execVM "Client_scriptsAndFunctions\Scripts\JohnO_script_createPlayerActions.sqf";
[] execVM "Client_scriptsAndFunctions\Scripts\JohnO_script_createHints.sqf";

[180, JohnO_fnc_headHunterWarning, [], true] call ExileClient_system_thread_addtask;
[240, JohnO_fnc_temperatureStatsUpdate, [], true] call ExileClient_system_thread_addtask;
[1, JohnO_fnc_handleInfection, [], true] call ExileClient_system_thread_addtask;
[300, JohnO_fnc_handlePlayerZombieDetection, [], true] call ExileClient_system_thread_addtask;
[2, JohnO_fnc_handlePlayerActions, [], true] call ExileClient_system_thread_addtask;
[600, JohnO_fnc_displayHints, [], true] call ExileClient_system_thread_addtask;
[180, JohnO_fnc_handleDeadAnimalWarmth, [], true] call ExileClient_system_thread_addtask;