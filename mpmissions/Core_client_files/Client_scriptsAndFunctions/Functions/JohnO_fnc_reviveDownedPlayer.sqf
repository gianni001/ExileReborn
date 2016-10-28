private ["_patient","_addRespect"];

_patient = _this select 0;

player playAction "MedicOther";

sleep 8;

_patient setVariable ["ExileReborn_player_isUnconcious",false,true];

if (time - ExileReborn_healingCoolDown >= ExileReborn_lastHealingReward) then
{
	ExileReborn_lastHealingReward = time;
	_addRespect = 120;
	[_addRespect,0,true] call JohnO_fnc_updateRespectAndTabs;
};	

["InfoTitleAndText",
	[
        "Revived",
        format ["I have revived this person - %1 respect", _addRespect]
    ]
] call ExileClient_gui_toaster_addTemplateToast;