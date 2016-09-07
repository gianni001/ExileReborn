_target = _this select 0;
_action = _this select 2;
_patient = cursorTarget;

_target removeAction _action;

player playActionNow "Medic";
player removeItem "Exile_Item_Bandage";

sleep 4;

_patient setBleedingRemaining 0;

[
	"InfoTitleAndText", 
	["Bandage applied", "I have applied a bandage to their wounds"]
] call ExileClient_gui_toaster_addTemplateToast;

ExileReborn_bandageAction = false;