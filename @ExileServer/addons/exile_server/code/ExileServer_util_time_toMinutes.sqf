/**
 * ExileServer_util_time_toMinutes
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_time","_timeMinutes"];
_time = _this;
_timeMinutes = 0;
{
	switch (_forEachIndex) do
	{
		case 0 : { _timeMinutes = _timeMinutes + (_x * 525600);};
		case 1 : { _timeMinutes = _timeMinutes + (_x * 43829);};
		case 2 : { _timeMinutes = _timeMinutes + (_x * 1440);};
		case 3 : { _timeMinutes = _timeMinutes + (_x * 60);};
		default  { _timeMinutes = _timeMinutes + _x;};
	};
} 
forEach _time;
_timeMinutes