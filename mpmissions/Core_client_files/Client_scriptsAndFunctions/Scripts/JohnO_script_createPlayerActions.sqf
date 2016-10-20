/*

    Sanity..
    Params for custom consume:

    ExileClientPlayerEffectNames = ["Health", "Stamina", "Hunger", "Thirst", "Blood Alcohol", "Temperature", "Wetness"];

    [[[2,50,200]],"Consumed animal meat",1,false] call JohnO_fnc_customConsume;

    select 0 - array - [Attribute - hunger, thirst, temp etc, Amount to change, Duration]
    select 1 - string - Message to display
    select 2 - number - Eating or drinking for sound - 1 is eating 2 is drinking 0 is no sound
    select 2 - Boolean - True for poison false for not poison   
    
*/

private ["_pickUpAction","_consumeAction","_hasPickUpAction","_playerhasCookingAction","_animalID","_deadAnimalID"];

ExileReborn_hasPickUpAction = false;
ExileReborn_hasConsumeAction = false;
ExileReborn_hasCookingAction = false;
ExileReborn_hasdropAnimalAction = false;
ExileReborn_hasDryClothesAction = false;
ExileReborn_hasFillSandBagAction = false;
ExileReborn_hasscavengeAction = false;
ExileReborn_hasSearchBerriesAction = false;

ExileReborn_pickUpAction =
["Tie animal to belt",
{

    if ((player getVariable ["hasAnimal",-1]) isEqualTo -1) then
    {

        _animal = cursorObject;
        if (typeOf cursorObject isEqualTo "Rabbit_F") then
        {
            deleteVehicle cursorObject;

            _bugs = createAgent ["Rabbit_F", position player, [], 0, "FORM"];
            _bugs setDamage 1;
            _animal = _bugs;
        };

        _caller = _this select 0;
        _action = _this select 2;
        _caller removeAction _action;
        ExileReborn_hasPickUpAction = false;
        ExileReborn_hasPickupAction_Current = nil;
        player setVariable ["hasAnimal",_animal];
        _animal attachTo [player, [0, -1.5, 0] ];
        _animalID = netID _animal;
        ["hideObjectGlobal", [_animalID,true]] call ExileClient_system_network_send;
        _animal setVariable ["ExileReborn_garbageCollectionIgnore",1,true];
    }
    else
    {
        [
            "ErrorTitleAndText",
            ["Hunting info", "You are already carrying an animal"]
        ] call ExileClient_gui_toaster_addTemplateToast;
    };

},"",0,false,true,"","_target distance cursorObject < 2"];

ExileReborn_userActions pushBack 
[
    [
        ExileReborn_pickUpAction,
        "ExileReborn_hasPickUpAction",
        "ExileReborn_hasPickupAction_Current",
        "cursorObject isKindOf 'Animal' && !alive cursorObject && !ExileReborn_hasPickUpAction",
        false
    ]    
];

ExileReborn_consumeAction =
["Consume",
{

    private["_animal"];
    _caller = _this select 0;
    _action = _this select 2;
    _caller removeAction _action;

    ExileReborn_hasConsumeAction = false;
    ExileReborn_hasConsumeAction_Current = nil;
    _animal = cursorObject;

    _amountLeft = _animal getVariable ["AmountLeft",-1];
    _isCooked =  _animal getVariable ["animalIsCooked",-1];
    if (_isCooked isEqualTo 1) then
    {
        if !(_amountLeft <= 0) then
        {
            [[[2,50,200]],"Consumed animal meat",1,false] call JohnO_fnc_customConsume;
            _amountLeft = _amountLeft - 1;
            _animal setVariable ["AmountLeft",_amountLeft,true];
        }
        else
        {
            [
                "ErrorTitleAndText",
                ["Consume info", "There is no edible meat left on this animal"]
            ] call ExileClient_gui_toaster_addTemplateToast;
            //deleteVehicle _animal;
        };
    }
    else
    {
        [
            "ErrorTitleAndText",
            ["Consume info", "This animal is not cooked yet"]
        ] call ExileClient_gui_toaster_addTemplateToast;
    };
},"",0,false,true,"","_target distance cursorObject < 2"];

ExileReborn_userActions pushBack 
[
    [
        ExileReborn_consumeAction,
        "ExileReborn_hasConsumeAction",
        "ExileReborn_hasConsumeAction_Current",
        "cursorObject isKindOf 'Animal' && !alive cursorObject && !ExileReborn_hasConsumeAction",
        false
    ]    
];

