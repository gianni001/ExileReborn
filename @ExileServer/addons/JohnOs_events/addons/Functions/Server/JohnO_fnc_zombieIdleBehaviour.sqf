private ["_zombie","_timer","_nearPlayers","_nearPlayersCount","_unit","_huntedTimer"];

_zombie = _this select 0;

_timer = 0;

while {_timer < 300} do
{	
	_nearPlayers = getPos _zombie nearEntities [['Exile_Unit_Player'],50];
	_nearPlayersCount = count _nearPlayers;

	if (_nearPlayersCount > 0) exitWith {};
	_timer = _timer + 1;
	uiSleep 1;
};

if !(_nearPlayers isEqualTo []) then
{
	_unit = _nearPlayers select 0;
	
	_huntedTimer = 0;

	while {_huntedTimer < 30} do
	{	
		if !(local _zombie) then 
		{
			[_zombie, [(getposATL _unit select 0) + random 15 - random 15, (getposATL _unit select 1) + random 15 - random 15]] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"];
		} 
		else 
		{
			_zombie domove [(getposATL _unit select 0) + random 15 - random 15, (getposATL _unit select 1) + random 15 - random 15];
		};
		_huntedTimer = _huntedTimer + 1;
		uiSleep 2;
	};
};		

ryanzombiesdisablescript = nil;

[_zombie] execVM "JohnOs_events\addons\functions\Server\JohnO_fnc_zombieLogic.sqf";