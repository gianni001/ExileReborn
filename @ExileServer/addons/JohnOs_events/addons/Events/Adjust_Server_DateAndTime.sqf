/*

	One day will consist of 4 server sessions -
	4am - 8am
	8am - 12pm
	12pm - 4pm
	4pm - 8pm

*/

private ["_lastSessionDateAndTime","_newYear","_newMonth","_newDay","_newTime","_newMinute","_currentSessionDateAndTime"];

uiSleep 45;

_lastSessionDateAndTime = profileNamespace getVariable "NZEC_DateAndTime";

if (isNil "_lastSessionDateAndTime") then
{
	profileNamespace setVariable ["NZEC_DateAndTime",date];
	saveProfileNamespace;

	_lastSessionDateAndTime = date;
};	

format ["[Last Session Date and Time] Retrieved last session date and time :: %1",_lastSessionDateAndTime] call ExileServer_util_log;

_newYear = _lastSessionDateAndTime select 0;
_newMonth = _lastSessionDateAndTime select 1;
_newDay = _lastSessionDateAndTime select 2;
_newTime = (_lastSessionDateAndTime select 3) + 4;
_newMinute = _lastSessionDateAndTime select 4;

if (_newTime > 16) then
{
	_newTime = 4;
	_newDay = _newDay + 1;
};	

if (_newDay > 30) then
{
	_newDay = 1;
	_newMonth = _newMonth + 1;

	if (_newMonth > 12) then
	{
		_newMonth = 01;
		_newYear = _newYear + 1;
	};	
};

_currentSessionDateAndTime = [_newYear,_newMonth,_newDay,_newTime,0];

setDate _currentSessionDateAndTime;
forceWeatherChange;

profileNamespace setVariable ["NZEC_DateAndTime",_currentSessionDateAndTime];
saveProfileNamespace;
	
format ["[Current Session Date and Time] Set current session date and time :: %1",_currentSessionDateAndTime] call ExileServer_util_log;

