private ["_position","_radius","_towers","_listOfCrashSites","_crashGridPos","_crashPos","_found","_timer","_limit"];


_position = _this select 0;
_radius = _this select 1;

_towers = nearestObjects [position player, ["Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_Radar_F","Land_Radar_Small_F"], _radius];

if (isNil "Event_HeliCrash_Positions") then
{
	Event_HeliCrash_Positions = [];
};	

_listOfCrashSites = [];

{
	_listOfCrashSites pushBack (_x select 0);

} forEach Event_HeliCrash_Positions;

_found = false;

if !((count _towers) == 0) then
{
	if ("Exile_Item_Laptop" in (magazines player)) then
	{	
		if (time - lastCommsHack_coolDown >= lastCommsHack) then
		{	
			lastCommsHack = time;

			player playActionNow "Medic";

			_dir = direction player + 10;
			_pos = getPos player;  
			_dist = 1.5; 
			 
			_pos = (_pos getPos [_dist, _dir] select [0, 2]) + ([[],[_pos select 2]] select (count _pos > 2)); 
			 
			_lapTop = createVehicle ["Land_Laptop_unfolded_F",[(_pos select 0),(_pos select 1),0],[], 0, "CAN_COLLIDE"];  
			_lapTop setDir _dir - 160;

			sleep 3;

			playSound "code1";

			disableSerialization;
			("ExileActionProgressLayer" call BIS_fnc_rscLayer) cutRsc ["RscExileActionProgress", "PLAIN", 1, false];

			_startTime = diag_tickTime;
			_duration = 30;
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

			while {_progress < 1} do
			{	
				_label ctrlSetText format["%1%2", round (_progress * 100), "%"];
				uiSleep _sleepDuration; 

				_progress = ((diag_tickTime - _startTime) / _duration) min 1;

				//hint str _progress;

				if (_progress >= 0.2 && _progress < 0.21) then {playSound "code2";};
				if (_progress >= 0.5 && _progress < 0.51) then {playSound "code3";};
			};

			_progressBarColor = [0.7, 0.93, 0, 1];
			_progressBar ctrlSetBackgroundColor _progressBarColor;

			_progressBar ctrlSetPosition _progressBarMaxSize;
			_progressBar ctrlCommit 0;

			("ExileActionProgressLayer" call BIS_fnc_rscLayer) cutFadeOut 2; 

			if !(alive player) exitWith {};

			sleep 2;

			titleText ["Scan complete - Triangulating positions","PLAIN DOWN"];

			sleep 2;

			if !(_listOfCrashSites isEqualTo []) then
			{	
				_crashPos = selectRandom _listOfCrashSites;	
				_crashGridPos = mapGridPosition _crashPos;
				_found = true;
			};	
			if (_found) then
			{	
				["InfoTitleAndText",
					[
			            "Distress recording",
			            format ["I found a distress call at grid: %1",_crashGridPos]
				    ]
			    ] call ExileClient_gui_toaster_addTemplateToast;
			    
			    if (random 1 > 0.8) then
			    {
			    	["spawnHuntersOnTarget", [player]] call ExileClient_system_network_send;
			    };
			    
			}
			else
			{
				["ErrorTitleAndText",
					[
			            "Found no data",
			            format ["I found no data at this tower"]
				    ]
			    ] call ExileClient_gui_toaster_addTemplateToast;
			};

			deleteVehicle _lapTop;	    
		}
		else
		{
			["ErrorTitleAndText",
				[
		            "Not yet..",
		            format ["I cannot hack the data for another: %1 seconds",lastCommsHack_coolDown - round (time - lastCommsHack)]
			    ]
	    	] call ExileClient_gui_toaster_addTemplateToast;
		}; 
	}
	else
	{
		["ErrorTitleAndText",
			[
	            "Insufficient equipment",
	            format ["I need a laptop to hack data from this tower"]
		    ]
    	] call ExileClient_gui_toaster_addTemplateToast;
	};	
}
else
{
	["ErrorTitleAndText",
		[
            "No comms",
            format ["I need to be closer to a comms tower to do this"]
	    ]
    ] call ExileClient_gui_toaster_addTemplateToast;
};	