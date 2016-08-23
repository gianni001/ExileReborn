uiSleep 30; //Wait enough time for the Exile pri init to finish.

private ["_RespectLevel","_adjustment"];

_RespectLevel = [ExileClientPlayerScore] call JohnO_fnc_getRespectTier;

/*

	Get a time in minutes, based on the respect level returned to add to the players hugner / thirst deterioation factor -

	Level 1 = 10 minutes
	Level 2 = 20 minutes
	Level 3 = 30 minutes
	Level 4 = 40 minutes
	Level 5 = 50 minutes

*/

_adjustment = (_RespectLevel * 10) * 60;


/*

	Apply the adjustments

*/

ExileClientHungerDecay = ExileClientHungerDecay + _adjustment;
ExileClientThirstDecay = ExileClientThirstDecay + _adjustment;

