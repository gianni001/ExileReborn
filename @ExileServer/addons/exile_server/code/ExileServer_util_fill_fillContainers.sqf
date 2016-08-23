/**
 * ExileServer_util_fill_fillContainers
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_object","_containers","_current","_control","_container","_weapons","_magazines","_items","_type"];
_object = _this select 0;
_containers = _this select 1;
if ((typeName _containers) isEqualTo "ARRAY") then 
{
	if!(_containers isEqualTo [])then
	{
		_current_filled = [];
		_control = [];
		{
			_container = _x select 0;
			_weapons = _x select 1;
			_magazines = _x select 2;
			_items = _x select 3;
			_type = [_container] call BIS_fnc_itemType;
			if((_type select 1) isEqualTo "Backpack")then
			{
				_object addBackpackCargoGlobal [_container,1];
			}
			else
			{
				_object addItemCargoGlobal [_container,1];
			};
			_control = (everyContainer _object);
			{
				if!((_x select 1) in _current_filled)exitWith
				{
					_current_filled pushBack (_x select 1);
				};
			}
			forEach _control;
			if!(_weapons isEqualTo [])then
			{
				[(_current_filled select _forEachIndex),_weapons] call ExileServer_util_fill_fillWeapons;
			};
			if!(_magazines isEqualTo [])then
			{
				[(_current_filled select _forEachIndex),_magazines] call ExileServer_util_fill_fillMagazines;
			};
			if!(_items isEqualTo [[],[]])then
			{
				[(_current_filled select _forEachIndex),_items] call ExileServer_util_fill_fillItems;
			};
		}
		forEach _containers;
	};
};
true