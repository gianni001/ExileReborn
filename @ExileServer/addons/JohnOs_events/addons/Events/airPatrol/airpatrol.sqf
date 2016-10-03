/** DYNAMIC AIR PATROL EVENT by JohnO **/

"[EVENT: AirPatrol] Ambient air patrol initalized" call ExileServer_util_log;

if (!isServer) exitWith{};

private ["_debugLocation","_startPos","_possiblePosStart","_fixedStart","_fixedStartLoc","_markerWaypointOne","_markerWaypointTwo","_markerWaypointThree","_markerWayPointFour","_wayPointOne","_wayPointTwo","_wayPointThree","_wayPointFour","_mk","_pos","_interceptor","_interceptorAircraft","_marker","_crashSuccess","_randomChanceForEvent"];


/************************************************************************************************/
/** Random location settings ********************************************************************/
/************************************************************************************************/

_spawnCenter = Event_world_centerPosition; //Center of your map -- this is Altis 
_min = Event_AirPatrol_Min; // minimum distance from the center position (Number) in meters
_max = Event_AirPatrol_MaxDist; // maximum distance from the center position (Number) in meters
_mindist = Event_AirPatrol_MinDist; // minimum distance from the nearest object (Number) in meters, ie. create waypoint this distance away from anything within x meters..
_water = Event_AirPatrol_WaterMode; // water mode 0: cannot be in water , 1: can either be in water or not , 2: must be in water
_shoremode = Event_AirPatrol_ShoreMode; // 0: does not have to be at a shore , 1: must be at a shore

/************************************************************************************************/
/** DEBUG MARKER ********************************************************************************/
/************************************************************************************************/

_debug = Event_AirPatrol_EnableDebug; // Will create a marker that will follow the trader.

/************************************************************************************************/
/** If using fixed locations or waypoints *******************************************************/
/************************************************************************************************/

_fixedStart = false; //If true trader will spawn at fixed location
_fixedStartLoc = getMarkerPos "yourmarker"; //If _fixedStart is true, create a marker and put the marker name here
_crashSuccess = false;

_useMarkerWaypoints = false; //If true, will use set markers instead of random positions - If true populate "yourmarker" with the marker names created

_markerWaypointOne = getMarkerPos "waypoint1"; //Create a marker and name it waypoint1
_markerWaypointTwo = getMarkerPos "waypoint2"; //Create a marker and name it waypoint2
_markerWaypointThree = getMarkerPos "waypoint3"; //Create a marker and name it waypoint3
_markerWayPointFour = getMarkerPos "waypoint4"; //Create a marker and name it waypoint4

/************************************************************************************************/

if (_useMarkerWaypoints) then
{
        _wayPointOne = getPos _markerWaypointOne;
        _wayPointTwo = getPos _markerWaypointTwo;
        _wayPointThree = getPos _markerWaypointThree;
        _wayPointFour = getPos _markerWayPointFour;
    }
    else
    {
    _wayPointOne = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos; 
    _wayPointTwo = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;
    _wayPointThree = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;
    _wayPointFour = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;
};

if (_fixedStart) then
{
        _possiblePosStart = getPos _fixedStartLoc;
    }
    else
    {
        _possiblePosStart = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;
};

// LOOT

_amountOfWeapons = 1+floor(random Event_AirPatrol_MaxAmountOfWeapons);
_amountOfItems = 3+floor(random Event_AirPatrol_MaxAmountOfItems);

// Starting position for the interceptor and rescue chopper.

_rescueStartPos = [[0,0,0]];

if !(_debug) then
{    
    _startPos = _rescueStartPos call BIS_fnc_selectRandom;
}
else
{
    _startPos = getPos player;
};    

