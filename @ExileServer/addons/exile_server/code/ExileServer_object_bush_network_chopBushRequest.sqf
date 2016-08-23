/**
 * ExileServer_object_bush_network_chopBushRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionId","_parameters","_bushNetId","_bush","_isBush","_bushModelNames","_newDamage","_weaponHolderPosition","_weaponHolder"];
_sessionId = _this select 0;
_parameters = _this select 1;
_bushNetId = _parameters select 0;
_bush = objectFromNetId _bushNetId;
if (!isNull _bush) then
{
	_isBush = false;
	_bushModelNames = getArray(missionConfigFile >> "CfgInteractionModels" >> "BushSource" >> "models");
	{
		if !(((str _bush) find _x) isEqualTo -1)exitWith {_isBush = true};
	}
	forEach _bushModelNames;
	if (_isBush) then 
	{
		if (alive _bush) then
		{
			_newDamage = ((damage _bush) + 0.1) min 1;
			_bush setDamage _newDamage; 
			if (_newDamage isEqualTo 1) then
			{
				_bush setDamage 999; 
				_weaponHolderPosition = [getPosATL _bush, 3] call ExileClient_util_math_getRandomPositionInCircle;
				_weaponHolderPosition set [2, 0];
				_weaponHolder = createVehicle ["GroundWeaponHolder", _weaponHolderPosition, [], 0, "CAN_COLLIDE"];
				_weaponHolder setPosATL _weaponHolderPosition;
				if ((random 100) < 50) then 
				{
					_weaponHolder addMagazineCargoGlobal ["Exile_Item_WoodSticks", 1];
				}
				else 
				{
					_weaponHolder addMagazineCargoGlobal ["Exile_Item_Leaves", 1];
				};
			};
		};
	};
};
true