/**
 * ExileServer_system_weather_initialize
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_useRealTime","_useStaticTime","_staticTime","_changetime"];
call ExileServer_system_weather_thread_weatherSimulation;
_useRealTime = getNumber (configFile >> "CfgSettings" >> "Time" >> "useRealTime");
_useStaticTime = getNumber (configFile >> "CfgSettings" >> "Time" >> "useStaticTime");
_staticTime = getArray (configFile >> "CfgSettings" >> "Time" >> "staticTime");
if(_useStaticTime isEqualTo 1)then
{
	setDate _staticTime;
}
else
{
	if(_useRealTime isEqualTo 1)then
	{
		setDate ExileServerStartTime;
	};
};
forceWeatherChange;
_changetime = round(getNumber (configFile >> "CfgSettings" >> "Weather" >> "interval") * 60);
[_changetime, ExileServer_system_weather_thread_weatherSimulation, [], true] call ExileServer_system_thread_addTask;
true