private ["_month","_seasonDetail","_tempAdjust"];

_month = _this select 0;

_tempAdjust = 0;

if ((_month >= 1) && (_month <= 3)) then {_month = 1;};
if ((_month > 3) && (_month <= 6)) then {_month = 2;};
if ((_month > 6) && (_month <= 9)) then {_month = 3;};
if ((_month > 9) && (_month <= 12)) then {_month = 4;};

switch (_month) do
{
	case 1:
	{
		_tempAdjust = 0;
		_season = "Winter";

		_seasonDetail = [_tempAdjust,_season];
	};
	case 2:
	{
		_tempAdjust = 5;
		_season = "Fall";

		_seasonDetail = [_tempAdjust,_season];
	};
	case 3:
	{
		_tempAdjust = 20;
		_season = "Spring";

		_seasonDetail = [_tempAdjust,_season];
	};
	case 4:
	{
		_tempAdjust = 25;
		_season = "Summer";

		_seasonDetail = [_tempAdjust,_season];
	};
};

_seasonDetail