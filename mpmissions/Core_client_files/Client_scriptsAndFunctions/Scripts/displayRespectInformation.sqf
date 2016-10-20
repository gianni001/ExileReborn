private ["_text","_introText","_introTextToDisplay1","_introTextToDisplay2","_introTextToDisplay3","_worldName","_season","_seasonInfo"];

waitUntil{!isNull (findDisplay 46)}; 

uiSleep 15;

_level = [ExileClientPlayerScore] call JohnO_fnc_getRespectTier;
_seasonInfo = [(date select 1)] call JohnO_fnc_getCurrentSeason;
_season = (_seasonInfo select 1);

[parseText format["<t size='0.6'font='OrbitronLight' color='#ffffff'>Welcome %1</t><br/><t size='0.6'font='OrbitronLight' color='#908EAA'>Your respect level is %2</t><br/><t size='0.5'font='OrbitronLight' color='#ffffff'>The more respect you have, the higher your wage income, the stronger your character</t>",name player,_level],0,1,10,0] spawn bis_fnc_dynamictext;

uiSleep 15;

[parseText format["<t size='0.6'font='OrbitronLight' color='#908EAA'>(Press number 7 to display respect information)</t><br/><t size='0.6'font='OrbitronLight' color='#ffffff'>A higher level of respect will also increase other character abilities, such as the speed at which you self heal over time</t><br/>"],0,1,10,0] spawn bis_fnc_dynamictext;

uiSleep 10;

_text = format ["%1/%2/%3 - %4",date select 0, date select 1, date select 2,[daytime] call BIS_fnc_timeToString];
_worldName = "";
switch (toLower worldName) do
{
	case "altis":
	{
		_worldName = "ALTIS";
	};
	case "esseker":
	{
		_worldName = "ESSEKER";
	};
	case "tanoa":
	{
		_worldName = "TANOA";
	};
	case "namalsk":
	{
		_worldName = "NAMALSK";
	};
};

[
	[
		[_worldName,"<t align = 'center' shadow = '1' size = '1' font='PuristaBold'>%1</t><br/>", 20], 
		[_text, "<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>",20], 
		[_season, "<t align = 'center' shadow = '1' size = '1.0'>%1</t>",20]
	] , 0, 0.5, "<t align = 'center' shadow = '1' size = '1.0'>%1</t>"
] spawn BIS_fnc_typeText;


uiSleep 20;

_introText = profileNamespace getVariable "NZEC_PlayerShownIntroText";

if (isNil "_introText") then
{
	profileNamespace setVariable ["NZEC_PlayerShownIntroText",false];
	saveProfileNamespace;
	uiSleep 0.5;
	_introText = profileNamespace getVariable "NZEC_PlayerShownIntroText";
};	

if !(_introText) then
{
	_introTextToDisplay1 = format ["Exiled, abandoned..%1 welcome to your EXILE.",name player];
	_introTextToDisplay2 = format ["These messages will only appear once, so please take the time to read. You are playing in a persistant world. The date, time and weather will persist through server restarts, the current season is winter"];
	_introTextToDisplay3 = format ["Your character will obtain soft skills by earning respect, press number 7 at any time to see your soft skills -- Shortly an info page will open for you to view - Press escape to close it"];

	[
		[
			[_introTextToDisplay1, "<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>",50]
		], 0, 0.3, "<t align = 'left' shadow = '1' size = '1.0'>%1</t>"
	] spawn BIS_fnc_typeText;

	uiSleep 30;

	[
		[
			[_introTextToDisplay2, "<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>",50]
		], 0, 0.3, "<t align = 'left' shadow = '1' size = '1.0'>%1</t>"
	] spawn BIS_fnc_typeText;

	uiSleep 30;

	[
		[
			[_introTextToDisplay3, "<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>",50]
		], 0, 0.3, "<t align = 'left' shadow = '1' size = '1.0'>%1</t>"
	] spawn BIS_fnc_typeText;

	uiSleep 30;

	profileNamespace setVariable ["NZEC_PlayerShownIntroText",true];
	saveProfileNamespace;
};	

systemChat format ["Client loaded - EXILE REBORN -- v %1",ExileRebornVersion];

uiSleep 30;

[] call JohnO_fnc_updateAndAddQuests;