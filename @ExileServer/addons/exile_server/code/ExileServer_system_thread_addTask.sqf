/**
 * ExileServer_system_thread_addTask
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_delay","_function","_params","_persistance","_pushBackThreadID","_threadId"];
_delay = _this select 0;
_function = _this select 1;
_params =  _this select 2;
_persistance = _this select 3;
_pushBackThreadID = param [4, false];
_threadId = ExileSystemThreadID;
if(_pushBackThreadID)then
{
	_params pushBack _threadId;
};
ExileSystemSpawnThread pushBack [_delay, time, _function,_params, _threadId, _persistance];
ExileSystemThreadDelays pushBack _delay;
[] call ExileServer_system_thread_threadAdjust;
ExileSystemSpawnThread = [ExileSystemSpawnThread, [], {_x select 4}, "ASCEND", {true}] call BIS_fnc_sortBy;
format ["Job with handle %1 added.", _threadId] call ExileServer_util_log;
ExileSystemThreadID = ExileSystemThreadID + 1;
_threadId