private ["_deathTimer"];

_deathTimer = 120;

while {true} do
{
	_deathTimer = _deathTimer - 1;

	[10] call BIS_fnc_bloodEffect;

	if (_deathTimer <= 0) exitWith 
	{
		player allowDamage true;
		player setUnconscious false;
		player setDamage 1;
		player setVariable ["ExileReborn_player_isUnconcious",false,true];
	};

	if (player getVariable ["ExileReborn_player_isUnconcious",false] isEqualTo false) exitWith
	{
		player setUnconscious false;
		player allowDamage true;
	};

	titleText [format["Bleeding out... - %1",_deathTimer],"PLAIN"];

	uiSleep 1;	
};	