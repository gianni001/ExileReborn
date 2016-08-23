_target = _this select 0;
_action = _this select 2;
_patient = cursorTarget;

_target removeAction _action;

player playActionNow "Medic";
player removeItem "Exile_Item_InstaDoc";

sleep 4;

_patient setBleedingRemaining 0;
_patient setDamage 0;

[
	"InfoTitleAndText", 
	["InstaDoc applied", "I have applied a InstaDoc"]
] call ExileClient_gui_toaster_addTemplateToast;

ExileReborn_instaDocAction = false;