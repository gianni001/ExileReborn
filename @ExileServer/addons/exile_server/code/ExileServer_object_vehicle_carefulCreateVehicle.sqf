/**
 * ExileServer_object_vehicle_carefulCreateVehicle
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicleClassName","_position","_direction","_usePositionATL","_temporaryPositionInOuterSpace","_vehicleObject"];
_vehicleClassName = _this select 0;
_position = _this select 1;
_direction = _this select 2;
_usePositionATL = _this select 3;
_temporaryPositionInOuterSpace = 
[
	(_position select 0) - 250 + (random 500),
	(_position select 1) - 250 + (random 500),
	1000 + (random 1000)
];
_vehicleObject = createVehicle [_vehicleClassName, _temporaryPositionInOuterSpace, [], 0, "CAN_COLLIDE"];
_vehicleObject allowDamage false;
_vehicleObject removeAllEventHandlers "HandleDamage";
_vehicleObject addEventHandler["HandleDamage", {false}];
_vehicleObject setVelocity [0, 0, 0];
if ((typeName _direction) isEqualTo "ARRAY") then 
{
	_vehicleObject setVectorDirAndUp _direction;
}
else 
{
	_vehicleObject setDir _direction;
};
if (_usePositionATL) then
{
	_vehicleObject setPosATL _position;
}
else 
{
	_vehicleObject setPosASL _position;
};
_vehicleObject setVelocity [0, 0, 0];
_vehicleObject allowDamage true;
_vehicleObject removeAllEventHandlers "HandleDamage";
_vehicleObject setDamage 0;
clearBackpackCargoGlobal _vehicleObject;
clearItemCargoGlobal _vehicleObject;
clearMagazineCargoGlobal _vehicleObject;
clearWeaponCargoGlobal _vehicleObject;
if (_vehicleClassName isKindOf "I_UGV_01_F") then 
{
	createVehicleCrew _vehicleObject;
};
if (getNumber (configFile >> "CfgSettings" >> "VehicleSpawn" >> "nightVision") isEqualTo 0) then 
{
	_vehicleObject disableNVGEquipment true;
};
if (getNumber (configFile >> "CfgSettings" >> "VehicleSpawn" >> "thermalVision") isEqualTo 0) then 
{
	_vehicleObject disableTIEquipment true;
};
_vehicleObject