ExileReborn_cookingAction =
["Start cooking",
{
    private ["_animal","_amountOfMeat"];
    _caller = _this select 0;
    _action = _this select 2;
    _caller removeAction _action;

    _animal = cursorObject;

    if ((_animal getVariable ["AmountLeft",-1]) isEqualTo -1) then
    {
        if ([(getPos _animal),3] call ExileClient_util_world_isFireInRange) then
        {
            _amountOfMeat = [_animal] call JohnO_fnc_getAnimalType;

            _animal setVariable ["AmountLeft",_amountOfMeat,true];

            [
                "InfoTitleAndText",
                ["Cooking info", "You have started cooking the animal, it will take 1 - 2 minutes to cook"]
            ] call ExileClient_gui_toaster_addTemplateToast;

            [_animal,_amountOfMeat] spawn
            {
                private ["_deadAnimal","_timer","_timeToCook","_caller","_action"];
                _deadAnimal = _this select 0;
                _amountOfMeat = _this select 1;

                _timeToCook = 1 + floor (random 60);
                _timer = 0;
                while {_timer < _timeToCook} do
                {
                    _timer = _timer + 1;

                    uiSleep 1;
                };
                _deadAnimal setVariable ["animalIsCooked",1,true];
                ExileReborn_hasCookingAction = false;
                ExileReborn_cookingAction_current = nil;
                ["InfoTitleAndText",
                    [
                        "Cooking info",
                        format ["The animal is cooked and has %1 meat on the carcass",_amountOfMeat]
                    ]
                ] call ExileClient_gui_toaster_addTemplateToast;
            };
        }
        else
        {
            ExileReborn_hasCookingAction = false;
            ExileReborn_cookingAction_current = nil;
            [
                "ErrorTitleAndText",
                ["Cooking info", "You need to place the animal closer to a fire"]
            ] call ExileClient_gui_toaster_addTemplateToast;
        };
    }
    else
    {
        ExileReborn_hasCookingAction = false;
        ExileReborn_cookingAction_current = nil;
        [
            "ErrorTitleAndText",
            ["Cooking info", "This animal is cooked already"]
        ] call ExileClient_gui_toaster_addTemplateToast;
    };
},"",0,false,true,"","_target distance cursorObject < 2"];

ExileReborn_userActions pushBack 
[
    [
        ExileReborn_cookingAction,
        "ExileReborn_hasCookingAction",
        "ExileReborn_cookingAction_current",
        "cursorObject isKindOf 'Animal' && !alive cursorObject && !ExileReborn_hasCookingAction",
        false
    ]    
];

ExileReborn_dropAnimalAction =
["Drop animal",
{
    private ["_hiddenObject","_deadAnimal"];
    _intersectingObjectArray = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0, 0, 0], AGLToASL positionCameraToWorld [0, 0, 1600], vehicle player, objNull, true, 1, "VIEW", "FIRE"];
    _position = ASLtoAGL ((_intersectingObjectArray select 0) select 0);

    _deadAnimal = player getVariable ['hasAnimal',-1];

    if !(_deadAnimal isEqualTo -1) then
    {
        detach _deadAnimal;
        _deadAnimalID = netID _deadAnimal;
        //_deadAnimal hideObjectGlobal false;
        ["hideObjectGlobal", [_deadAnimalID,false]] call ExileClient_system_network_send;
        if (_position distance player < 3) then
        {
            _deadAnimal setPos _position;
        }
        else
        {
            _deadAnimal setPos position player;
        };
        player setVariable ["hasAnimal",-1];

        _caller = _this select 0;
        _action = _this select 2;
        _caller removeAction _action;
        ExileReborn_hasdropAnimalAction = false;
        ExileReborn_dropAnimalAction_current = nil;
    };

},"",0,false,true,"",""];

ExileReborn_userActions pushBack 
[
    [
        ExileReborn_dropAnimalAction,
        "ExileReborn_hasdropAnimalAction",
        "ExileReborn_dropAnimalAction_current",
        "(!((player getVariable ['hasAnimal',-1]) isEqualTo -1) && !(ExileReborn_hasdropAnimalAction))",
        false
    ]    
];

// Dry clothes

