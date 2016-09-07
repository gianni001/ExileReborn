_patient = _this select 0;
call ExileClient_gui_interactionMenu_unhook;

player playActionNow "Medic";

sleep 4;

_bleedingRemaining = getBleedingRemaining _patient;
_amountToReduce = (_bleedingRemaining - 30);

_patient setVariable ["ExileReborn_adjustBleedingTrue",true,true];
_patient setVariable ["ExileReborn_adjustBleeding",_amountToReduce,true];

[
	"InfoTitleAndText", 
	["Applied pressure", "I have applied pressure to their wounds"]
] call ExileClient_gui_toaster_addTemplateToast;