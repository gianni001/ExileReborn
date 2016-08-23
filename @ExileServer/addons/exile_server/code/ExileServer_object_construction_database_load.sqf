/**
 * ExileServer_object_construction_database_load
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_constructionID","_data","_position","_vectorDirection","_vectorUp","_constructionObject","_damageLevel","_public","_pinCode"];
_constructionID = _this;
_data = format ["loadConstruction:%1", _constructionID] call ExileServer_system_database_query_selectSingle;
_position = [_data select 4, _data select 5, _data select 6];
_vectorDirection = [_data select 7, _data select 8, _data select 9];
_vectorUp = [_data select 10, _data select 11, _data select 12];
_constructionObject = createVehicle [(_data select 1), _position, [], 0, "CAN_COLLIDE"];
_constructionObject setPosATL _position;
_constructionObject setVectorDirAndUp [_vectorDirection, _vectorUp];
_constructionObject setVariable ["ExileDatabaseID", _data select 0];
_constructionObject setVariable ["ExileOwnerUID", (_data select 2)];
_constructionObject setVariable ["ExileIsPersistent", true];
_constructionObject setVariable ["ExileTerritoryID", (_data select 15)];
_damageLevel = (_data select 17);
_public = _damageLevel > 0;
_constructionObject setVariable ["ExileConstructionDamage",_damageLevel,_public];
if(_public)then
{
	_constructionObject call ExileServer_util_setDamageTexture;
};
_pinCode = _data select 14;
if !(_pinCode isEqualTo "000000") then
{
	_constructionObject setVariable ["ExileAccessCode", _pinCode];
	_constructionObject setVariable ["ExileIsLocked", (_data select 13), true];
};
if (getNumber(configFile >> "CfgVehicles" >> (_data select 1) >> "exileRequiresSimulation") isEqualTo 1) then
{
	_constructionObject enableSimulationGlobal true;
	_constructionObject call ExileServer_system_simulationMonitor_addVehicle;
}
else 
{
	_constructionObject enableSimulationGlobal false;
};
_constructionObject setVelocity [0, 0, 0];
_constructionObject setPosATL _position;
_constructionObject setVelocity [0, 0, 0];
_constructionObject setVectorDirAndUp [_vectorDirection, _vectorUp];
_constructionObject setVelocity [0, 0, 0];
_constructionObject