ExileReborn_dryClothesAction =
["Wring out clothes",
{
    ExileReborn_hasDryClothesAction = true;

    _caller = _this select 0;
    _action = _this select 2;
    _caller removeAction _action;

    if (ExileClientActionDelayShown) exitWith { false };
    ExileClientActionDelayShown = true;
    ExileClientActionDelayAbort = false;

    _wetness = ExileClientPlayerAttributes select 6;

    disableSerialization;
    ("ExileActionProgressLayer" call BIS_fnc_rscLayer) cutRsc ["RscExileActionProgress", "PLAIN", 1, false];

    _keyDownHandle = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call ExileClient_action_event_onKeyDown"];
    _mouseButtonDownHandle = (findDisplay 46) displayAddEventHandler ["MouseButtonDown","_this call ExileClient_action_event_onMouseButtonDown"];

    _startTime = diag_tickTime;
    _duration = 35;
    _sleepDuration = _duration / 100;
    _progress = 0;

    _display = uiNamespace getVariable "RscExileActionProgress";
    _label = _display displayCtrl 4002;
    _label ctrlSetText "0%";
    _progressBarBackground = _display displayCtrl 4001;
    _progressBarMaxSize = ctrlPosition _progressBarBackground;
    _progressBar = _display displayCtrl 4000;
    _progressBar ctrlSetPosition [_progressBarMaxSize select 0, _progressBarMaxSize select 1, 0, _progressBarMaxSize select 3];
    _progressBar ctrlSetBackgroundColor [0, 0.78, 0.93, 1];
    _progressBar ctrlCommit 0;
    _progressBar ctrlSetPosition _progressBarMaxSize;
    _progressBar ctrlCommit _duration;
    try
    {
        while {_progress < 1} do
        {
            if (ExileClientActionDelayAbort) then
            {
                throw 1;
            };
            player playActionNow "Medic";
            uiSleep _sleepDuration;
            _progress = ((diag_tickTime - _startTime) / _duration) min 1;
            _label ctrlSetText format["%1%2", round (_progress * 100), "%"];
        };
        throw 0;
    }
    catch
    {
        _progressBarColor = [];
        switch (_exception) do
        {
            case 0:
            {
                _progressBarColor = [0.7, 0.93, 0, 1];
               ExileClientPlayerAttributes set [6, 0];
               [
                    "InfoTitleAndText",
                    ["Drying clothes", "You are now dry"]
                ] call ExileClient_gui_toaster_addTemplateToast;
            };
            case 1:
            {
                [
                    "InfoTitleAndText",
                    ["Drying clothes", "Do not move while drying clothes"]
                ] call ExileClient_gui_toaster_addTemplateToast;
                _progressBarColor = [0.82, 0.82, 0.82, 1];
            };
        };
        player switchMove "";
        ["switchMoveRequest", [netId player, ""]] call ExileClient_system_network_send;
        _progressBar ctrlSetBackgroundColor _progressBarColor;
        _progressBar ctrlSetPosition _progressBarMaxSize;
        _progressBar ctrlCommit 0;
    };

    ("ExileActionProgressLayer" call BIS_fnc_rscLayer) cutFadeOut 2;
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", _keyDownHandle];
    (findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _mouseButtonDownHandle];
    ExileClientActionDelayShown = false;
    ExileClientActionDelayAbort = false;
    ExileReborn_hasDryClothesAction = false;
    ExileReborn_dryClothesAction_current = nil;

},"",0,false,true,"",""];

ExileReborn_userActions pushBack 
[
    [
        ExileReborn_dryClothesAction,
        "ExileReborn_hasDryClothesAction",
        "ExileReborn_dryClothesAction_current",
        "((ExileClientPlayerAttributes select 6 > 0) && !(ExileReborn_hasDryClothesAction) && ((vehicle player) isEqualTo player))",
        false
    ]    
];

