private ["_addRespect"];

_patient = _this select 0;
call ExileClient_gui_interactionMenu_unhook;

player playActionNow "Medic";
player removeItem "Exile_Item_InstaDoc";

sleep 4;

_patient setBleedingRemaining 0;
_patient setDamage 0;

if (time - ExileReborn_healingCoolDown >= ExileReborn_lastHealingReward) then
{
	ExileReborn_lastHealingReward = time;
	_addRespect = 150;
	[_addRespect,0,true] call JohnO_fnc_updateRespectAndTabs;
};

["InfoTitleAndText",
	[
        "InstaDoc applied",
        format ["I have applied a instaDoc to their wounds - %1 respect", _addRespect]
    ]
] call ExileClient_gui_toaster_addTemplateToast;