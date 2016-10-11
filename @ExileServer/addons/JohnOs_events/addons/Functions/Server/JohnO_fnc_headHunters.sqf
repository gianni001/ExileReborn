private ["_hunters","_target","_hunterLeader","_timer","_wp","_marker"];

_hunters 			= _this select 0;
_target 			= _this select 1;

_target setVariable ["JohnO_isBeingHunted",true,true];

_hunterLeader = leader _hunters;
HuntingPartyWayPoint = false;
_timer = 0;

_wp = _hunters addWaypoint [getPos _target, 0];															
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointSpeed "FULL";
_wp setWaypointStatements ["HuntingPartyWayPoint", ""];

while {true} do
{
	if ((count units _hunters) <= 0) exitWith 
	{
		"Hunters have been killed exiting script" call ExileServer_util_log;
	};
	if (!(alive _target) || (_timer >= Event_RoamingAI_despawnTime)) exitWith
	{
		
		format["[Hunters] The target has been killed or timer has been reached, exiting script with remaining units on patrol | Timer %1 |",_timer] call ExileServer_util_log;

		HuntingPartyWayPoint = true;
		_target setVariable ["JohnO_isBeingHunted",false,true];
		if ((count units _hunters) > 0) then
		{
			_units = units _hunters;
			_randomUnit = selectRandom _units;
			_pos = getPos _randomUnit;
			[_hunters, _pos,10000] call JohnO_fnc_taskPatrol;
		};	
	};

	_targetPos = position _target;
	_wp setWaypointPosition [_targetPos,50];

	uiSleep 10;
	_timer = _timer + 10;
};	

