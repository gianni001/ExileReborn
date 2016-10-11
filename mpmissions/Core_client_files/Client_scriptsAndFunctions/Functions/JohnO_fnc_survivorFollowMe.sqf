private ["_survivor","_chance"];

_survivor = _this select 0;

_chance = _survivor getVariable ["ExileReborn_survivor_chance",0];

if (_chance > random 100) then
{	
	_survivor setVariable ["ExileReborn_survivor_isFollowing",(netID player),true];

	player setVariable ["ExileReborn_survivor_isFollowingMe",true];

	["InfoTitleAndText",
	    [
	        "He agrees",
	        format ["He says he will follow me soon and catch up.."]
	    ]
	] call ExileClient_gui_toaster_addTemplateToast;

	ExileReborn_succesfullyBribed = true;
}
else
{

	["ErrorTitleAndText",
	    [
	        "No deal",
	        format ["It looks like the survivor does not want to follow me.."]
	    ]
	] call ExileClient_gui_toaster_addTemplateToast;

	_survivor setVariable ["ExileReborn_survivor_switchHostile",1,true];
};
