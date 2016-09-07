private ["_chemLight","_extinguish"];

_chemlights = ["Chemlight_green","Chemlight_yellow","Chemlight_red","Chemlight_blue"];

_items = magazines player;
_availChems = _items arrayIntersect _chemlights;

if (count _availChems == 0) then 
{
	[
	"InfoTitleAndText", 
	["No Chemlights", "You have no chemlights to attach"]
	] call ExileClient_gui_toaster_addTemplateToast;
} 
else
{
	_chem = _availChems call BIS_fnc_selectRandom;

	player removeItem _chem;

	_pos = position player;
	_obj = player;

	player playActionNow "Medic";

	sleep 10;

	_offset = [-0.04, 0, 0.10];
	_part = "rightshoulder";

	_chemLight = _chem createVehicle (position player);  
	_chemLight attachTo [vehicle player, _offset, _part];
	
	_extinguish = player addAction ["Extinguish Chemlight","ExAdClient\XM8\Apps\Chem\extinguishLight.sqf",_chemLight,0,false];

	[905, JohnO_fnc_handleChemLightActions, [_extinguish], false] call ExileClient_system_thread_addtask;

	[
		"InfoTitleAndText", 
		["Chemlight attached", "Use your scroll wheel to remove the chemlight at any time"]
	] call ExileClient_gui_toaster_addTemplateToast;	
};

