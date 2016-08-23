/**
 * ExileServer_system_event_supplyBox_start
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_airportPositions","_config","_markerTime","_filteredAirportPositions","_dropAltitude","_dropRadius","_boxType","_airportPosition","_position","_marker","_box","_itemClassName","_itemCount","_i","_supplySmoke","_parachute"];
_airportPositions = call ExileClient_util_world_getAllAirportPositions;
_config = configFile >> "CfgSettings" >> "Events" >> "SupplyBox";
_markerTime = getNumber (_config >> "markerTime");
if (_airportPositions isEqualTo []) exitWith
{
	"The current map has no airports. Skipping supply box drop event." call ExileServer_util_log;
};
_filteredAirportPositions = [];
{
	if !([_x, 1000] call ExileClient_util_world_isTraderZoneInRange) then 
	{
		_filteredAirportPositions pushBack _x;
	};
}
forEach _airportPositions;
if (_filteredAirportPositions isEqualTo []) exitWith
{
	"The current map has airports, but they are too close to traders. Skipping supply box drop event." call ExileServer_util_log;
};
_config = configFile >> "CfgSettings" >> "Events" >> "SupplyBox";
_dropAltitude = getNumber (_config >> "dropAltitude");
_dropRadius = getNumber (_config >> "dropRadius");
_boxType = selectRandom (getArray (_config >> "types"));
_airportPosition = selectRandom _filteredAirportPositions;
_airportPosition set [2, 0];
_position = [_airportPosition, _dropRadius] call ExileClient_util_math_getRandomPositionInCircle;
_position set [2, _dropAltitude];
["toastRequest", ["InfoTitleAndText", ["Supply drop incoming!", "A Heart for Inmates is going to drop a supply crate in about ten minutes. Check your map for the location."]]] call ExileServer_system_network_send_broadcast;
_marker = createMarker [ format["ExileSupplyBox%1", diag_tickTime], _position];
_marker setMarkerType "ExileHeart";
uiSleep (60 * 5);
["toastRequest", ["InfoTitleAndText", ["Supply drop incoming!", "A Heart for Inmates is going to drop a supply crate in about five minutes. Check your map for the location."]]] call ExileServer_system_network_send_broadcast;
uiSleep (60 * 4);
["toastRequest", ["InfoTitleAndText", ["Supply drop incoming!", "A Heart for Inmates is going to drop a supply crate in a minute. Check your map for the location."]]] call ExileServer_system_network_send_broadcast;
uiSleep (60 * 1);
_box = createVehicle ["Exile_Container_SupplyBox", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_box setPosATL _position;
_box setDir (random 360);
clearBackpackCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
{
	_itemClassName = _x select 0;
	_itemCount = _x select 1;
	for "_i" from 1 to _itemCount do 
	{
		[_box, _itemClassName] call ExileClient_util_containerCargo_add;
	};
}
forEach (getArray (_config >> "BoxTypes" >> _boxType >> "items"));
_supplySmoke = createVehicle ["Exile_Ammo_SmokeShellOrange", getPos _box, [], 0, "CAN_COLLIDE"];
_supplySmoke attachTo [_box, [0, 0, 0.5]];
_parachute = createVehicle ["O_Parachute_02_F", getPos _box, [], 0, "FLY"];
_parachute setPosATL _position;
_parachute setDir (getDir _box);
_box attachTo [_parachute, [0, 0, -1.2]];
waitUntil { ((getPos _box) select 2) < 1.5 };
detach _supplySmoke;
detach _box;
_parachute disableCollisionWith _box;
_box disableCollisionWith _parachute;
_position = getPos _box;
_position set [2, 0];
_box setPos _position;
_box setVelocity [0, 0, 0];
uiSleep (60 * _markerTime);
deleteMarker _marker;