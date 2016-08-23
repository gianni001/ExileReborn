/**
 * ExileServer_system_thread_threadAdjust
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
if (ExileSystemThreadDelays isEqualTo []) then
{
	ExileSystemThreadDelays = [5];
};
ExileSystemThreadDelays = ExileSystemThreadDelays call BIS_fnc_sortNum;
ExileSystemThreadSleep = (((ExileSystemThreadDelays select 0) max 0.01) min 5);
true