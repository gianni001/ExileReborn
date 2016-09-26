private ["_canAdd","_types"];
{
	_types = ["#GdtBeach","#GdtBeach"];
	_action = (_x select 0) select 0;
	_condition = (_x select 0) select 3;
		
	_compile = compile _condition;
	_canAdd = call _compile;
	
	if (_canAdd) then
	{
		if (isNil ((_x select 0) select 2)) then
		{		
			_currentAction = player addAction _action;

			missionNamespace setVariable [(_x select 0) select 1,true];
			missionNamespace setVariable [(_x select 0) select 2,_currentAction];
			ExileReborn_userActionArray pushBack _currentAction;
		};	
	};
} forEach ExileReborn_userActions;


if ((time - ExileReborn_userActionTimeout_lastCheck >= ExileReborn_userActionTimeout) || !(alive player))then
{
	ExileReborn_userActionTimeout_lastCheck = time;
	if !(alive player) then
	{	
		if !((player getVariable ['hasAnimal',-1]) isEqualTo -1) then
		{	
			_animal = player getVariable ['hasAnimal',-1];
			detach _animal;
			["hideObjectGlobal", [_animal,false]] call ExileClient_system_network_send;
			player setVariable ['hasAnimal',-1];
		};
	};
	
	{
		player removeAction _x;
	} forEach ExileReborn_userActionArray;

	ExileReborn_userActionArray = [];	

	{
		missionNamespace setVariable [(_x select 0) select 1,false];
		missionNamespace setVariable [(_x select 0) select 2,nil];
	} forEach ExileReborn_userActions;
};