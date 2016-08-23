/**
 * ExileServer_system_event_thread_spawn
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_events","_eventKey","_config","_minTime","_maxTime","_randomTime","_lastExecutedAt","_minimumPlayersOnline","_type","_function","_functionCode"];
_events = getArray (configFile >> "CfgSettings" >> "Events" >> "enabledEvents");
{
	_eventKey = format ["ExileServerEvent%1LastExecutedAt", _x];
	_config = configFile >> "CfgSettings" >> "Events" >> _x;
	_minTime = getNumber (_config >> "minTime") * 60;
	_maxTime = getNumber (_config >> "maxTime") * 60;
	_randomTime = (_minTime max (random _maxTime));
	_lastExecutedAt = missionNamespace getVariable [_eventKey, 0];
	if (time - _lastExecutedAt >= _randomTime) then
	{
		_minimumPlayersOnline = getNumber (_config >> "minimumPlayersOnline");
		if ((count allPlayers) >= _minimumPlayersOnline) then 
		{
			_type = getText (_config >> "type");
			_function = getText (_config >> "function");
			_functionCode = call compile _function;
			if (_type isEqualTo "spawn") then 
			{
				format ["Spawning %1...", _function] call ExileServer_util_log;
				[] spawn _functionCode;
			}
			else 
			{
				format ["Calling %1...", _function] call ExileServer_util_log;
				[] call _functionCode;
			};
			missionNamespace setVariable [_eventKey, time];
		};
	};
}
forEach _events;