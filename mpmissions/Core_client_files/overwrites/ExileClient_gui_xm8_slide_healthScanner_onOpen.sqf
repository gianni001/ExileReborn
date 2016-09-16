/**
 * ExileClient_gui_xm8_slide_healthScanner_onOpen
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_display","_infoControl","_info","_hitpointInfo","_hitPointName","_hitpointDamage","_hitpointHealth","_hitpointColor","_hitpointName"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_infoControl = _display displayCtrl 4121;
_info = "";
_percent = "";

if !((vehicle player) isEqualTo player) then
{
	_hitpointInfo = getAllHitPointsDamage (vehicle player);
	{
		if !(_x isEqualTo "") then 
		{
			if(_x select [0,3] == "Hit")then
			{
				_hitPointName = _x select [3,(count _x)-1];
			}
			else
			{
				_hitPointName = _x;
			};
			_hitpointDamage = (_hitpointInfo select 2) select _forEachIndex;
			_hitpointHealth = round (100 - (_hitpointDamage * 100));
			_hitpointColor = "#fcfdff";
			if (_hitpointHealth <= 25) then 
			{
				_hitpointColor = "#c72650";
			};
			if !(_info isEqualTo "") then
			{
				_info = _info + "<br/>";
			};	
			_info = _info + (format ["<t size='1.25' align='left'>%1</t><t size='1.25' align='right' color='%2'>%3%4</t>", _hitpointName, _hitpointColor, _hitpointHealth, '%']);
		};
	} forEach (_hitpointInfo select 0);	
}
else
{	
	_infoArray = 
	[
		["Health",""],
		["Wounded",ExileReborn_playerIsWounded],
		["Infected",ExileReborn_playerIsInfected],
		["Clothing",ExileClientPlayerAttributes select 6],
		["BodyTemp",""]
	];
	{
		if !(_x isEqualTo "") then 
		{
			_hitPointName = (_x select 0);
			if (_hitpointName isEqualTo "Health") then
			{	
				_hitpointColor = "#fcfdff";
				_hitpointDamage = damage player;
				_hitpointHealth = round (100 - (_hitpointDamage * 100));
				if (_hitpointHealth <= 25) then 
				{
					_hitpointColor = "#c72650";
				};
				_percent = "%";
			};

			if ((_x select 0) isEqualTo "Wounded") then
			{
				_hitPointName = "Wounded";
				_hitpointColor = "#fcfdff";
				_percent = "";
				if (_x select 1) then
				{	
					_hitpointHealth = "I have an uncleaned wound";
				}
				else
				{
					_hitpointHealth = "I am not wounded";
				};
			};	
			if ((_x select 0) isEqualTo "Infected") then
			{
				_hitPointName = "Infection";
				_hitpointColor = "#fcfdff";
				_percent = "";
				if (_x select 1) then
				{	
					_hitpointHealth = "I have an infection";
				}
				else
				{
					_hitpointHealth = "I am not infected";
				};
			};
			if ((_x select 0) isEqualTo "Clothing") then
			{
				_hitPointName = "Clothing";
				_hitpointColor = "#fcfdff";
				_percent = "";
				_wetness = (_x select 1);
				if (_wetness <= 0) then
				{	
					_hitpointHealth = "I am dry";
				};
				if (_wetness > 0 && _wetness <= 0.2) then
				{	
					_hitpointHealth = "I damp";
				};
				if (_wetness > 0.2 && _wetness <= 0.4) then
				{
					_hitpointHealth = "I am wet";
				};
				if (_wetness > 0.4 && _wetness <= 0.7) then
				{
					_hitpointHealth = "I am very wet";
				};
				if (_wetness > 0.7) then
				{
					_hitpointHealth = "I am soaked";
				};
			};
			if ((_x select 0) isEqualTo "BodyTemp") then
			{
				_hitPointName = "Core temp";
				_hitpointColor = "#fcfdff";
				_percent = "°C";
				_hitpointHealth = [ExileClientPlayerAttributes select 5, 1] call ExileClient_util_math_round; 
			};	

			if !(_info isEqualTo "") then
			{
				_info = _info + "<br/>";
			};	
			_info = _info + (format ["<t size='1.25' align='left'>%1</t><t size='1.25' align='right' color='%2'>%3%4</t>", _hitpointName, _hitpointColor, _hitpointHealth, _percent]);
		};
	} forEach _infoArray;
};
_infoControl ctrlSetStructuredText (parseText _info);
[_infoControl] call BIS_fnc_ctrlTextHeight;