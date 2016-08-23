private ["_player","_container","_item","_itemType","_holder"];

_player = _this select 0;
_container = _this select 1;
_item = _this select 2;
_itemType = _this select 3;

switch (_itemType) do
{
	case "headgear":
	{
		if !(_item in AllowedClothing) then
		{
			player removeHeadgear;

			_holder = createVehicle ["GroundWeaponHolder", position player, [], 0, "CAN_COLLIDE"];
			_holder addItemCargoGlobal _item;

			["ErrorTitleAndText",
				[
		            "Not allowed",
		            format ["Your rank does not allow the use of these clothes"]
			    ]
	    	] call ExileClient_gui_toaster_addTemplateToast;
		};	
	};
	case "uniform":
	{
		if !(_item in AllowedClothing) then
		{
			player removeUniform;

			_holder = createVehicle ["GroundWeaponHolder", position player, [], 0, "CAN_COLLIDE"];
			_holder addItemCargoGlobal _item;

			["ErrorTitleAndText",
				[
		            "Not allowed",
		            format ["Your rank does not allow the use of these clothes"]
			    ]
	    	] call ExileClient_gui_toaster_addTemplateToast;
		};
	};
};
