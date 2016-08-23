/**
 * ExileServer_system_thread_removeTask
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_threadID","_result","_threadIndex"];
_threadID = _this select 0;
_result = false;
_threadIndex = [ExileSystemSpawnThread, _threadID] call ExileClient_util_find;
if (_threadIndex != -1) then
{	
	ExileSystemThreadDelays deleteAt (ExileSystemThreadDelays find ((ExileSystemSpawnThread select _threadIndex) select 0));
	[] call ExileServer_system_thread_threadAdjust;
	ExileSystemSpawnThread deleteAt _threadIndex;
	_result = true;
};
_result