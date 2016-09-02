private ["_zombie","_timer","_nearPlayers","_nearPlayersCount","_unit","_huntedTimer","_lastMoan","_moanCD"];

_zombie = _this select 0;
_MoanArray = ["ryanzombiesmoan1","ryanzombiesmoan2","ryanzombiesmoan3","ryanzombiesmoan4","ryanzombiesmoan5","ryanzombiesmoan6","ryanzombiesmoan7"];

_timer = 0;

_lastMoan = time;
_moanCD = 15;

while {_timer < 300} do
{	
	_nearPlayers = getPos _zombie nearEntities [['Exile_Unit_Player'],15];
	_nearPlayersCount = count _nearPlayers;
	if (time - _moanCD >= _lastMoan) then
	{	
		if (random 1 > 0.6) then 
		{
			_Moan = selectRandom _MoanArray; [_zombie, format ["%1",_Moan]] remoteExecCall ["say3d"];
		};
		_lastMoan = time;
	};	
	if (_nearPlayersCount > 0) exitWith {};
	_timer = _timer + 1;
	uiSleep 1;
};

if !(_nearPlayers isEqualTo []) then
{
	_unit = _nearPlayers select 0;
	
	if !(local _zombie) then 
	{
		[_zombie, [(getposATL _unit select 0) + random 15 - random 15, (getposATL _unit select 1) + random 15 - random 15]] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"];
	} 
	else 
	{
		_zombie domove [(getposATL _unit select 0) + random 15 - random 15, (getposATL _unit select 1) + random 15 - random 15];
	};
};		

ryanzombiesdisablescript = nil;

[_zombie] execVM "JohnOs_events\addons\functions\Server\JohnO_fnc_zombieLogic.sqf";