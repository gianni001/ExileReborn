/*

	When we spawned the script, we brought in some variables --
	[_supplyVehicle,_airCraftPosition,_airCraftLead] spawn JohnO_fnc_supplyDropObject;

	Below, we will select the variables from the array, for use within this script

*/

private ["_supply","_position","_aircraft","_group","_dropPos"];

_supply = _this select 0;																				// This is the class name of the supply vehicle
_position = _this select 1;																				// The relative position of the supply aircraft
_aircraft = _this select 2;																				// This supply aircraft it self
_group = _this select 3;

sleep 0.5;

_chuteType = "B_Parachute_02_F";   																		// Assign the parachute class name to a variable
_chute = createVehicle [_chuteType, [100, 100, 200], [], 0, 'FLY'];										// Create the parachute, somewhere in outer space
_chute setPos _position;																				// Set the chutes position to the relative position of the aircraft
_drop = createVehicle [_supply, [0,0,0], [], 0, 'NONE'];
_drop allowDamage false;
_drop setVariable ["ExileIsPersistent", false];
_drop setPosATL _position;

_drop attachTo [_chute, [0, 0, -0.2]];																	// Attach the supply vehicle to the parachute

_drop disableTIEquipment true;
_drop lock 2;

/*
	Clear the cargo contents of the supply vehicle
*/

clearWeaponCargoGlobal _drop;
clearItemCargoGlobal _drop;
clearMagazineCargoGlobal _drop;

/*
	Populate the contents of the vehicle
*/

for "_i" from 0 to Event_SupplyDrop_MinLootAmount + floor (random Event_SupplyDrop_MaxLootAmount) do 		// We want to run this code 1 time + another random times between 0 and 3 this will give us a varied amount of items
{
	_item = [2] call JohnO_fnc_getRandomItems_new;

	[_drop, _item] call ExileClient_util_containerCargo_add;

	_magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");
	_drop addMagazineCargoGlobal [(_magazines select 0), 1 + floor (random 3)];

	if (random 1 > 0.5) then
	{
		_item = [3] call JohnO_fnc_getRandomItems_new;
		[_drop, _item] call ExileClient_util_containerCargo_add;
	};
	if (random 1 > 0.4) then
	{
		_item = [4] call JohnO_fnc_getRandomItems_new;
		[_drop, _item] call ExileClient_util_containerCargo_add;
	};

};

diag_log format ["[EVENT: SupplyDrop] -- Supply drop event has spawned its cargo and populated loot"];

_smoke = "SmokeShellRed" createVehicle position _drop; 														// Attach a smoke grenade to the vehicle while its falling
_smoke attachto [_drop,[0,0,0]];

waitUntil
{
	position _drop select 2 < 35 || isNull _chute
};

uiSleep 12;
																											// Wait until the vehicle is on the ground before proceeeding
detach _drop;                      																			// Detatch the vehicle from the chute
_drop setPos [position _drop select 0, position _drop select 1, 0]; 										// Fail safe to set the vehicle position correctly

_drop setDamage 0;
_drop allowDamage true;																						// Ensure the vehicle is at 100% health
_drop lock 0;

sleep 2;

_wheels = ["HitLF2Wheel","HitLFWheel","HitRFWheel","HitRF2Wheel"];											// Randomly damage wheels on the vehicle
{
	if (random 1 > 0.3) then
	{
		_drop setHitPointDamage [_x,1];
	};

} forEach _wheels;

_smoke = "SmokeShellRed" createVehicle position _drop; 														// Create another smoke on the vehicle
_smoke attachto [_drop,[0,0,0]];

_markerPos = getPos _drop;

_marker = createMarker [ format["Supply%1", diag_tickTime], _markerPos];
_marker setMarkerType Event_SupplyDrop_MarkerType;
_marker setMarkerText Event_SupplyDrop_MarkerText;

_dropPos = getPos _drop;
_debug = [6550.84,6270.12,0];
_safeToDebug = _dropPos distance _debug;

if (_safeToDebug > 1000) then
{	
	if (random 1 > 0.3) then
	{
		[
			_DropPos, 	//Position of AI
			1, 			//Amount of AI groups
			2,			//Minimum AI per group
			4,			//Max AI per group
			35,			//Patrol Radius
			true,		//Add to sim manager
			true,		//Add to cleanup manager
			1440		//Clean up duration
		] call JohnO_fnc_spawnAIGroup;
	};
};	

Event_Cleanup_objectArray pushBack [_marker,time + Event_SupplyDrop_MarkerDuration,true];

SupplyDropEvent_active = false;

diag_log format ["[EVENT: SupplyDrop] -- Supply drop event has finished -- Spawning another event in 60 seconds"];

uiSleep 60;

[] execVM "JohnOs_events\addons\Events\supplyDrop\JohnO_fnc_supplyDrop.sqf";

if !(Event_SupplyDrop_DebugEvent) then
{
	uiSleep 360;
}
else
{
	uiSleep 10;
};

_aircraft setFuel 0; 																						// Set fuel 0 on the aircraft
_aircraft setDamage 1; 																						// Destroy the aircraft

{
    _aircraft deleteVehicleCrew _x
} forEach crew _aircraft;



