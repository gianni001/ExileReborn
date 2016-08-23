/**
 * ExileServer_util_fill_fillWeapons
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_object","_weapons","_i","_thing"];
_object = _this select 0;
_weapons = _this select 1;
if ((typeName _weapons) isEqualTo "ARRAY") then 
{
	if!(_weapons isEqualTo [])then
	{
		{
			_object addWeaponCargoGlobal [_x select 0, 1];
			for "_i" from 1 to ((count _x) -1) do 
			{
				_thing = _x select _i;
				if !(_thing isEqualTo "") then
				{
					if ((typeName _i) isEqualTo "ARRAY") then
					{
						_object addMagazineAmmoCargo [_thing select 0, 1, _thing select 1];
					}
					else
					{
						_object addItemCargoGlobal [_thing, 1];
					};
				};
			};
		}
		forEach _weapons;
	};
};
true