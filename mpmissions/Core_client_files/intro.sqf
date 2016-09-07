/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private ["_objectStorage", "_staticObjectTemplates"];
/*
// Preload camery settings
waitUntil { preloadCamera [29549.7,1508.77,189.029] };

// Remember what we have instanciated, so we can clean up a bit
_objectStorage = [];

// Static objects for the scene
_staticObjectTemplates = 
[
    ["Land_Pier_F",[29566.7,1512.72,186.76],182.273,0,0,false],
    ["Land_Pier_wall_F",[29566.6,1560.03,186.705],1.36361,0,0,false],
    ["Land_Pier_Box_F",[29539.6,1550.11,192.115],0,0,0,false],
    ["Land_Pier_F",[29596.6,1533.61,186.95],91.8181,0,0,false],
    ["Land_Bunker_F",[29580.4,1509.79,189.09],95.4545,0,0,false],
    ["Land_MilOffices_V1_F",[29600.1,1534.35,189.543],90.909,0,0,false],
    ["Land_Pier_Box_F",[29591.6,1507.34,200.259],95.0001,0,0,false],
    ["Land_Pier_F",[29562.8,1502.29,186.759],2.27276,0,0,false],
    ["Land_Airport_Tower_F",[29540.2,1549.9,192.079],0,0,0,false],
    ["Land_JetEngineStarter_01_F",[29579.3,1496.5,189.031],18.6364,0,0,false],
    ["Land_Radar_F",[29598.7,1561.89,191.255],8.18185,0,0,false],
    ["Exile_Sign_TraderCity",[29546.8,1517.4,189.039],272,0,0,false],
    ["Land_TTowerBig_1_F",[29592,1507.42,201.014],3.18181,0,0,false],
    ["Submarine_01_F",[29524.1,1476.42,176.398],147.273,0,0,false],
    ["C_Boat_Civil_04_F",[29562.7,1535.25,179.236],271.364,0,0,false]
];

{
    private ["_staticObject"];

    _staticObject = (_x select 0) createVehicleLocal [0,0,0];
    _staticObject setDir (_x select 2);
    _staticObject setPosATL (_x select 1);
    _staticObject enableSimulation false; 

    _objectStorage pushBack _staticObject;
}
forEach _staticObjectTemplates;

// Create the chopper and close all doors
_chopper = "O_Heli_Transport_04_covered_F" createVehicleLocal [0,0,0];
_chopper setDir 326.364;
_chopper setPosATL [29549.7,1508.77,189.029];
_chopper enableSimulation true;  
_chopper animateDoor ['Door_1_source', 0, true]; 
_chopper animateDoor ['Door_2_source', 0, true];
_chopper animateDoor ['Door_3_source', 0, true];
_chopper animateDoor ['Door_4_source', 0, true];
_chopper animateDoor ['Door_5_source', 0, true];
_chopper animateDoor ['Door_6_source', 0, true];

_objectStorage pushBack _chopper;

// Prisoner 1
_prisoner01 = 
[
    "Exile_Cutscene_Prisoner01",
    "AfricanHead_01",
    ["Acts_AidlPsitMstpSsurWnonDnon01"],
    [29552.5,1510.03,189.027],
    341.323
]
call ExileClient_object_trader_create;

_objectStorage pushBack _prisoner01;

// Prisoner 2
_prisoner02 = 
[
    "Exile_Cutscene_Prisoner02",
    "WhiteHead_03",
    ["InBaseMoves_HandsBehindBack1"],
    [29550.4,1509.77,189.026],
    45.1028
]
call ExileClient_object_trader_create;

_objectStorage pushBack _prisoner02;

// Pilot, just statnding there
_pilot = 
[
    "Exile_Cutscene_Pilot",
    "PersianHead_A3_02",
    ["passendger_flatground_1_Idle_Unarmed"],
    [29549.5,1512.48,189.031], 
    82.2734
]
call ExileClient_object_trader_create;

_objectStorage pushBack _pilot;

// Boss, treating us
_boss = 
[
    "Exile_Cutscene_Police01",
    "GreekHead_A3_08",
    ["Acts_Abuse_abusing"],
    [29556.3,1513.86,189.033],
    88.0126
]
call ExileClient_object_trader_create;

_objectStorage pushBack _boss;

// Guard 1
_police01 = 
[
    "Exile_Cutscene_Police02",
    "GreekHead_A3_08",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [29549.4,1518,189.04],
    139.341
]
call ExileClient_object_trader_create;

_objectStorage pushBack _police01;

// Guard 2
_police02 = 
[
    "Exile_Cutscene_Police01",
    "GreekHead_A3_08",
    ["InBaseMoves_patrolling1"],
    [29555.1,1516.7,189.038],
    205.865
]
call ExileClient_object_trader_create;

_objectStorage pushBack _police02;

// And our small player fale
_player = 
[
    "Exile_Cutscene_Player",
    "WhiteHead_01",
    ["Acts_Abuse_abuser"],
    [29556.3,1513.86,189.033],
    88.0126
]
call ExileClient_object_trader_create;

_objectStorage pushBack _player;

_player allowDamage false; // It can bleed thou
*/
// End the loading screen
endLoadingScreen;

/*
// Fade in sound
3 fadeSound 1;

cutText ["", "BLACK IN", 3];

// GOGO ! :)

_camera = "camera" camCreate (_player modelToWorld [0, 0, 10]);
_camera camSetTarget _player; 
_camera cameraEffect ["EXTERNAL", "BACK TOP"];
_camera camSetRelPos [0, 0.7, 1.5];
_camera camCommand "inertia on";
_camera camCommit 1;

uiSleep 1;

_boss say ["ExileIntro01", 5];

uiSleep 3;

_boss say ["ExileIntro02", 5];

uiSleep 5;

[300] call BIS_fnc_bloodEffect;

_player setdamage 0.5;
_player setBleedingRemaining 3;
_player say ["ExileIntro10", 5];

uiSleep 1;

_boss say ["ExileIntro03", 5];

uiSleep 3;

_boss say ["ExileIntro04", 5];

uisleep 6;

_boss say ["ExileIntro05", 5];

uisleep 5;

_boss say ["ExileIntro07", 5];
_chopper engineOn true;

uisleep 3;

_boss say ["ExileIntro08", 5];

_chopper animateDoor ['Door_1_source', 1, false]; 
_chopper animateDoor ['Door_2_source', 1, false]; 

uiSleep 10;

_boss say ["ExileIntro09", 5];

// Open chopper doors
_chopper animateDoor ['Door_3_source', 1, false]; 
_chopper animateDoor ['Door_4_source', 1, false]; 
_chopper animateDoor ['Door_5_source', 1, false]; 
_chopper animateDoor ['Door_6_source', 1, false]; 

uisleep 15;

// Fade out sound and screen to black/silent
5 fadeSound 0;
titleText ["", "BLACK OUT", 5];

// Cleanup after 5 seconds
uiSleep 5;

_camera cameraEffect ["terminate","back"];

camDestroy _camera;

{
    deleteVehicle _x;
}
forEach _objectStorage;
*/
ExileClientIntroIsPlaying = false;

true