private["_target","_name","_level","_baseChance","_actualChance","_eventSiteGrid"];

_target = _this select 0;
_baseChance = 0.3; // 30%

_level = [ExileClientPlayerScore] call JohnO_fnc_getRespectTier;	// Returns a number between 0 and 5

_actualChance = _baseChance + (_level / 10); // Increase the base chance by a decimal factor of your respect level

if !(alive _target) then 
{
	if (_target isKindOf "Exile_Unit_Player") then
	{
		_name = _target getVariable ["ExileName", -1];
	}
	else
	{
		_name = "Unknown";
	};
	
	player playActionNow "Medic";
	deleteVehicle _target;

	sleep 5;	

	if (_actualChance >= random 1) then
	{
		/*
		_addRespect = 175;	
		_newScore = ExileClientPlayerScore + _addrespect;
	    ENIGMA_UpdateStats = [player,_newScore];
	    publicVariableServer "ENIGMA_UpdateStats";
		*/
		
		_addRespect = 175;
		[_addRespect,0,true] call JohnO_fnc_updateRespectAndTabs;

	    if (_actualChance >= random 1) then
	    {
	    	_eventSiteGrid = [] call JohnO_fnc_getEventLocations;
			
			if !(_eventSiteGrid isEqualTo -1) then
			{
				["InfoTitleAndText",
					[
			            "Information found",
			            format ["Their name is %1..you found a note with a grid location: %3 | %2 respect",_name, _addRespect,_eventSiteGrid]
				    ]
		    	] call ExileClient_gui_toaster_addTemplateToast;
			}
			else
			{	

			    ["InfoTitleAndText",
					[
			            "Information found",
			            format ["Their name is %1..you found some info: + %2 respect",_name, _addRespect]
				    ]
			    ] call ExileClient_gui_toaster_addTemplateToast;
			};
		}
		else
		{
			["InfoTitleAndText",
				[
		            "Information found",
		            format ["Their name is %1..you found some info: + %2 respect",_name, _addRespect]
			    ]
		    ] call ExileClient_gui_toaster_addTemplateToast;
		};	
	}		      	
	else
	{
		["ErrorTitleAndText",
			[
	            "No information found",
	            format ["Their name is %1 ... they had no information on them", _name]
		    ]
	    ] call ExileClient_gui_toaster_addTemplateToast;
	};    
};