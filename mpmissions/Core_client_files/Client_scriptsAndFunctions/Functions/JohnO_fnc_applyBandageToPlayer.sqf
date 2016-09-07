_patient = _this select 0;

call ExileClient_gui_interactionMenu_unhook;

player playActionNow "Medic";
player removeItem "Exile_Item_Bandage";

sleep 4;

_patient setVariable ["ExileReborn_clientBandaged",true,true];

[
	"InfoTitleAndText", 
	["Bandage applied", "I have applied a bandage to their wounds"]
] call ExileClient_gui_toaster_addTemplateToast;