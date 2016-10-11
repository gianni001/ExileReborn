private ["_allAIUnits","_countAIunits"];

_allAIUnits = [];
{
	if (!(isPlayer _x) && (alive _x) && ((_x getVariable ["ExileReborn_AI_isZombie",false]) isEqualTo false)) then
	{
		_allAIUnits pushBack _x;
	};	
} forEach allUnits;

_countAIunits = count _allAIUnits;

_countAIunits