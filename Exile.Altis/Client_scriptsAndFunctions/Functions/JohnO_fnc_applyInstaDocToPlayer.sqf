_patient = _this select 0;
call ExileClient_gui_interactionMenu_unhook;

player playActionNow "Medic";
player removeItem "Exile_Item_InstaDoc";

sleep 4;

_patient setBleedingRemaining 0;
_patient setDamage 0;

[
	"InfoTitleAndText", 
	["InstaDoc applied", "I have applied a InstaDoc"]
] call ExileClient_gui_toaster_addTemplateToast;