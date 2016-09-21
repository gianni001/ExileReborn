private ["_zombie","_firer","_timer"];

_zombie = _this select 0;
_firer = _this select 1;

if ((_zombie getVariable ["ExileReborn_zombie_hardTarget",-1]) isEqualTo -1) then
{	
	_zombie setVariable ["ExileReborn_zombie_hardTarget",1];
	_timer = 0;
	Event_IdleZombieArray = Event_IdleZombieArray - [_zombie];
	while {true} do
	{	
		if !(alive _zombie) exitWith {};
		if (((_zombie distance _firer) < 10) || (_timer > 30)) exitWith
		{
			_zombie setVariable ["ExileReborn_zombie_hardTarget",-1];
			// Fucking zombies, cmon John your better then this shit..
			/*
			if ((_zombie getVariable ["ExileReborn_hoardMember",-1]) isEqualTo -1) then
			{	
				[_zombie] spawn JohnO_fnc_zombieLogic;
			}
			else
			{
				[_zombie] spawn JohnO_fnc_hoardLogic;
			};
			*/
			Event_IdleZombieArray pushBack _zombie;
		};	
		if !(local _zombie) then {[_zombie, getposATL _firer] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"]} else {_zombie domove getposATL _firer};
		if (surfaceIsWater getposATL _firer) then {[_zombie, "AmovPercMwlkSnonWnonDf"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"]};
		_zombie dowatch _firer;

		_timer = _timer + 1;
		uiSleep 1;
	};	
};	