/*
 **  BLOWOUT MODULE - Nightstalkers: Shadow of Namalsk
 *   ..created by Sumrak, ©2010
 *   http://www.nightstalkers.cz
 *   sumrak<at>nightstalkers.cz
 *   PBO edition
 *   CLIENT-SIDE script
*/

bl_detection =
{
    playSound "bl_detect";
    sleep 0.2;
    playSound "bl_detect";
    sleep 0.5;
    cutRsc ["RscAPSI_h1","PLAIN"];
    playSound "bl_detect";
    sleep 0.1;
    playSound "bl_detect";
    sleep 1;
    cutRsc ["RscAPSI_h2","PLAIN"];
    sleep 1;
    playSound "bl_detect";
    cutRsc ["RscAPSI_h3","PLAIN"];
    playSound "apsi_on";
    "filmGrain" ppEffectEnable true;
    "filmGrain" ppEffectAdjust [0.15, 1, 1, 0.1, 1, false];
    "filmGrain" ppEffectCommit 0;
    sleep 1;
    playSound "bl_detect";
    sleep 0.2;
    playSound "bl_detect";
    cutRsc ["RscAPSI_h4","PLAIN"];
    sleep 23.8;
    if (isNil("ns_blow_status")) then { ns_blow_status = false; };
    waitUntil{ns_blow_status};
    playSound "bl_detect";
    sleep 0.2;
    playSound "bl_detect";
    cutRsc ["RscAPSI_h5","PLAIN"];

};

bl_flash =
{
    titleText["","WHITE OUT",1];
    titleText["","WHITE IN",1];
    sleep 0.25;
};

bl_local_anims =
{
//undefined fix

        if (!([player] call fnc_hasAPSI) && (Alive player)) then
        {
            if ((vehicle player) == player) then
            {
                if !(ExileReborn_playerIsKnockedOut) then
                {
                    player switchMove "AcinPercMrunSnonWnonDf_agony";
                };
            };
        };
};

bl_local_def_anim =
{
//undefined fix
        if (!([player] call fnc_hasAPSI)&& (Alive player)) then
        {
            if ((vehicle player) == player) then
            {
                player switchMove "";
            };
        };
};

