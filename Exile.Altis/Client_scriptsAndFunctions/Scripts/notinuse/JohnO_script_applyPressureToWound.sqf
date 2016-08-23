_target = _this select 0;
_action = _this select 2;
_patient = cursorTarget;

_target removeAction _action;

player playActionNow "Medic";

sleep 4;

_bleedingRemaining = getBleedingRemaining _patient;
_patient setBleedingRemaining (_bleedingRemaining - 50);

[
	"InfoTitleAndText", 
	["Applied pressure", "I have applied pressure to their wounds"]
] call ExileClient_gui_toaster_addTemplateToast;

ExileReborn_pressureAction = false;