_lootWeapons =
[
"arifle_MXM_Black_F",
"arifle_MXM_F",
"srifle_DMR_01_F",
"srifle_DMR_02_camo_F",
"srifle_DMR_02_F",
"srifle_DMR_02_sniper_F",
"srifle_DMR_03_F",
"srifle_DMR_03_khaki_F",
"srifle_DMR_03_multicam_F",
"srifle_DMR_03_tan_F",
"srifle_DMR_03_woodland_F",
"srifle_DMR_04_F",
"srifle_DMR_04_Tan_F",
"srifle_DMR_05_blk_F",
"srifle_DMR_05_hex_F",
"srifle_DMR_05_tan_f",
"srifle_DMR_06_camo_F",
"srifle_DMR_06_olive_F",
"srifle_EBR_F",
"srifle_GM6_camo_F",
"srifle_GM6_F",
"srifle_LRR_camo_F",
"srifle_LRR_F",

"arifle_MX_SW_Black_F",
"arifle_MX_SW_F",
"LMG_Mk200_F",
"MMG_01_hex_F",
"MMG_01_tan_F",
"MMG_02_camo_F",
"MMG_02_black_F",
"MMG_02_sand_F",
"LMG_Zafir_F",

"arifle_Katiba_C_F",
"arifle_Katiba_F",
"arifle_Katiba_GL_F",
"arifle_Mk20_F",
"arifle_Mk20_GL_F",
"arifle_Mk20_GL_plain_F",
"arifle_Mk20_plain_F",
"arifle_Mk20C_F",
"arifle_Mk20C_plain_F",
"arifle_MX_Black_F",
"arifle_MX_F",
"arifle_MX_GL_Black_F",
"arifle_MX_GL_F",
"arifle_MXC_Black_F",
"arifle_MXC_F",
"arifle_SDAR_F",
"arifle_TRG20_F",
"arifle_TRG21_F",
"arifle_TRG21_GL_F"
];

_lootItems =
[
"HandGrenade",
"MiniGrenade",
"B_IR_Grenade",
"O_IR_Grenade",
"I_IR_Grenade",
"1Rnd_HE_Grenade_shell",
"3Rnd_HE_Grenade_shell",
"APERSBoundingMine_Range_Mag",
"APERSMine_Range_Mag",
"APERSTripMine_Wire_Mag",
"ClaymoreDirectionalMine_Remote_Mag",
"DemoCharge_Remote_Mag",
"IEDLandBig_Remote_Mag",
"IEDLandSmall_Remote_Mag",
"IEDUrbanBig_Remote_Mag",
"IEDUrbanSmall_Remote_Mag",
"SatchelCharge_Remote_Mag",
"SLAMDirectionalMine_Wire_Mag",

"B_AssaultPack_blk",
"B_AssaultPack_cbr",
"B_AssaultPack_dgtl",
"B_AssaultPack_khk",
"B_AssaultPack_mcamo",
"B_AssaultPack_rgr",
"B_AssaultPack_sgg",
"B_FieldPack_blk",
"B_FieldPack_cbr",
"B_FieldPack_ocamo",
"B_FieldPack_oucamo",
"B_TacticalPack_blk",
"B_TacticalPack_rgr",
"B_TacticalPack_ocamo",
"B_TacticalPack_mcamo",
"B_TacticalPack_oli",
"B_Kitbag_cbr",
"B_Kitbag_mcamo",
"B_Kitbag_sgg",
"B_Carryall_cbr",
"B_Carryall_khk",
"B_Carryall_mcamo",
"B_Carryall_ocamo",
"B_Carryall_oli",
"B_Carryall_oucamo",
"B_Bergen_blk",
"B_Bergen_mcamo",
"B_Bergen_rgr",
"B_Bergen_sgg",
"B_HuntingBackpack",
"B_OutdoorPack_blk",
"B_OutdoorPack_blu",

"Rangefinder",
"NVGoggles",
"NVGoggles_INDEP",
"NVGoggles_OPFOR",

"Exile_Item_InstaDoc",
"Exile_Item_Vishpirin",
"Exile_Item_Bandage"
];



// Randomize the start time of the script

if (_debug) then
{

}
else
{
    _delay = Event_AirPatrol_MinScriptDelay + (floor Event_AirPatrol_MaxScriptDelay);
    uiSleep _delay;
};

