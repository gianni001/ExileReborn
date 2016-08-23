/**
 * ExileServer_util_time_toArma
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_minutes","_year","_leftOverMinutes","_month","_day","_hour"];
_minutes = _this;
_year = floor (_minutes / 525600);
_leftOverMinutes = _minutes - (_year * 525600);
_month = floor (_leftOverMinutes / 43829);
_leftOverMinutes = _leftOverMinutes - (_month * 43829);
_day = floor (_leftOverMinutes / 1440);
_leftOverMinutes = _leftOverMinutes - (_day * 1440);
_hour = floor (_leftOverMinutes / 60);
[_year,_month,_day,_hour,_leftOverMinutes - (_hour * 60)]
