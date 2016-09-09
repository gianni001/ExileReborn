private ["_currentBodyTemperature","_bodyWetness"];

_currentBodyTemperature = ExileClientPlayerAttributes select 5;
_bodyWetness = ExileClientPlayerAttributes select 6;

if (isNil "LastBodyTempUpdate") then
{	
	LastBodyTempUpdate = _currentBodyTemperature;
};

if ((LastBodyTempUpdate >= 36.7) && !(ExileReborn_playerIsInfected)) then
{
	["<t color='#00cc44' font='OrbitronLight' size ='.6'>I feel comfortable</t>",(safezoneX + safezoneW) - 520 * pixelW - 60 * pixelW,(safezoneY + safezoneH) - 128 * pixelH - 60 * pixelH,10,1,0,789] spawn BIS_fnc_dynamicText;
}
else
{	
	// Cold notifcations
	if ((_currentBodyTemperature < LastBodyTempUpdate) && (_currentBodyTemperature < 36.7) && (_currentBodyTemperature >= 36)) then
	{
		["<t color='#b3b3ff' font='OrbitronLight' size ='.6'>I am cooling down</t>",(safezoneX + safezoneW) - 520 * pixelW - 60 * pixelW,(safezoneY + safezoneH) - 128 * pixelH - 60 * pixelH,10,1,0,789] spawn BIS_fnc_dynamicText;
	}
	else
	{
		if ((_currentBodyTemperature < LastBodyTempUpdate) && (_currentBodyTemperature < 36) && (_currentBodyTemperature >= 35.5)) then
		{
			["<t color='#8080ff' font='OrbitronLight' size ='.6'>I am getting very cold</t>",(safezoneX + safezoneW) - 520 * pixelW - 60 * pixelW,(safezoneY + safezoneH) - 128 * pixelH - 60 * pixelH,10,1,0,789] spawn BIS_fnc_dynamicText;
		}
		else
		{
			if ((_currentBodyTemperature < LastBodyTempUpdate) && (_currentBodyTemperature < 35.5) && (_currentBodyTemperature >= 35)) then
			{	
				["<t color='#4d4dff' font='OrbitronLight' size ='.6'>I am starting to freeze</t>",(safezoneX + safezoneW) - 520 * pixelW - 60 * pixelW,(safezoneY + safezoneH) - 128 * pixelH - 60 * pixelH,10,1,0,789] spawn BIS_fnc_dynamicText;
				enableCamShake true;
				addCamShake [1, 2, 30];
			}
			else
			{
				if ((_currentBodyTemperature < LastBodyTempUpdate) && (_currentBodyTemperature < 35)) then
				{
					["<t color='#1a1aff' font='OrbitronLight' size ='.6'>I am freezing</t>",(safezoneX + safezoneW) - 520 * pixelW - 60 * pixelW,(safezoneY + safezoneH) - 128 * pixelH - 60 * pixelH,10,1,0,789] spawn BIS_fnc_dynamicText;
					enableCamShake true;
					addCamShake [3, 4, 30];
				};	
			};	
		};	
	};
	// Warm notifications
	if (_currentBodyTemperature > LastBodyTempUpdate) then // Always the case.
	{ 
		["<t color='#ff3333' font='OrbitronLight' size ='.6'>I am warming up</t>",(safezoneX + safezoneW) - 520 * pixelW - 60 * pixelW,(safezoneY + safezoneH) - 128 * pixelH - 60 * pixelH,10,1,0,789] spawn BIS_fnc_dynamicText;
	};
};		

// Set LastBodyTempUpdate to your current body temp as at the time the function is run
LastBodyTempUpdate = _currentBodyTemperature;