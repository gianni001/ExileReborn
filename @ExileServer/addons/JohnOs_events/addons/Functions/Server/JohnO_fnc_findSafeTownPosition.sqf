private ["_position","_validPos","_debug"];

_validPos = false;
_debug = Event_DEBUG_Location;

while {!_validPos} do
{
	_position = selectRandom Event_RoamingAI_SpawnLocations;

	if (!(_position isEqualTo Event_RoamingAI_lastTown) && !([_position, 800] call ExileClient_util_world_isTraderZoneInRange) && (_position distance _debug > 600)) then
	{
		_validPos = true;
	};	
	uiSleep 0.01;
};	

if (surfaceIsWater _position) then 
{	
	_safePosFound = false;
	
	waitUntil 
	{
		_position = [_position,150] call ExileClient_util_math_getRandomPositionInCircle;

		if !(surfaceIsWater _position) then
		{
			_safePosFound = true;
		};	
		_safePosFound
	};
};

_position