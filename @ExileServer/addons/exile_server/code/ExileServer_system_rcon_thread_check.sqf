/**
 * ExileServer_system_rcon_thread_check
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_restartTime","_useAutoKick","_kickTime","_lockTime","_uptime","_timeTilRestart","_time","_i"];
_restartTime = _this select 0;
_useAutoKick = _this select 1;
_kickTime = _this select 2;
_lockTime = _this select 3;
_uptime = call ExileServer_util_time_uptime;
_timeTilRestart = _restartTime - _uptime;
if (typeName ExileServerRestartMessages isEqualTo "ARRAY") then
{
	if !(ExileServerRestartMessages isEqualTo []) then
	{
		{
			_time = _x;
			if (_timeTilRestart < _time) then
			{
				if (count ExileSessionIDs > 0) then
				{
					["toastRequest", ["InfoTitleAndText", ["Restart incoming!", format["Server is going to restart in %1 min! Log out before the restart to prevent gear loss.", _time] ]]] call ExileServer_system_network_send_broadcast;
				};
				ExileServerRestartMessages deleteAt _forEachIndex;
				format ["Restart Warnings for %1min sent",_time] call ExileServer_util_log;
			};
		} 
		forEach ExileServerRestartMessages;
	};
};
if (_timeTilRestart < _lockTime) then
{
	if !(ExileServerIsLocked) then
	{
		"#lock" call ExileServer_system_rcon_event_sendCommand;
		"Server locked for restart" call ExileServer_util_log;
		["toastRequest", ["ErrorTitleAndText", ["Server will restart now!", "You will be kicked off the server due to a restart."]]] call ExileServer_system_network_send_broadcast;
		ExileServerIsLocked = true;
	};
	if (_timeTilRestart < _kickTime) then
	{
		if !(ExileServerRestartMode) then
		{
			call ExileServer_system_rcon_event_kickAllrestart;
			"Everyone kicked for restart" call ExileServer_util_log;
			ExileSystemSpawnThread = [];
			call ExileServer_system_rcon_event_clearBuffers;
			"Buffers cleared!" call ExileServer_util_log;
			for "_i" from 0 to 49 do
			{
				"SERVER READY FOR RESTART!!" call ExileServer_util_log;
			};
			ExileServerRestartMode = true;
			if(getNumber(configFile >> "CfgSettings" >> "RCON" >> "useShutdown") isEqualTo 1)then
			{
				'#shutdown' call ExileServer_system_rcon_event_sendCommand;
			};
		};
	};
};
true