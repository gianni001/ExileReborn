private ["_level","_additionalIncome","_decayPercent","_nameTag"];

_level = [ExileClientPlayerScore] call JohnO_fnc_getRespectTier;

_additionalIncome = round (ExileClientPlayerScore * 0.002);

_decayPercent = 0;
_nameTag = "";

switch (_level) do
{
	case 0:
	{
		_decayPercent = 0;
		_nameTag = "Lacky";
	};

	case 1:
	{
		_decayPercent = 8;
		_nameTag = "Associate";
	};

	case 2:
	{
		_decayPercent = 16;
		_nameTag = "Soldier";
	};

	case 3:
	{
		_decayPercent = 25;
		_nameTag = "Capo";
	};

	case 4:
	{
		_decayPercent = 33;
		_nameTag = "Underboss";
	};

	case 5:
	{
		_decayPercent = 41;
		_nameTag = "Boss";
	};
};

["InfoTitleAndText", 

	["Respect Info", 
		format 
		[
		"
		Your respect tier is [<t color='#ff0000'>%1</t>]
		<br />
		<t>&#160;</t>
		<br />
		You will generate an additional [<t color='#ff0000'>$%2</t>] income from wages 
		<br />
		<t>&#160;</t>
		<br />
		Your self healing rate is increased by [<t color='#ff0000'>%3 hp</t>] per minute 
		<br />
		<t>&#160;</t>
		<br />
		Your Hunger and Thirst will deterioate slower, by a factor of [<t color='#ff0000'>%4 %5</t>]
		",
		_nameTag, 
		_additionalIncome, 
		_level, 
		_decayPercent,
		"%"
		]
	]
] call ExileClient_gui_toaster_addTemplateToast;