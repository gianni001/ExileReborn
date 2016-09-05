private ["_zombie","_timer","_nearPlayers","_nearPlayersCount","_unit","_huntedTimer","_lastMoan","_moanCD"];

_zombie = _this select 0;
_MoanArray = ["ryanzombiesmoan1","ryanzombiesmoan2","ryanzombiesmoan3","ryanzombiesmoan4","ryanzombiesmoan5","ryanzombiesmoan6","ryanzombiesmoan7"];

//_timer = 0;

_lastMoan = time;
_moanCD = 15;
_playerFound = false;

while {!_playerFound} do
{	
	if !(alive _zombie) exitWith {};
	_stance = [];
	_nearPlayers = getPos _zombie nearEntities [['Exile_Unit_Player'],25];
	_nearPlayersCount = count _nearPlayers;
	if (time - _moanCD >= _lastMoan) then
	{	
		if (random 1 > 0.6) then 
		{
			_Moan = selectRandom _MoanArray; [_zombie, format ["%1",_Moan]] remoteExecCall ["say3d"];
		};
		_lastMoan = time;
	};
	if !(_nearPlayersCount isEqualTo 0) then
	{	
		{
			_stance pushBack (stance _x);
			if ((_zombie distance _x > 0) && (_zombie distance _x <= 5) && ((_stance find "PRONE") isEqualTo -1)) then {_playerFound = true;};
		} forEach _nearPlayers;
	};		
	_isStanding = _stance find "STAND";
	if ((_nearPlayersCount > 0) && !(_isStanding isEqualTo -1)) then {_playerFound = true;};
	
	uiSleep 2;
};	

if (alive _zombie) then
{	
	ryanzombiesdisablescript = nil;
	[_zombie] execVM "JohnOs_events\addons\functions\Server\JohnO_fnc_zombieLogic.sqf";
};	