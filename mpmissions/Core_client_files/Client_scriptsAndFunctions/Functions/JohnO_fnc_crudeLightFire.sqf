private ["_fire"];

_fire = _this select 0;

if ("Exile_Item_ToiletPaper" in (magazines player)) then
{
	if (random 1 > 0.5) then
	{
		player playActionNow "Medic";
		sleep 4;
		_fire inflame true;
		player removeItem "Exile_Item_ToiletPaper";
	}
	else
	{
		player playActionNow "Medic";
		sleep 4;
		player removeItem "Exile_Item_ToiletPaper";
		[
			"ErrorTitleAndText", 
			["No flame", "I have tried to light the fire but failed"]
		] call ExileClient_gui_toaster_addTemplateToast;
	};	
}
else
{
	[
		"ErrorTitleAndText", 
		["I need some kindling", "I need something easy to use, such as toilet paper"]
	] call ExileClient_gui_toaster_addTemplateToast;
};	