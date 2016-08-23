/**
 * ExileServer_object_supplyBox_network_detachSupplyBoxRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionId","_parameters","_boxNetId","_box","_vehicle","_boxConfig","_vehicleConfig","_modelSpacePosition","_worldSpacePosition"];
_sessionId = _this select 0;
_parameters = _this select 1;
_boxNetId = _parameters select 0;
try 
{
	_box = objectFromNetId _boxNetId;
	if (isNull _box) then
	{
		throw "Invalid box."; 
	};
	_vehicle = attachedTo _box;
	if (isNull _vehicle) then
	{
		throw "Box not mounted."; 
	};
	_boxConfig = missionConfigFile >> "CfgVehicleTransport" >> typeOf _box;
	_vehicleConfig = -1;
	{
		if (_vehicle isKindOf _x) exitWith
		{
			_vehicleConfig = _boxConfig >> _x;
		};
	}
	forEach getArray (_boxConfig >> "vehicles");
	_modelSpacePosition = getArray (_vehicleConfig >> "detachPosition");
	_modelSpacePosition pushBack 0; 
	_worldSpacePosition = _vehicle modelToWorld _modelSpacePosition;
	_worldSpacePosition set [2, 0];
	detach _box;
	_box setPosATL _worldSpacePosition;
	_box setVelocity [0, 0, 0];
	throw "Crate unmounted!";
}
catch 
{
};