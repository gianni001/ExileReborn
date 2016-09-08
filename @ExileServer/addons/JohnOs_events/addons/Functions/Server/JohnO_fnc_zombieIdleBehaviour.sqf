{
	private ["_zombie","_timer","_nearPlayers","_nearPlayersCount","_unit","_huntedTimer","_lastMoan","_moanCD"];
	_zombie = _x;
	_playerFound = false;
	_MoanArray = ["ryanzombiesmoan1","ryanzombiesmoan2","ryanzombiesmoan3","ryanzombiesmoan4","ryanzombiesmoan5","ryanzombiesmoan6","ryanzombiesmoan7"];

	_stance = [];
	_nearPlayers = getPos _zombie nearEntities [['Exile_Unit_Player'],25];
	_nearPlayersCount = count _nearPlayers;
	if (time - Event_moanCD >= Event_lastMoan) then
	{	
		if (random 1 > 0.6) then 
		{
			_Moan = selectRandom _MoanArray; [_zombie, format ["%1",_Moan]] remoteExecCall ["say3d"];
		};
		Event_lastMoan = time;
	};
	if !(_nearPlayersCount < 0) then
	{	
		{
			_stance pushBack (stance _x);
			if ((_zombie distance _x > 0) && (_zombie distance _x <= 5) && ((_stance find "PRONE") isEqualTo -1)) then 
			{
				_playerFound = true;
			};
		} forEach _nearPlayers;
	};		
	_isStanding = _stance find "STAND";
	if ((_nearPlayersCount > 0) && !(_isStanding isEqualTo -1)) then 
	{
		_playerFound = true;
	};
	if (isNull _zombie) then 
	{
		Event_IdleZombieArray deleteAt _forEachIndex;
	};	
	if ((alive _zombie) && ((_zombie getVariable ["ExileReborn_zombie_hardTarget",-1]) isEqualTo -1) && (_playerFound)) then
	{	
		ryanzombiesdisablescript = nil;
		if ((_zombie getVariable ["ExileReborn_hoardMember",-1]) isEqualTo -1) then
		{	
			[_zombie] spawn JohnO_fnc_zombieLogic;
		}
		else
		{
			[_zombie] spawn JohnO_fnc_hoardLogic;
		};	
		Event_IdleZombieArray deleteAt _forEachIndex;
	};
} forEach Event_IdleZombieArray;


/*

-- old code --

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
	if !((_zombie getVariable ["ExileReborn_zombie_hardTarget",-1]) isEqualTo -1) exitWith {};	
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
	if !(_nearPlayersCount < 0) then
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

if ((alive _zombie) && ((_zombie getVariable ["ExileReborn_zombie_hardTarget",-1]) isEqualTo -1)) then
{	
	ryanzombiesdisablescript = nil;
	[_zombie] execVM "JohnOs_events\addons\functions\Server\JohnO_fnc_zombieLogic.sqf";
};
*/	