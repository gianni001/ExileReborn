private ["_addRespect"];

_patient = _this select 0;
call ExileClient_gui_interactionMenu_unhook;

player playActionNow "Medic";

sleep 4;

_bleedingRemaining = getBleedingRemaining _patient;
_amountToReduce = (_bleedingRemaining - 30);

_patient setVariable ["ExileReborn_adjustBleedingTrue",true,true];
_patient setVariable ["ExileReborn_adjustBleeding",_amountToReduce,true];

if (time - ExileReborn_healingCoolDown >= ExileReborn_lastHealingReward) then
{
	ExileReborn_lastHealingReward = time;
	_addRespect = 80;
	[_addRespect,0,true] call JohnO_fnc_updateRespectAndTabs;
};

["InfoTitleAndText",
	[
        "Applied pressure",
        format ["I have applied pressure to their wounds - %1 respect", _addRespect]
    ]
] call ExileClient_gui_toaster_addTemplateToast;