bl_preparations = {
    playSound "ns_fx_drone2";
    "chromAberration" ppEffectAdjust [0.25,0,true];
    "chromAberration" ppEffectEnable true;
    "chromAberration" ppEffectCommit 0.5;
    sleep 0.2;
    "chromAberration" ppEffectAdjust [-0.15,0,true];
    "chromAberration" ppEffectCommit 0.35;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [-0.05,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [0,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.25;
    "chromAberration" ppEffectEnable false;

    sleep 4;

    ExileClientPlayerIsInCombat = true;
    ExileClientPlayerLastCombatAt = diag_tickTime;
    true call ExileClient_gui_hud_toggleCombatIcon;

    playSound "ns_fx_drone1";
    "chromAberration" ppEffectAdjust [0.25,0,true];
    "chromAberration" ppEffectEnable true;
    "chromAberration" ppEffectCommit 0.5;
    sleep 0.2;
    "chromAberration" ppEffectAdjust [-0.15,0,true];
    "chromAberration" ppEffectCommit 0.35;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [-0.05,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [0,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.25;
    "chromAberration" ppEffectEnable false;

    //-------------------------------------------------
    sleep 34;

    ExileClientPlayerIsInCombat = true;
    ExileClientPlayerLastCombatAt = diag_tickTime;
    true call ExileClient_gui_hud_toggleCombatIcon;

    systemChat "Its comming..";

    sleep 24;
    //-------------------------------------------------

    playSound "ns_fx_misc4";

    ExileClientPlayerIsInCombat = true;
    ExileClientPlayerLastCombatAt = diag_tickTime;
    true call ExileClient_gui_hud_toggleCombatIcon;

    //-------------------------------------------------
    sleep 13.5;
    //-------------------------------------------------

    ExileClientPlayerIsInCombat = true;
    ExileClientPlayerLastCombatAt = diag_tickTime;
    true call ExileClient_gui_hud_toggleCombatIcon;

    playSound "ns_fx_drone2";
    "chromAberration" ppEffectAdjust [0.25,0,true];
    "chromAberration" ppEffectEnable true;
    "chromAberration" ppEffectCommit 0.5;
    sleep 0.2;
    "chromAberration" ppEffectAdjust [-0.15,0,true];
    "chromAberration" ppEffectCommit 0.35;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [-0.05,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [0,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.25;
    "chromAberration" ppEffectEnable false;

    sleep 10;

    ExileClientPlayerIsInCombat = true;
    ExileClientPlayerLastCombatAt = diag_tickTime;
    true call ExileClient_gui_hud_toggleCombatIcon;

    playSound "ns_fx_drone1";
    "chromAberration" ppEffectAdjust [0.25,0,true];
    "chromAberration" ppEffectEnable true;
    "chromAberration" ppEffectCommit 0.5;
    sleep 0.2;
    "chromAberration" ppEffectAdjust [-0.15,0,true];
    "chromAberration" ppEffectCommit 0.35;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [-0.05,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [0,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.25;
    "chromAberration" ppEffectEnable false;

    //-------------------------------------------------
    sleep 47;

    ExileClientPlayerIsInCombat = true;
    ExileClientPlayerLastCombatAt = diag_tickTime;
    true call ExileClient_gui_hud_toggleCombatIcon;

    sleep 30;
    //-------------------------------------------------
    ExileClientPlayerIsInCombat = true;
    ExileClientPlayerLastCombatAt = diag_tickTime;
    true call ExileClient_gui_hud_toggleCombatIcon;

    playSound "ns_fx_drone2";
    "chromAberration" ppEffectAdjust [0.25,0,true];
    "chromAberration" ppEffectEnable true;
    "chromAberration" ppEffectCommit 0.5;
    sleep 0.2;
    "chromAberration" ppEffectAdjust [-0.15,0,true];
    "chromAberration" ppEffectCommit 0.35;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [-0.05,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [0,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.25;
    "chromAberration" ppEffectEnable false;

    sleep 10;

    ExileClientPlayerIsInCombat = true;
    ExileClientPlayerLastCombatAt = diag_tickTime;
    true call ExileClient_gui_hud_toggleCombatIcon;

    systemChat "I should get to cover....";

    playSound "ns_fx_drone1";
    "chromAberration" ppEffectAdjust [0.25,0,true];
    "chromAberration" ppEffectEnable true;
    "chromAberration" ppEffectCommit 0.5;
    sleep 0.2;
    "chromAberration" ppEffectAdjust [-0.15,0,true];
    "chromAberration" ppEffectCommit 0.35;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [-0.05,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [0,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.25;
    "chromAberration" ppEffectEnable false;

    //-------------------------------------------------
    sleep 30;
    ExileClientPlayerIsInCombat = true;
    ExileClientPlayerLastCombatAt = diag_tickTime;
    true call ExileClient_gui_hud_toggleCombatIcon;
    sleep 20;
    //-------------------------------------------------

    ExileClientPlayerIsInCombat = true;
    ExileClientPlayerLastCombatAt = diag_tickTime;
    true call ExileClient_gui_hud_toggleCombatIcon;

    playSound "ns_fx_drone2";
    "chromAberration" ppEffectAdjust [0.25,0,true];
    "chromAberration" ppEffectEnable true;
    "chromAberration" ppEffectCommit 0.5;
    sleep 0.2;
    "chromAberration" ppEffectAdjust [-0.15,0,true];
    "chromAberration" ppEffectCommit 0.35;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [-0.05,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [0,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.25;
    "chromAberration" ppEffectEnable false;

    sleep 7;
    ExileClientPlayerIsInCombat = true;
    ExileClientPlayerLastCombatAt = diag_tickTime;
    true call ExileClient_gui_hud_toggleCombatIcon;

    playSound "ns_fx_drone1";
    "chromAberration" ppEffectAdjust [0.25,0,true];
    "chromAberration" ppEffectEnable true;
    "chromAberration" ppEffectCommit 0.5;
    sleep 0.2;
    "chromAberration" ppEffectAdjust [-0.15,0,true];
    "chromAberration" ppEffectCommit 0.35;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [-0.05,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [0,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.25;
    "chromAberration" ppEffectEnable false;

    //-------------------------------------------------
    sleep 33;
    //-------------------------------------------------
    ExileClientPlayerIsInCombat = true;
    ExileClientPlayerLastCombatAt = diag_tickTime;
    true call ExileClient_gui_hud_toggleCombatIcon;

    playSound "ns_fx_drone2";
    "chromAberration" ppEffectAdjust [0.25,0,true];
    "chromAberration" ppEffectEnable true;
    "chromAberration" ppEffectCommit 0.5;
    sleep 0.2;
    "chromAberration" ppEffectAdjust [-0.15,0,true];
    "chromAberration" ppEffectCommit 0.35;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [-0.05,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [0,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.25;
    "chromAberration" ppEffectEnable false;

    sleep 5;

    playSound "ns_fx_drone1";
    "chromAberration" ppEffectAdjust [0.25,0,true];
    "chromAberration" ppEffectEnable true;
    "chromAberration" ppEffectCommit 0.5;
    sleep 0.2;
    "chromAberration" ppEffectAdjust [-0.15,0,true];
    "chromAberration" ppEffectCommit 0.35;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [-0.05,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [0,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.25;
    "chromAberration" ppEffectEnable false;

    //-------------------------------------------------
    sleep 25;
    //-------------------------------------------------
    ExileClientPlayerIsInCombat = true;
    ExileClientPlayerLastCombatAt = diag_tickTime;
    true call ExileClient_gui_hud_toggleCombatIcon;

    playSound "ns_fx_misc4";
    playSound "ns_fx_drone2";
    "chromAberration" ppEffectAdjust [0.25,0,true];
    "chromAberration" ppEffectEnable true;
    "chromAberration" ppEffectCommit 0.5;
    sleep 0.2;
    "chromAberration" ppEffectAdjust [-0.15,0,true];
    "chromAberration" ppEffectCommit 0.35;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [-0.05,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [0,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.25;
    "chromAberration" ppEffectEnable false;

    sleep 3;

    playSound "ns_fx_drone1";
    "chromAberration" ppEffectAdjust [0.25,0,true];
    "chromAberration" ppEffectEnable true;
    "chromAberration" ppEffectCommit 0.5;
    sleep 0.2;
    "chromAberration" ppEffectAdjust [-0.15,0,true];
    "chromAberration" ppEffectCommit 0.35;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [-0.05,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.1;
    "chromAberration" ppEffectAdjust [0,0,true];
    "chromAberration" ppEffectCommit 0.20;
    sleep 0.25;
    "chromAberration" ppEffectEnable false;
};

while {true} do
{
     private ["_isinbuilding","_resistance","_newResistanceLevel"];
    if (isNil("ns_blowout_exile")) then { ns_blowout_exile = false; };
    if (isNil("ns_blow_prep")) then { ns_blow_prep = false; };
    waitUntil{ns_blow_prep};

    systemChat "I should get to cover....";

    ExileClientPlayerIsInCombat = true;
    ExileClientPlayerLastCombatAt = diag_tickTime;
    true call ExileClient_gui_hud_toggleCombatIcon;

    diag_log format["[NAC BLOWOUT CLIENT] :: ns_blow_prep = %1 Blowout is preparing, take a cover!", ns_blow_prep];

    if ([player] call fnc_hasAPSI) then
    {
        _bul = [] spawn bl_detection;
    };

    _bul = [] spawn bl_preparations;
    if (isNil("ns_blow_status")) then { ns_blow_status = false; };
    waitUntil{ns_blow_status};

    diag_log format["[NAC BLOWOUT CLIENT] :: ns_blow_status = %1 Blowout confirmation received.", ns_blow_status];

    ExileClientPlayerIsInCombat = true;
    ExileClientPlayerLastCombatAt = diag_tickTime;
    true call ExileClient_gui_hud_toggleCombatIcon;

   if (isNil("ns_blow_action")) then { ns_blow_action = false; };
   waitUntil{ns_blow_action};

   diag_log format["[NAC BLOWOUT CLIENT] :: ns_blow_action = %1 Blowout action received.", ns_blow_status];

   playSound "bl_begin";
   "dynamicBlur" ppEffectAdjust [8];
   "dynamicBlur" ppEffectEnable true;
   "dynamicBlur" ppEffectCommit 0;
   "dynamicBlur" ppEffectAdjust [0.1];
   "dynamicBlur" ppEffectCommit 0.75;
   "chromAberration" ppEffectAdjust [0.25,0,true];
   "chromAberration" ppEffectEnable true;
   "chromAberration" ppEffectCommit 0.5;
   sleep 0.5;
   "chromAberration" ppEffectAdjust [-0.15,0,true];
   "chromAberration" ppEffectCommit 0.35;
   sleep 0.5;
   "chromAberration" ppEffectAdjust [-0.05,0,true];
   "chromAberration" ppEffectCommit 0.20;
   sleep 0.20;
   "chromAberration" ppEffectAdjust [0,0,true];
   "chromAberration" ppEffectCommit 0.20;
   sleep 1;
   "chromAberration" ppEffectEnable false;
   "dynamicBlur" ppEffectAdjust [3];
   "dynamicBlur" ppEffectCommit 2.75;
   sleep 5;

    _bul = [] call bl_flash;
    _s = round (random 3);
    switch (_s) do
    {
        case 0: {playSound "bl_hit1";};
        case 1: {playSound "bl_hit2";};
        case 2: {playSound "bl_hit3";};
        case 3: {playSound "bl_hit1";};
    };
    "dynamicBlur" ppEffectAdjust [3];
    "dynamicBlur" ppEffectCommit 5;
    sleep 1;
    _bul = [] call bl_flash;
    _s = round (random 3);
    switch (_s) do
    {
        case 0: {playSound "bl_hit1";};
        case 1: {playSound "bl_hit2";};
        case 2: {playSound "bl_hit3";};
        case 3: {playSound "bl_hit1";};
    };
    "dynamicBlur" ppEffectAdjust [2.4];
    "dynamicBlur" ppEffectCommit 6;
    sleep 4;
    _s = round (random 3);
    switch (_s) do
    {
        case 0: {playSound "bl_wave1";};
        case 1: {playSound "bl_wave2";};
        case 2: {playSound "bl_wave3";};
        case 3: {playSound "bl_wave1";};
    };
    sleep 0.3;
    _bul = [] call bl_flash;
    _s = round (random 3);
    switch (_s) do
    {
        case 0: {playSound "bl_hit1";};
        case 1: {playSound "bl_hit2";};
        case 2: {playSound "bl_hit3";};
        case 3: {playSound "bl_hit1";};
    };
    sleep 1;
    _s = round (random 3);
    switch (_s) do
    {
        case 0: {playSound "bl_wave1";};
        case 1: {playSound "bl_wave2";};
        case 2: {playSound "bl_wave3";};
        case 3: {playSound "bl_wave1";};
    };
    sleep 2;
    _bul = [] call bl_flash;
    _s = round (random 3);
    switch (_s) do
    {
        case 0: {playSound "bl_hit1";};
        case 1: {playSound "bl_hit2";};
        case 2: {playSound "bl_hit3";};
        case 3: {playSound "bl_hit1";};
    };
    _nonapsi_ef = ppEffectCreate ["colorCorrections", 1555];
    _nonapsi_ef ppEffectEnable true;
    _nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.1, [1.0, 0.2, 0.2, 0.0], [1.0, 0.4, 0.0, 0.1],[1.0,0.3,0.3, 0.5]];
    _nonapsi_ef ppEffectCommit 2;
    sleep 1;
    _bul = [] call bl_flash;
    _s = round (random 3);
    switch (_s) do
    {
        case 0: {playSound "bl_wave1";};
        case 1: {playSound "bl_wave2";};
        case 2: {playSound "bl_wave3";};
        case 3: {playSound "bl_wave1";};
    };
    _bul = [] call bl_flash;

    if (!([player] call fnc_hasAPSI)) then {
        playSound "bl_psi";
    };

    sleep 4;
    _bul = [] call bl_flash;
    _s = round (random 3);
    switch (_s) do
    {
        case 0: {playSound "bl_wave1";};
        case 1: {playSound "bl_wave2";};
        case 2: {playSound "bl_wave3";};
        case 3: {playSound "bl_wave1";};
    };
    _nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.1, [1.0, 0.1, 0.1, 0.0], [1.0, 0.1, 0.0, 0.1],[1.0,0.1,0.0, 0.5]];
    _nonapsi_ef ppEffectCommit 6;
    sleep 1;
    _s = round (random 3);
    switch (_s) do
    {
        case 0: {playSound "bl_hit1";};
        case 1: {playSound "bl_hit2";};
        case 2: {playSound "bl_hit3";};
        case 3: {playSound "bl_hit1";};
    };
    sleep 3;
    _bul = [] call bl_flash;
    _s = round (random 3);
    switch (_s) do
    {
        case 0: {playSound "bl_wave1";};
        case 1: {playSound "bl_wave2";};
        case 2: {playSound "bl_wave3";};
        case 3: {playSound "bl_wave1";};
    };

    _nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.1, [0.0, 0.0, 0.0, 0.0], [0.0, 0.0, 0.0, 5.0],[0.4,0.0,0.0, 0.7]];
    _nonapsi_ef ppEffectCommit 1;

    _bul = [] call bl_local_anims;
    sleep 0.1;
    playSound "bl_full";
    sleep 0.1;
    titleText["","BLACK OUT",1];
    disableUserInput true;

    if (ns_blowout_exile) then
    {
        _isinbuilding = false;
        _startPosition = getPosASL player;
        _endPosition = [_startPosition select 0, _startPosition select 1, (_startPosition select 2 ) + 10];
        _intersections = lineIntersectsSurfaces [_startPosition, _endPosition, player, objNull, false, 1, "GEOM", "VIEW"];
        _isBelowRoof = !(_intersections isEqualTo []);
        _newResistanceLevel = 0;

        if (_isBelowRoof) then
        {
            _isinbuilding = true;
        };    

        _resistance = profileNamespace getVariable ["ExileReborn_resistanceToEVR",0];

        if (!_isinbuilding) then
        {
            _randAmount = random 0.2;

            _newResistanceLevel = (_resistance + 0.01);
            player setDamage (damage player + ns_blow_damage_unprotected + _randAmount) - _resistance;
            profileNamespace setVariable ["ExileReborn_resistanceToEVR",_newResistanceLevel];
            saveProfileNamespace;
        }
        else
        {

            _newResistanceLevel = (_resistance + 0.01);
            player setDamage (damage player + ns_blow_damage_inbuilding) - _resistance;
            profileNamespace setVariable ["ExileReborn_resistanceToEVR",_newResistanceLevel];
            saveProfileNamespace;
        };

        _playerVehicle = vehicle player;
        if !(_playerVehicle isEqualTo player) then
        {
            if (isEngineOn _playerVehicle) then
            {
                _playerVehicle engineOn false;
            };    
        };    
    };
    
    sleep 1;
    4 fadeSound 0;
    sleep 5;
    if ([player] call fnc_hasAPSI) then {disableUserInput false;};
    sleep 6;
    6 fadeSound 1;
    titleText["","BLACK IN",10];
    ppEffectDestroy _nonapsi_ef;
    waitUntil {!ns_blow_action};
    diag_log format["[NAC BLOWOUT CLIENT] :: ns_blow_action = %1 Blowout actions end received.", ns_blow_action];

    if ([player] call fnc_hasAPSI) then{
        cutRsc ["RscAPSI_h6","PLAIN"];
        playSound "apsi_off";
        "filmGrain" ppEffectEnable false;
    };

    "dynamicBlur" ppEffectAdjust [0];
    "dynamicBlur" ppEffectCommit 16;

    waitUntil {!ns_blow_status};
    disableUserInput false;
    diag_log format["[NAC BLOWOUT CLIENT] :: ns_blow_status = %1 Blowout end received.", ns_blow_status];
    _bul = [] call bl_local_def_anim;
    sleep 10;
    ["InfoTitleAndText",
        [
            "Resistance gained",
            format ["Surviving the EVR has increased your resistance to the storms - You will resist %1%2 damage - If you die you will loose your resistance",_newResistanceLevel * 100,"%"]
        ]
    ] call ExileClient_gui_toaster_addTemplateToast;
};