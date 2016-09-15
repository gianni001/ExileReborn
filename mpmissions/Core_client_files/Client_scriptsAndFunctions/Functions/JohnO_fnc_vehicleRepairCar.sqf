/**
 * ExileClient_object_vehicle_repair
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicle","_availableHitpoints","_fixable","_equippedMagazines","_wheels","_broken"];

if (ExileClientActionDelayShown) exitWith { false };
ExileClientActionDelayShown = true;
ExileClientActionDelayAbort = false;

_vehicle = _this select 0;

if (vehicle player isEqualTo _vehicle) exitWith 
{
	[
		"InfoTitleAndText", 
		["Repair Info", "Are you serious?"]
	] call ExileClient_gui_toaster_addTemplateToast;
	ExileClientActionDelayShown = false;
	ExileClientActionDelayAbort = false;
};
_availableHitpoints = (getAllHitPointsDamage _vehicle) select 0;
{
	if((_vehicle getHitPointDamage _x) > 0)exitWith
	{
		_fixable = "potato";
	};
}
forEach _availableHitpoints;

_wheels = [_vehicle] call JohnO_fnc_getVehicleType;
_broken = [];
{
	if ((_vehicle getHitPointDamage _x) > 0) then
	{	
		_damage = _vehicle getHitPointDamage _x;
		_broken pushBack [_damage,_x]; 
	};
} forEach _wheels;

if (isNil "_fixable") exitWith 
{
	[
		"InfoTitleAndText", 
		["Repair Info", "This vehicle is already fully repaired"]
	] call ExileClient_gui_toaster_addTemplateToast;
	ExileClientActionDelayShown = false;
	ExileClientActionDelayAbort = false;
}; 
if (!local _vehicle) then
{
	[
		"InfoTitleAndText", 
		["Repair Info", "Get in driver seat first"]
	] call ExileClient_gui_toaster_addTemplateToast;
}
else 
{
	_equippedMagazines = magazines player;
	if ("Exile_Item_Foolbox" in _equippedMagazines) then
	{	
		if ("Exile_Item_Wrench" in _equippedMagazines) then
		{
			if ("Exile_Item_DuctTape" in _equippedMagazines) then
			{
				if ("Exile_Item_JunkMetal" in _equippedMagazines) then
				{
				
					_animation = "Exile_Acts_RepairVehicle01_Animation01";
					disableSerialization;
					("ExileActionProgressLayer" call BIS_fnc_rscLayer) cutRsc ["RscExileActionProgress", "PLAIN", 1, false];

					_keyDownHandle = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call ExileClient_action_event_onKeyDown"];
					_mouseButtonDownHandle = (findDisplay 46) displayAddEventHandler ["MouseButtonDown","_this call ExileClient_action_event_onMouseButtonDown"];

					player switchMove _animation;
					["switchMoveRequest", [netId player, _animation]] call ExileClient_system_network_send;

					_startTime = diag_tickTime;
					_duration = 20;
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
								if (_vehicle isKindOf "car")  then
								{	
									_vehicle setDamage 0;
									{
										_vehicle setHitPointDamage [(_x select 1),(_x select 0)];
									} forEach _broken;
									player removeItem "Exile_Item_DuctTape";
									player removeItem "Exile_Item_JunkMetal";
									[
										"InfoTitleAndText", 
										["Repair Info", "You have repaired the body of this vehicle"]
									] call ExileClient_gui_toaster_addTemplateToast;
								}						
								else
								{
									_vehicle setDamage 0;
								};	
							};
							case 1: 	
							{ 
								[
									"InfoTitleAndText", 
									["Repair Info", "Do not move during repair"]
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
						"InfoTitleAndText", 
						["Repair Info", "You need junk metal"]
					] call ExileClient_gui_toaster_addTemplateToast;
				};
			}
			else 
			{
				[
					"InfoTitleAndText", 
					["Repair Info", "You need duct tape"]
				] call ExileClient_gui_toaster_addTemplateToast;
			};
		}
		else
		{
			[
				"InfoTitleAndText", 
				["Repair Info", "You need a wrench"]
			] call ExileClient_gui_toaster_addTemplateToast;
		};	
	}
	else
	{
		[
			"InfoTitleAndText", 
			["Repair Info", "You need a tool box"]
		] call ExileClient_gui_toaster_addTemplateToast;
	};
	
};
ExileClientActionDelayShown = false;
ExileClientActionDelayAbort = false;
true
