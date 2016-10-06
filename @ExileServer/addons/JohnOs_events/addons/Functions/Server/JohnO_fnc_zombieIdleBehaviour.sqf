{
	private ["_zombie","_timer","_nearPlayers","_nearPlayersCount","_unit","_huntedTimer","_lastMoan","_moanCD","_target"];
	_zombie = _x;
	_playerFound = false;
	_MoanArray = ["ryanzombiesmoan1","ryanzombiesmoan2","ryanzombiesmoan3","ryanzombiesmoan4","ryanzombiesmoan5","ryanzombiesmoan6","ryanzombiesmoan7"];
	_target = [];
	
	if (time - Event_moanCD >= Event_lastMoan) then
	{	
		if (random 1 > 0.6) then 
		{
			_Moan = selectRandom _MoanArray; [_zombie, format ["%1",_Moan]] remoteExecCall ["say3d"];
		};
		Event_lastMoan = time;
	};
	
	_target = [_zombie] call JohnO_fnc_findZombieTarget;

	if (isNil "_target") then
	{
		_target = [];
	};	

	if ((alive _zombie) && ((_zombie getVariable ["ExileReborn_zombie_hardTarget",-1]) isEqualTo -1) && !(_target isEqualTo [])) then
	{	
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
	if (isNull _zombie) then
	{
		Event_IdleZombieArray deleteAt _forEachIndex;
	};	
} forEach Event_IdleZombieArray;