if (_debug) then
{
    _randomChanceForEvent = random 100;
}
else
{    
    _randomChanceForEvent = random 1;
};    

if (_randomChanceForEvent > Event_AirPatrol_ChanceForEvent) then
{    

    Event_AirPatrol_monitorCount = Event_AirPatrol_monitorCount + 1;
    
    _side = createCenter EAST;
    _airCraft = [_startPos, EAST, [Event_AirPatrol_PatrolAirCraft],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
    _airCraftSelection = nearestObjects [_startPos, ["air"], 100];

    _airCraftLead = _airCraftSelection select 0;

    _titlePatrol = "WARNING";
    _messagePatrol = "A NATO A10 Strike aircraft has been seen patrolling the Island";

    
    //["systemChatRequest", [format ["%1: %2",_titlePatrol,_messagePatrol]]] call ExileServer_system_network_send_broadcast;
    //["toastRequest", ["InfoTitleAndText", ["WARNING", "A NATO A10 Strike aircraft has been seen patrolling the Island"]]] call ExileServer_system_network_send_broadcast;
    

    if (_debug) then
    {
        [_airCraftLead] spawn
        {
            _planes = _this select 0;
            _pos = position _planes;
            _mk = createMarker ["AirCraftLocation",_pos];
            while {true} do
            {
                _pos = position _planes;
                "AirCraftLocation" setMarkerType "mil_warning";
                "AirCraftLocation" setMarkerText "Planes";
                _mk setMarkerPos _pos;
                uiSleep 1;
            };  
        };  
    };

    "[EVENT: AirPatrol] Ambient air patrol event started" call ExileServer_util_log;

    _airCraft setCombatMode "BLUE";

    {
        _x disableAI "AUTOTARGET";
        _x disableAI "TARGET";
        _x disableAI "SUPPRESSION";
        
    } forEach units _airCraft;

    _wp1 = _airCraft addWaypoint [_wayPointOne, 0];
    _wp1 setWaypointType "MOVE";
    _wp1 setWaypointBehaviour "CARELESS";
    _wp1 setWaypointspeed "NORMAL";
     
    _wp2 = _airCraft addWaypoint [_wayPointTwo, 0];
    _wp2 setWaypointType "MOVE";
    _wp2 setWaypointBehaviour "CARELESS";
    _wp2 setWaypointspeed "NORMAL";
      
    _wp3 = _airCraft addWaypoint [_wayPointThree, 0];
    _wp3 setWaypointType "MOVE";
    _wp3 setWaypointBehaviour "CARELESS";
    _wp3 setWaypointspeed "NORMAL";
     
    _wp4 = _airCraft addWaypoint [_wayPointFour, 0];
    _wp4 setWaypointType "MOVE";
    _wp4 setWaypointBehaviour "CARELESS";
    _wp4 setWaypointspeed "NORMAL";
     
    _wp5 = _airCraft addWaypoint [_wayPointOne, 0];
    _wp5 setWaypointType "CYCLE";
    _wp5 setWaypointBehaviour "CARELESS";
    _wp5 setWaypointspeed "NORMAL";

    if (_debug) then
    {
        uiSleep 10;
    }
    else
    {    

        uiSleep 600;
    };
    _chanceForIntercept = random 1;

    if (_chanceForIntercept >= 0) then {intercept = true;} else {intercept = false;};

    if (intercept) then
    {
        "[EVENT: AirPatrol] Interceptor aircraft has been despatched" call ExileServer_util_log;

        //["toastRequest", ["InfoTitleAndText", ["WARNING", "The MAFIA has scrambled a jet to take down the fighter"]]] call ExileServer_system_network_send_broadcast;

        _interceptor = createGroup resistance;
        
        _interceptorStartPos = _rescueStartPos call BIS_fnc_selectRandom;
        
        [_interceptorStartPos, 180,Event_AirPatrol_InterceptorAirCraft, _interceptor] call BIS_fnc_spawnVehicle;
        _interceptorSelection = nearestObjects [_interceptorStartPos, ["air"], 100];

        _interceptorAircraft = _interceptorSelection select 0;
        _interceptorAircraft setFuel 0.2;
        
        _interceptor setCombatMode "RED";
        
        _waypoints = [_WayPointFour,_wayPointThree,_wayPointTwo,_wayPointOne];
        {
        _intWP = _interceptor addWaypoint [_x, 0];
        _intWP setWaypointType "MOVE";
        _intWP setWaypointBehaviour "SAFE";
        _intWP setWaypointspeed "FULL";
        } forEach _waypoints;

        if (_debug) then
        {    
            [_interceptorAircraft] spawn
            {
                _plane2 = _this select 0;
                _pos2 = position _plane2;
                _mk1 = createMarker ["Y",_pos2];
                while {true} do
                {    
                    _pos2 = position _plane2;
                    "Y" setMarkerType "mil_warning";
                    "Y" setMarkerText "Inter";
                    _mk1 setMarkerPos _pos2;
                };
            };  
        };

        if (_debug) then 
        {
            uiSleep 10;
        }    
        else
        {   
            uiSleep Event_AirPatrol_InterceptorDuration; // Give the interceptor 5 minutes to down the enemy Jet
        };    

        if (alive _airCraftLead) then
        {   
            _airCraftLead setDamage 1;
        };    
    }
    else
    {
        if (_debug) then
        {
            uiSleep 120;
            _airCraftLead setDamage 1;
        }
        else
        {    
            uiSleep Event_AirPatrol_Duration;
            _airCraftLead setDamage 1;
        };    
    };

    waituntil {(getPos _airCraftLead select 2) < 5};
    sleep 10;
    _isWater = surfaceIsWater position _airCraftLead;
    _debugLocation = [6550.84,6270.12,0];

    _safeDistance = (position _airCraftLead) distance _debugLocation;

    if (!(_isWater) && (_safeDistance > 1000)) then
    { 
        "[EVENT: AirPatrol] Crash sequence initiated" call ExileServer_util_log;

        //["toastRequest", ["InfoTitleAndText", ["WARNING", "An aircraft has been seen going down, A quick reaction force has been despatched to secure the crash site"]]] call ExileServer_system_network_send_broadcast;

        _landPos = position _airCraftLead;

        _helipad = "Land_HelipadEmpty_F" createVehicle _landPos;
        sleep 1;
        deleteVehicle _airCraftLead;

        _crash = createVehicle ["Plane_Fighter_03_wreck_F",_landPos,[], 0, "can_collide"];
        _crash setPos [position _crash select 0,position _crash select 1, 0.1];
        _crash setVectorUp surfaceNormal position _crash;
        //_smoke = createVehicle ["test_EmptyObjectForFireBig",position _crash,[], 0, "can_collide"];
        //_smoke attachTo [_crash, [0.5, -2, 1] ];
        /*
        _marker = createMarker [ format["AirPatrol%1", diag_tickTime], _landPos];
        _marker setMarkerType Event_AirPatrol_MarkerType;
        _marker setMarkerText Event_AirPatrol_MarkerText;
        */

        Event_HeliCrash_Positions pushBack [position _crash, time + 99999999];

        _crashSuccess = true;

        if (intercept) then
        {

            while {(count (waypoints _interceptor)) > 0} do
            {
                deleteWaypoint ((waypoints _interceptor) select 0);
            };

            "[EVENT: AirPatrol] Remaining offensive waypoints for interceptor deleted" call ExileServer_util_log;

            _interceptorExitPos = _rescueStartPos call BIS_fnc_selectRandom;
            
            _intExitWP = _interceptor addWaypoint [_interceptorExitPos, 0];
            _intExitWP setWaypointType "MOVE";
            _intExitWP setWaypointBehaviour "CARELESS";
            _intExitWP setWaypointspeed "NORMAL";
            
            _interceptor setCombatMode "BLUE";
            
            {
            _x disableAI "AUTOTARGET";
            _x disableAI "TARGET";
            _x disableAI "SUPPRESSION";
            
            } forEach units _interceptor;
            
            "[EVENT: AirPatrol] Interceptor retreat order given" call ExileServer_util_log;
        };
            
        _rescueCrew = createGroup EAST;
        
        _chopper = createvehicle [Event_AirPatrol_RescueChopper,_startPos,[],0,"FLY"];
        _chopper setVariable ["ExileIsPersistent", false];

        _driver = _rescueCrew createUnit ["O_helipilot_F",_startPos,[],0,"NONE"];
        _driver moveInDriver _chopper;

        if (_debug) then
        {    
            [_chopper] spawn
            {
                _chopper1 = _this select 0;
                _pos3 = position _chopper1;
                _mk2 = createMarker ["E",_pos3];
                while {true} do
                {    
                    _pos3 = position _chopper1;
                    "E" setMarkerType "mil_warning";
                    "E" setMarkerText "rescue";
                    _mk2 setMarkerPos _pos3;
                };
            };  
        };

        "[EVENT: AirPatrol] Rescue QRF Helo despatched" call ExileServer_util_log;

        _rescueCrew setCombatMode "BLUE";
      
        _altWP = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;

        if !(_debug) then
        {    
            _rescueAltWP1 = _rescueCrew addWaypoint [_altWP, 0];
            _rescueAltWP1 setWaypointType "MOVE";
            _rescueAltWP1 setWaypointBehaviour "CARELESS";
            _rescueAltWP1 setWaypointspeed "NORMAL";
        };    

        _rescueAltWP2 = _rescueCrew addWaypoint [_landPos, 0];
        _rescueAltWP2 setWaypointType "GETOUT";
        _rescueAltWP2 setWaypointBehaviour "CARELESS";
        _rescueAltWP2 setWaypointspeed "NORMAL";      

        // Add weapons to the chopper

        clearMagazineCargoGlobal _chopper; 
        clearWeaponCargoGlobal _chopper; 
        clearItemCargoGlobal _chopper;
        clearBackpackCargoGlobal _chopper;

        for "_i" from 1 to _amountOfWeapons do
        {
            /*
            _weapon = _lootWeapons call BIS_fnc_selectRandom;
            _chopper addWeaponCargoGlobal [_weapon,1];
            
            _magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
            _chopper addMagazineCargoGlobal [(_magazines select 0),round random 8];
            */

            _item = [2] call JohnO_fnc_getRandomItems_new;
                
            [_chopper, _item] call ExileClient_util_containerCargo_add;

            _magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines"); 
            _chopper addMagazineCargoGlobal [(_magazines select 0), 1 + floor (random 3)];
        };

        for "_i" from 1 to _amountOfItems do
        {
            /*
            _items = _lootItems call BIS_fnc_selectRandom;
            _chopper addMagazineCargoGlobal [_items,1];
            */

            _item = [3] call JohnO_fnc_getRandomItems_new;
            [_chopper, _item] call ExileClient_util_containerCargo_add;        

            _item = [4] call JohnO_fnc_getRandomItems_new;
            [_chopper, _item] call ExileClient_util_containerCargo_add;    
        };

        waituntil {(getPos _chopper select 2) < 1};

        _chopper setFuel 0.1;

       "[EVENT: AirPatrol] Rescue QRF Helo reached destination" call ExileServer_util_log;

        _rescueCrew setCombatMode "RED";
        _rescueCrew allowFleeing 0;
        //_rescueWP2 = _rescueCrew addWaypoint [_landPos, 0];
        //_rescueWP2 setWaypointType "GETOUT";
        //_rescueWP2 setWaypointBehaviour "CARELESS";
        //_rescueWP2 setWaypointspeed "NORMAL";

        [_rescueCrew, _crash, 50] call bis_fnc_taskPatrol;

        _aiUnits = ["O_recon_medic_F", "O_Soldier_lite_F","O_Soldier_GL_F","O_Soldier_A_F","O_Soldier_lite_F"];

        _HeliAiUnits = [position _crash, EAST, _aiUnits,[],[],[],[],[],180] call BIS_fnc_spawnGroup;
        //Add waypoint for the AI
        _HeliCrashGroupLeader = leader _HeliAiUnits;
        _HeliCrashUnitsGroup = group _HeliCrashGroupLeader;

        {
            removeBackpackGlobal _x;
            removeAllWeapons _x;
            removeAllAssignedItems _x;
            _curWeapon = _lootWeapons call BIS_fnc_selectRandom;
            [_x,_curWeapon, 5] call BIS_fnc_addWeapon;
        } forEach units _HeliAiUnits;

        _HeliAIUnits allowFleeing 0;
        /*
        _HeliCrashUnitsGroup addWaypoint [position _crash, 0];
        [_HeliCrashUnitsGroup, 0] setWaypointType "GUARD";
        [_HeliCrashUnitsGroup, 0] setWaypointBehaviour "AWARE";
        */
        [_HeliCrashUnitsGroup,position _crash,50] call bis_fnc_taskPatrol;

        {
            _x setVariable ["JohnO_AIisSimulated",true];
            Event_ALLAI_SimulatedUnits pushBack _x;
        } forEach units _HeliAiUnits;

        {
            _x addMPEventHandler 
            ["MPKilled",
                {

                    private ["_killer","_currentRespect","_amountEarned","_newRespect","_killSummary"];

                    _killed = _this select 0;
                    _killer = _this select 1;

                    //[_killed] joinSilent Event_RadAI_deadGroup;

                    _killingPlayer = _killer call ExileServer_util_getFragKiller;

                    Event_ALLAI_SimulatedUnits = Event_ALLAI_SimulatedUnits - [_killed];

                    _currentRespect = _killingPlayer getVariable ["ExileScore", 0];
                    _amountEarned = 150;
                    _newRespect = _currentRespect + 150;

                    _killingPlayer setVariable ["ExileScore", _newRespect];
                    _killSummary = [];
                    _killSummary pushBack ["BANDIT FRAGGED", _amountEarned];
                    [_killingPlayer, "showFragRequest", [_killSummary]] call ExileServer_system_network_send_to;

                    format["setAccountScore:%1:%2", _newRespect, getPlayerUID _killingPlayer] call ExileServer_system_database_query_fireAndForget;
                    _killingPlayer call ExileServer_object_player_sendStatsUpdate;
                }
            ];
        } forEach units _HeliAiUnits;    
    }
    else
    {
       "[EVENT: AirPatrol] Aircraft crashed in water -- Terminating script" call ExileServer_util_log;
        
        if (intercept) then
        {

            while {(count (waypoints _interceptor)) > 0} do
            {
                deleteWaypoint ((waypoints _interceptor) select 0);
            };

            "[EVENT: AirPatrol] Remaining offensive interceptor waypoints deleted" call ExileServer_util_log;

            _interceptorExitPos = _rescueStartPos call BIS_fnc_selectRandom;
            
            _intExitWP = _interceptor addWaypoint [_interceptorExitPos, 0];
            _intExitWP setWaypointType "MOVE";
            _intExitWP setWaypointBehaviour "CARELESS";
            _intExitWP setWaypointspeed "NORMAL";
            
            _interceptor setCombatMode "BLUE";
            
            {
            _x disableAI "AUTOTARGET";
            _x disableAI "TARGET";
            _x disableAI "SUPPRESSION";
            
            } forEach units _interceptor;
            
           "[EVENT: AirPatrol] Interceptor aircraft dismiss order given" call ExileServer_util_log;
        };
    };

    uiSleep 1800;

    /*
    if (_crashSuccess) then
    {    
        deleteMarker _marker;
    };    
    */
    if (intercept) then
    {    
        {
            _airCraftLead deleteVehicleCrew _x
        } forEach crew _airCraftLead;
        
        _interceptorAircraft setDamage 1;
    };
}
else
{
    "[EVENT: AirPatrol] Script random chance failed -- Re trying event" call ExileServer_util_log;
    [] execVM "JohnOs_events\addons\Events\airPatrol\airPatrol.sqf";
};    