ExileReborn_filLSandBagAction =
["Fill sandbags",
{
    ExileReborn_hasFillSandBagAction = true;

    _caller = _this select 0;
    _action = _this select 2;
    _caller removeAction _action;

    if (ExileClientActionDelayShown) exitWith { false };
    ExileClientActionDelayShown = true;
    ExileClientActionDelayAbort = false;

    _animation = "Exile_Shovel_Dig01";
    disableSerialization;
    ("ExileActionProgressLayer" call BIS_fnc_rscLayer) cutRsc ["RscExileActionProgress", "PLAIN", 1, false];

    _keyDownHandle = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call ExileClient_action_event_onKeyDown"];
    _mouseButtonDownHandle = (findDisplay 46) displayAddEventHandler ["MouseButtonDown","_this call ExileClient_action_event_onMouseButtonDown"];

    player switchMove _animation;
    ["switchMoveRequest", [netId player, _animation]] call ExileClient_system_network_send;

    _startTime = diag_tickTime;
    _duration = 10;
    _sleepDuration = _duration / 100;
    _progress = 0;

    _display = uiNamespace getVariable "RscExileActionProgress";
    _label = _display displayCtrl 4002;
    _label ctrlSetText "0%";
    _progressBarBackground = _display displayCtrl 4001;
    _progressBarMaxSize = ctrlPosition _progressBarBackground;
    _progressBar = _display displayCtrl 4000;
    _progressBar ctrlSetPosition [_progressBarMaxSize select 0, _progressBarMaxSize select 1, 0, _progressBarMaxSize select 3];
    _progressBar ctrlSetBackgroundColor [0, 0.78, 0.93, 1];
    _progressBar ctrlCommit 0;
    _progressBar ctrlSetPosition _progressBarMaxSize;
    _progressBar ctrlCommit _duration;
    try
    {
        while {_progress < 1} do
        {
            if (ExileClientActionDelayAbort) then
            {
                throw 1;
            };
            uiSleep _sleepDuration;
            _progress = ((diag_tickTime - _startTime) / _duration) min 1;
            _label ctrlSetText format["%1%2", round (_progress * 100), "%"];
        };
        throw 0;
    }
    catch
    {
        _progressBarColor = [];
        switch (_exception) do
        {
            case 0:
            {
                _progressBarColor = [0.7, 0.93, 0, 1];

                _dir = direction player + 10;
                _pos = getPos player;
                _dist = 1;

                _pos = (_pos getPos [_dist, _dir] select [0, 2]) + ([[],[_pos select 2]] select (count _pos > 2));
                _holder = "GroundWeaponHolder" createVehicle _pos;

                [_holder, "Exile_Item_Sand"] call ExileClient_util_containerCargo_add;

                [
                    "InfoTitleAndText",
                    ["Digging", "You have filled a sandbag"]
                ] call ExileClient_gui_toaster_addTemplateToast;
            };
            case 1:
            {
                [
                    "InfoTitleAndText",
                    ["Digging", "Do not move while digging"]
                ] call ExileClient_gui_toaster_addTemplateToast;
                _progressBarColor = [0.82, 0.82, 0.82, 1];
            };
        };
        player switchMove "";
        ["switchMoveRequest", [netId player, ""]] call ExileClient_system_network_send;
        _progressBar ctrlSetBackgroundColor _progressBarColor;
        _progressBar ctrlSetPosition _progressBarMaxSize;
        _progressBar ctrlCommit 0;
    };

    ("ExileActionProgressLayer" call BIS_fnc_rscLayer) cutFadeOut 2;
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", _keyDownHandle];
    (findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _mouseButtonDownHandle];
    ExileClientActionDelayShown = false;
    ExileClientActionDelayAbort = false;
    ExileReborn_hasFillSandBagAction = false;
    ExileReborn_digSandAction_current = nil;

},"",0,false,true,"",""];

ExileReborn_userActions pushBack 
[
    [
        ExileReborn_filLSandBagAction,
        "ExileReborn_hasFillSandBagAction",
        "ExileReborn_digSandAction_current",
        "(((surfaceType (getPos player)) in _types) && !(ExileReborn_hasFillSandBagAction) && ('Exile_Melee_Shovel' isEqualTo (currentWeapon player)))",
        false
    ]    
];

