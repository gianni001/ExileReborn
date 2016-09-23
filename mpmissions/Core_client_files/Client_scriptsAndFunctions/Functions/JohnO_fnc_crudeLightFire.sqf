private ["_fire","_flares","_items","_flaresOnPlayer"];

_fire = _this select 0;

_flares =
[
	"3Rnd_UGL_FlareGreen_F",
	"3Rnd_UGL_FlareRed_F",
	"3Rnd_UGL_FlareWhite_F",
	"3Rnd_UGL_FlareYellow_F",
	"UGL_FlareGreen_F",
	"UGL_FlareRed_F",
	"UGL_FlareWhite_F",
	"UGL_FlareYellow_F",
	"FlareGreen_F",
	"FlareRed_F",
	"FlareWhite_F",
	"FlareYellow_F"
];

_items = magazines player;

_flaresOnPlayer = _items arrayIntersect _flares;

if ("Exile_Item_ToiletPaper" in (magazines player)) then
{
	if ((count _flaresOnPlayer) > 0) then
	{	
		if (random 1 > 0.5) then
		{
			player playActionNow "Medic";
			sleep 4;
			_fire inflame true;
			player removeItem "Exile_Item_ToiletPaper";
			player removeItem (selectRandom _flaresOnPlayer);
		}
		else
		{
			player playActionNow "Medic";
			sleep 4;
			player removeItem "Exile_Item_ToiletPaper";
			player removeItem (selectRandom _flaresOnPlayer);
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
			["I need a catalyst", "I need something to spark a flame, like a flare"]
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