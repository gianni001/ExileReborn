/**
 * ExileClient_object_player_event_onTake
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_unit","_container","_itemClassName","_itemType","_itemTypeMainCategory"];
_unit = _this select 0;
_container = _this select 1;
_itemClassName = _this select 2;
if (ExileClientPlayerIsBambi) then
{
	_itemType = [_itemClassName] call BIS_fnc_itemType;
	_itemTypeMainCategory = _itemType select 0;
	if (_itemTypeMainCategory isEqualTo "Weapon") then
	{
		call ExileClient_object_player_bambiStateEnd;
	};
};
if (_itemClassName isEqualTo "Exile_Melee_Axe") then
{
	player addSecondaryWeaponItem "Exile_Magazine_Swing";
};
if (_itemClassName isEqualTo "Exile_Melee_SledgeHammer") then
{
	player addSecondaryWeaponItem "Exile_Magazine_Swoosh";
};
if (_itemClassName isEqualTo "Exile_Melee_Shovel") then
{
	player addSecondaryWeaponItem "Exile_Magazine_Boing";
};
if ((_container getVariable ["ExileIsLocked",1]) isEqualTo -1)then
{
	Exiled = format ["Me %1(%2) tried to open a locked storage (%3 at (%4)%5) by gltching. :( and i got cought :((",
		profileName,getPlayerUID player,typeOf _container,mapGridPosition _container,getPosATL _container];
	publicVariableServer "Exiled";
};
[_unit,_container,_itemClassName,_itemTypeMainCategory] call JohnO_fnc_checkClassClothing;
true