ExileReborn_scavengeAction =
["Scavenge",
{
    ExileReborn_client_completedScavengeTask = true;    

    ExileReborn_hasscavengeAction = true;

    _caller = _this select 0;
    _action = _this select 2;
    _caller removeAction _action;

    if !([] call JohnO_fnc_canScavenge) then
    {
        [
            "ErrorTitleAndText",
            ["Invalid Object", "You cannot scavenge this object, try another"]
        ] call ExileClient_gui_toaster_addTemplateToast;
    }
    else
    {
        player playActionNow "PutDown";
        sleep 2;

        if (random 1 > 0.95) then
        {
            player setDamage (damage player + random 0.3);
            [60] call BIS_fnc_bloodEffect;
            if !(ExileReborn_playerIsWounded) then
            {
                ExileReborn_playerIsWounded = true;
                profileNamespace setVariable ["ExileReborn_playerIsWounded",ExileReborn_playerIsWounded];
            }; 
        }; 

        if (random 1 > 0.5) then
        {
            _item = [] call JohnO_fnc_randomItem;
            _itemConfig = configFile >> "cfgMagazines" >> _item;
            _itemDisplayName = getText(_itemConfig >> "displayName");
            if ([player,_item] call ExileClient_util_playerCargo_canAdd) then
            {
                player addItem _item;
                ["InfoTitleAndText",
                    [
                        "Item found",
                        format ["I have found a %1 .. it is in my gear",_itemDisplayName]
                    ]
                ] call ExileClient_gui_toaster_addTemplateToast;
                if (random 1 > 0) then
                {
                    if ([] call JohnO_fnc_canScavenge) then
                    {
                        cursorObject setDamage 1;
                    };
                };
            }
            else
            {
                _dir = direction player + 180;
                _pos = getPos player;
                _dist = 0.7;

                _pos = (_pos getPos [_dist, _dir] select [0, 2]) + ([[],[_pos select 2]] select (count _pos > 2));

                _nearHolders = position player nearObjects ["GroundWeaponHolder", 2];

                if (count _nearHolders > 0) then
                {
                    _holder = _nearHolders select 0;
                    [_holder, _item] call ExileClient_util_containerCargo_add;
                }
                else
                {
                    _holder = createVehicle ["GroundWeaponHolder",[(_pos select 0),(_pos select 1),0],[], 0, "CAN_COLLIDE"];
                    [_holder, _item] call ExileClient_util_containerCargo_add;
                };

                ["InfoTitleAndText",
                    [
                        "Item found",
                        format ["I have found a %1, there was no room in my gear. I should check around me",_itemDisplayName]
                    ]
                ] call ExileClient_gui_toaster_addTemplateToast;
                if (random 1 > 0.5) then
                {
                    if ([] call JohnO_fnc_canScavenge) then
                    {
                        cursorObject setDamage 1;
                    };
                };
            };
        }
        else
        {
             [
                "ErrorTitleAndText",
                ["Nothing found", "I have found nothing.."]
            ] call ExileClient_gui_toaster_addTemplateToast;
            if (random 1 > 0.3) then
            {
                if ([] call JohnO_fnc_canScavenge) then
                {
                    cursorObject setDamage 1;
                };
            };
        };
    };

    ExileReborn_hasscavengeAction = false;
    ExileReborn_scavengAction_current = nil;

},"",0,false,true,"","[] call JohnO_fnc_canScavenge"];

ExileReborn_userActions pushBack 
[
    [
        ExileReborn_scavengeAction,
        "ExileReborn_hasscavengeAction",
        "ExileReborn_scavengAction_current",
        "[] call JohnO_fnc_canScavenge",
        true
    ]    
];

// Search for berries

ExileReborn_searchBerriesAction =
["Search bush for berries",
{

    ExileReborn_client_completedBerryTask = true;

    ExileReborn_hasSearchBerriesAction = true;

    _caller = _this select 0;
    _action = _this select 2;
    _caller removeAction _action;

    if !([] call JohnO_fnc_canSearchForBerries) then
    {
        [
            "ErrorTitleAndText",
            ["Invalid Object", "You cannot search this object"]
        ] call ExileClient_gui_toaster_addTemplateToast;
    }
    else
    {
        player playActionNow "PutDown";
        sleep 2;
        if (random 1 > 0.4) then
        {
            [[[2,15,60],[3,10,60]],"I have found and eaten some berries",1,true] call JohnO_fnc_customConsume;
        }
        else
        {
            [
                "ErrorTitleAndText",
                ["Nothing found", "I have found no berries.."]
            ] call ExileClient_gui_toaster_addTemplateToast;
        };

        if (([] call JohnO_fnc_canSearchForBerries) && (random 1 > 0.8)) then
        {
            cursorObject setDamage 1;
        };    
    };

    ExileReborn_hasSearchBerriesAction = false;
    ExileReborn_searchBerriesAction_current = nil;

},"",0,false,true,"","[] call JohnO_fnc_canSearchForBerries"];

ExileReborn_userActions pushBack 
[
    [
        ExileReborn_searchBerriesAction,
        "ExileReborn_hasSearchBerriesAction",
        "ExileReborn_searchBerriesAction_current",
        "[] call JohnO_fnc_canSearchForBerries",
        true
    ]    
];