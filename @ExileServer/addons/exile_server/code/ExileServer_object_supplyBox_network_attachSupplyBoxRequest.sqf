/**
 * ExileServer_object_supplyBox_network_attachSupplyBoxRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionId","_parameters","_boxNetId","_box","_boxConfig","_vehicleTypes","_vehicles","_vehicle","_attachedObjects","_vehicleConfig","_cargoIndizes","_crew"];
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
	if !(isNull (attachedTo _box)) then 
	{
		throw "Box already mounted."; 
	};
	_boxConfig = missionConfigFile >> "CfgVehicleTransport" >> typeOf _box;
	_vehicleTypes = getArray (_boxConfig >> "vehicles");
	_vehicles = nearestObjects [_box, _vehicleTypes, 15];
	if (_vehicles isEqualTo []) then 
	{
		throw "No transport vehicle nearby."; 
	};
	_vehicle = _vehicles select 0;
	_attachedObjects = attachedObjects _vehicle;
	{
		if ((typeOf _x) isEqualTo (typeOf _box)) then 
		{
			throw "Vehicle already transports a supply box."; 
		};
	}
	forEach _attachedObjects;
	_vehicleConfig = -1;
	{
		if ((typeOf _vehicle) isKindOf _x) exitWith
		{
			_vehicleConfig = _boxConfig >> _x;
		};
	}
	forEach _vehicleTypes;
	if (_vehicleConfig isEqualTo -1) then 
	{
		throw "Broken CfgVehicleTransport :("; 
		};
	_cargoIndizes = getArray (_vehicleConfig >> "cargoIndizes");
	_crew = fullCrew _vehicle;
	{
		if ((_x select 2) in _cargoIndizes) then 
		{
			throw "Passengers are blocking cargo area." 
		};
	}
	forEach _crew;
	{
		_vehicle lockCargo [_x, true];
	}
	forEach _cargoIndizes;
	_box attachTo [_vehicle, getArray (_vehicleConfig >> "attachPosition")];
	throw "Supply box mounted!"
}
catch 
{
};