private ["_zombie","_potentialTargets_crouched","_potentialTargets_standing","_targets","_zombieTarget","_validTargets"];

_zombie = _this select 0;

_validTargets =
[
	"Exile_Unit_Player",
	"O_G_Soldier_F",
	"O_recon_medic_F",
	"O_Soldier_lite_F",
	"O_Soldier_GL_F",
	"O_Soldier_A_F",
	"O_Soldier_lite_F"
];

_potentialTargets_crouched = [];
_potentialTargets_standing = [];

//_targets = (getPos _zombie nearEntities [['Exile_Unit_Player'],50]);
_targets = (getPos _zombie nearEntities [_validTargets,50]);

// Populate the array

{
	if ((count _targets) > 0) then
	{	
		if !((stance _x) isEqualTo "PRONE") then
		{	
			if ((stance _x) isEqualTo "CROUCH") then
			{
				_potentialTargets_crouched pushBack [(_zombie distance _x),_x];
			};
			if ((stance _x) isEqualTo "STAND") then
			{
				_potentialTargets_standing pushBack [(_zombie distance _x),_x];
			};	
		};
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
		_zombieTarget = [];
	};	
};

_zombieTarget


