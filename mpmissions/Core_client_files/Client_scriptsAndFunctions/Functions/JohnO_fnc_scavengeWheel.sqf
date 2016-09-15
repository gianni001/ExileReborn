private ["_wheelToRemove","_wheels","_vehicle","_goodWheels"];

if (ExileClientActionDelayShown) exitWith { false };
ExileClientActionDelayShown = true;
ExileClientActionDelayAbort = false;

_vehicle = _this select 0;

_wheels = [_vehicle] call JohnO_fnc_getVehicleType;
_goodWheels = [];
{
	if ((_vehicle getHitPointDamage _x) <= 0) then
	{	
		_goodWheels pushBack _x;
	};
} forEach _wheels;
if (!local _vehicle) then
{
	[
		"InfoTitleAndText", 
		["Repair Info", "Get in driver seat first"]
	] call ExileClient_gui_toaster_addTemplateToast;
}
else
{	
	if !(_goodWheels isEqualTo []) then
	{
		_equippedMagazines = magazines player;
		if ("Exile_Item_Foolbox" in _equippedMagazines) then
		{	
			_wheelToRemove = _goodWheels select 0;

			_animation = "Exile_Acts_RepairVehicle01_Animation01";
			disableSerialization;
			("ExileActionProgressLayer" call BIS_fnc_rscLayer) cutRsc ["RscExileActionProgress", "PLAIN", 1, false];

			_keyDownHandle = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call ExileClient_action_event_onKeyDown"];
			_mouseButtonDownHandle = (findDisplay 46) displayAddEventHandler ["MouseButtonDown","_this call ExileClient_action_event_onMouseButtonDown"];

			player switchMove _animation;
			["switchMoveRequest", [netId player, _animation]] call ExileClient_system_network_send;

			_startTime = diag_tickTime;
			_duration = 10;
			_sleepDuration = _duration / 100;
			_progress = 0;

			_display = uiNamespace getVariable "RscExileActionProgress";   
			_label = _display displayCtrl 4002;
			_label ctrlSetText "0%";
			_progressBarBackground = _display displayCtrl 4001;  
			_progressBarMaxSize = ctrlPosition _progressBarBackground;
			_progressBar = _display displayCtrl 4000;  
			_progressBar ctrlSetPosition [_progressBarMaxSize select 0, _progressBarMaxSize select 1, 0, _progressBarMaxSize select 3];
			_progressBar ctrlSetBackgroundColor [0, 0.78, 0.93, 1];
			_progressBar ctrlCommit 0;
			_progressBar ctrlSetPosition _progressBarMaxSize; 
			_progressBar ctrlCommit _duration;
			try
			{
				while {_progress < 1} do
				{	
					if (ExileClientActionDelayAbort) then 
					{
						throw 1;
					};

					uiSleep _sleepDuration; 
					_progress = ((diag_tickTime - _startTime) / _duration) min 1;
					_label ctrlSetText format["%1%2", round (_progress * 100), "%"];
				};
				throw 0;
			}
			catch
			{
				_progressBarColor = [];
				switch (_exception) do 
				{
					case 0:
					{
						_progressBarColor = [0.7, 0.93, 0, 1];
						_vehicle setHitPointDamage [_wheelToRemove,1];
						_holder = createVehicle ["GroundWeaponHolder", position player, [], 0, "CAN_COLLIDE"]; 
						_holder addItemCargoGlobal ["Exile_Item_CarWheel", 1];

						[
							"InfoTitleAndText", 
							["Scavenge Info", "You have removed a wheel"]
						] call ExileClient_gui_toaster_addTemplateToast;
					};
					case 1: 	
					{ 
						[
							"InfoTitleAndText", 
							["Scavenge Info", "Do not move while scavenging"]
						] call ExileClient_gui_toaster_addTemplateToast;
						_progressBarColor = [0.82, 0.82, 0.82, 1];
					};
				};	
				player switchMove "";
				["switchMoveRequest", [netId player, ""]] call ExileClient_system_network_send;
				_progressBar ctrlSetBackgroundColor _progressBarColor;
				_progressBar ctrlSetPosition _progressBarMaxSize;
				_progressBar ctrlCommit 0;
			};

			("ExileActionProgressLayer" call BIS_fnc_rscLayer) cutFadeOut 2; 
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", _keyDownHandle];
			(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _mouseButtonDownHandle];
			ExileClientActionDelayShown = false;
			ExileClientActionDelayAbort = false;
		}
		else
		{
			[
				"ErrorTitleAndText", 
				["Scavenge Info", "You require a toolbox to remove a wheel from this vehicle"]
			] call ExileClient_gui_toaster_addTemplateToast;
		};	
	}
	else
	{
		[
			"ErrorTitleAndText", 
			["Scavenge Info", "This vehicle appears to have no good wheels, repair them first"]
		] call ExileClient_gui_toaster_addTemplateToast;
	};
};		
ExileClientActionDelayShown = false;
ExileClientActionDelayAbort = false;