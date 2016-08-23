/**
 * ExileServer_object_concreteMixer_mixingProcess
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_concreteMixer","_recipeClassName","_weaponHolderPosition","_weaponHolder"];
_concreteMixer = _this select 0;
_recipeClassName = _this select 1;
playSound3D ["exile_assets\sound\Exile_ConcreteMixer01.wss", _concreteMixer, false, getPosASL _concreteMixer, 4, 1, 50];
_concreteMixer setVariable ["IsMixing", true];
_concreteMixer animateSource ["SpinSource", 0, true];
_concreteMixer animateSource ["SpinSource", 1, false];
uiSleep 5;
["concreteMixerAddSmokeRequest", [netId _concreteMixer]] call ExileServer_system_network_send_broadcast;
uisleep 50;
["concreteMixerRemoveSmokeRequest", [netId _concreteMixer]] call ExileServer_system_network_send_broadcast;
uiSleep 5;
_weaponHolderPosition = _concreteMixer modelToWorld [1, 0, 0];
_weaponHolderPosition set [2, 0];
_weaponHolder = createVehicle ["GroundWeaponHolder", _weaponHolderPosition, [], 0, "CAN_COLLIDE"];
_weaponHolder setPosATL _weaponHolderPosition;
{
	_weaponHolder addMagazineCargoGlobal [_x select 1, _x select 0];
}
forEach getArray (missionConfigFile >> "CfgCraftingRecipes" >> _recipeClassName >> "returnedItems");
_concreteMixer setVariable ["IsMixing", false];
