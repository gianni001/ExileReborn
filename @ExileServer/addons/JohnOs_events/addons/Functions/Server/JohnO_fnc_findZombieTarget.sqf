private ["_zombie","_potentialTargets_crouched","_potentialTargets_standing","_targets","_zombieTarget","_validTargets","_potentialTargets_isVehicle","_potentialTargets_prone","__validDistractions","_nearSmokes"];

_zombie = _this select 0;
_zombieTarget = [];

_validTargets =
[
	"Exile_Unit_Player",
	"O_G_Soldier_F",
	"O_recon_medic_F",
	"O_Soldier_lite_F",
	"O_Soldier_GL_F",
	"O_Soldier_A_F",
	"O_Soldier_lite_F",
	"I_G_Soldier_F"
];
/*
_validDistractions =
[
	"SmokeShell",
	"SmokeShellRed",
	"SmokeShellGreen",
	"SmokeShellYellow",
	"SmokeShellPurple",
	"SmokeShellBlue",
	"SmokeShellOrange"
];
*/
_potentialTargets_crouched = [];
_potentialTargets_standing = [];
_potentialTargets_prone = [];

_potentialTargets_isVehicle = [];

_targets = (getPos _zombie nearEntities [_validTargets,50]);
//_nearSmokes = getPos _zombie nearObjects [_validDistractions,50];

// Populate the array

if ((count _targets) > 0) then
{
	{
		
		if (((stance _x) isEqualTo "PRONE") && (_zombie distance _x < 5)) then
		{
			_potentialTargets_prone pushBack [(_zombie distance _x),_x];
		};
		if (((stance _x) isEqualTo "CROUCH") && (_zombie distance _x < 15)) then
		{
			_potentialTargets_crouched pushBack [(_zombie distance _x),_x];
		};
		if ((stance _x) isEqualTo "STAND") then
		{
			_potentialTargets_standing pushBack [(_zombie distance _x),_x];
		};	

	} forEach _targets;

	// Exampple array [[33,player entitie],[44,player entitie]]

	if !(_potentialTargets_standing isEqualTo []) then
	{
		_potentialTargets_standing sort true;
		_zombieTarget = (_potentialTargets_standing select 0) select 1;
	}
	else
	{
		if !(_potentialTargets_crouched isEqualTo []) then
		{
			_potentialTargets_crouched sort true;
			_zombieTarget = (_potentialTargets_crouched select 0) select 1;
		}
		else
		{
			if !(_potentialTargets_prone isEqualTo []) then
			{
				_zombieTarget = (_potentialTargets_prone select 0) select 1;
			}
			else
			{	
				_zombieTarget = [];
			};	
		};	
	};
}
else
{
	_targets = nearestObjects [(getPos _zombie), ["Car","Air"],50];
	if ((count _targets) > 0) then
	{
		{
			_crew = crew _x;
			if ((count _crew) > 0) then
			{	
				_potentialTargets_isVehicle pushBack [(_zombie distance _x),_x];
			};	
		} forEach _targets;

		_potentialTargets_isVehicle sort true;
		_zombieTarget = (_potentialTargets_isVehicle select 0) select 1;
	}
	else
	{
		_zombieTarget = [];
	};
};	
if (isNil "_zombieTarget") then
{
	_zombieTarget = [];
};	
_zombieTarget


