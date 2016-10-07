private ["_addRespect"];

_patient = _this select 0;

call ExileClient_gui_interactionMenu_unhook;

player playActionNow "Medic";
player removeItem "Exile_Item_Bandage";

sleep 4;

_patient setVariable ["ExileReborn_clientBandaged",true,true];

if (time - ExileReborn_healingCoolDown >= ExileReborn_lastHealingReward) then
{
	ExileReborn_lastHealingReward = time;
	_addRespect = 120;
	[_addRespect,0,true] call JohnO_fnc_updateRespectAndTabs;
};	

["InfoTitleAndText",
	[
        "Bandage applied",
        format ["I have applied a bandage to their wounds - %1 respect", _addRespect]
    ]
] call ExileClient_gui_toaster_addTemplateToast;

