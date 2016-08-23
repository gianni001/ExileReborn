/**
 * ExileServer_object_container_createContainer
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_className","_position","_direction","_containerObject"];
_className = _this select 0;
_position = _this select 1;
_direction = _this select 2;
_containerObject = createVehicle [_className, _position, [], 0, "CAN_COLLIDE"];
clearBackpackCargoGlobal _containerObject;
clearItemCargoGlobal _containerObject;
clearMagazineCargoGlobal _containerObject;
clearWeaponCargoGlobal _containerObject;
_containerObject setDir _direction;		
_containerObject setPosATL _position;
_containerObject setVariable ["ExileIsPersistent", true];
_containerObject setVariable ["ExileIsContainer", true];
if(getNumber(configFile >> "CfgVehicles" >> typeOf _containerObject >> "exileIsLockable") isEqualTo 1)then
{
	_containerObject setVariable ["ExileIsLocked", -1,true];
};
_containerObject call ExileServer_system_simulationMonitor_addVehicle;
_containerObject