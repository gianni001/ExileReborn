private ["_isBeingHunted","_messageArray","_message","_baseChance","_level","_actualChance"];

_isBeingHunted = player getVariable ["JohnO_isBeingHunted",false];

_baseChance = 0.3; // 30%

_level = [ExileClientPlayerScore] call JohnO_fnc_getRespectTier;	// Returns a number between 0 and 5

_actualChance = _baseChance + (_level / 10); // Increase the base chance by a decimal factor of your respect level

_messageArray =
[

	"I think I am being followed...",
	"I hear someone nearby...",
	"What was that noise?...",
	"Were they soldiers I just saw?..",
	"Shit, I think they saw me.. I should hide..",
	"I thought the mafia had control of this island..",
	"I should keep moving..",
	"Maybe they are friendly?.."
];

if (_isBeingHunted) then
{
	if (_actualChance >= random 1) then
	{	
		_message =  selectRandom _messageArray;

		systemChat _message;
	};	
};	
