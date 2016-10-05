private ["_survivor"];

_survivor = _this select 0;

_survivor setVariable ["ExileReborn_survivor_isFollowing",-1,true];

player setVariable ["ExileReborn_survivor_isFollowingMe",false];

["InfoTitleAndText",
    [
        "Bye!",
        format ["He waves good bye and leaves me be.."]
    ]
] call ExileClient_gui_toaster_addTemplateToast;