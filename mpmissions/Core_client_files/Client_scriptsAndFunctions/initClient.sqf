player setVariable ["JohnO_isBeingHunted",false];

ExileReborn_highTemp_lastKnockoutCheck = time;
ExileReborn_highTemp_knockOutCooldown = 120;
lastCommsHack = time;
lastCommsHack_coolDown = 600;
ExileReborn_playerIsKnockedOut = false;
ExileReborn_lastHealingReward = time;
ExileReborn_healingCoolDown = 180;
ExileReborn_lastHeartBeat = time;
ExileReborn_heartBeatInterval = 10;
ExileRebornClient_CustomHit_soundIsPlaying = false;

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

[] execVM "Client_scriptsAndFunctions\Scripts\displayRespectInformation.sqf";
[] execVM "Client_scriptsAndFunctions\Scripts\JohnO_script_adjustPlayerStatsDecay.sqf";
[] execVM "Client_scriptsAndFunctions\Scripts\displayTerritoryDueDate.sqf";
[] execVM "Client_scriptsAndFunctions\Scripts\JohnO_script_createPlayerActions.sqf";
[] execVM "Client_scriptsAndFunctions\Scripts\JohnO_script_createHints.sqf";

[180, JohnO_fnc_headHunterWarning, [], true] call ExileClient_system_thread_addtask;
[240, JohnO_fnc_temperatureStatsUpdate, [], true] call ExileClient_system_thread_addtask;
[1, JohnO_fnc_handleCustomEffects, [], true] call ExileClient_system_thread_addtask;
[600, JohnO_fnc_handleSurvivorSpawns, [], true] call ExileClient_system_thread_addtask;
[300, JohnO_fnc_handlePlayerZombieDetection, [], true] call ExileClient_system_thread_addtask;
[2, JohnO_fnc_handlePlayerActions, [], true] call ExileClient_system_thread_addtask;
[600, JohnO_fnc_displayHints, [], true] call ExileClient_system_thread_addtask;
[180, JohnO_fnc_handleDeadAnimalWarmth, [], true] call ExileClient_system_thread_addtask;
