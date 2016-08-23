/**
 * ExileServer_util_fill_fillItems
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_object","_items"];
_object = _this select 0;
_items = _this select 1;
if ((typeName _items) isEqualTo "ARRAY") then 
{
	if!(_items isEqualTo [[],[]])then
	{
		{
			_object addItemCargoGlobal [_x ,((_items select 1) select _forEachIndex)];
		}
		forEach (_items select 0);
	};
};
true
