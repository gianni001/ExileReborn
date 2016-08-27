/**
 * ExileServer_system_event_ambientFlyOver_start
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_targetPlayer","_flyHeight","_speed","_direction","_targetPosition","_distance","_endPosition","_planeClass","_i","_startPosition","_pilot","_plane","_waypoint"];
_group = createGroup independent;
_targetPlayer = selectRandom allPlayers;
format ["Ambient Fly Over - Heading to %1...", _targetPlayer] call ExileServer_util_log;
_flyHeight = 125;
_speed = 250;
_direction = random 360;
_targetPosition = 
[
	(getPos _targetPlayer) select 0, 
	(getPos _targetPlayer) select 1, 
	_flyHeight
];
_distance = worldSize * 0.75;
_endPosition = 
[
	(_targetPosition select 0) - (sin _direction) * _distance,
	(_targetPosition select 1) - (cos _direction) * _distance,
	_flyHeight
];
_planeClass = selectRandom 
[
	"B_Plane_CAS_01_F",
	"O_Plane_CAS_02_F",
	"I_Plane_Fighter_03_CAS_F"
];
for "_i" from 1 to (1 + (floor (random 3))) do 
{
	_distance = 4000 + (_i * 400);
	_startPosition = 
	[
		(_targetPosition select 0) + (sin _direction) * _distance,
		(_targetPosition select 1) + (cos _direction) * _distance,
		800 
	];
	_pilot = _group createUnit ["I_helicrew_F", _startPosition, [], 100, "PRIVATE"];
	_pilot setSkill 1;
	[_pilot] joinSilent _group;
	_plane = createVehicle [_planeClass, _startPosition, [], 100, "FLY"];
	clearBackpackCargoGlobal _plane;
	clearWeaponCargoGlobal _plane;
	clearMagazineCargoGlobal _plane;
	clearItemCargoGlobal _plane;
	_plane setVehicleAmmo 0;
	_plane setFuel 0.1;
	_pilot assignAsDriver _plane;
	_pilot moveInDriver _plane;
	_pilot allowDamage false;
	_plane allowDamage false;
	_plane flyInHeight _flyHeight;
	_plane disableAI "TARGET";
	_plane disableAI "AUTOTARGET";
	_plane setDir _direction;
	_plane setVelocity [(sin _direction) * _speed, (cos _direction) * _speed, 0];
};
_group allowFleeing 0;
_group setBehaviour "CARELESS";
_group setSpeedMode "FULL";
_group setFormation "WEDGE";
_group setCombatMode "BLUE";
_waypoint = _group addWaypoint [getPos _targetPlayer, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 800;
_waypoint setWaypointStatements ["true", "'Ambient Fly Over - Reached player...' call ExileServer_util_log;"];
_waypoint = _group addWaypoint [_endPosition, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 800;
_waypoint setWaypointStatements ["true", "'Ambient Fly Over - Reached end...' call ExileServer_util_log; { deleteVehicle (vehicle _x); deleteVehicle _x; } forEach thisList;"];