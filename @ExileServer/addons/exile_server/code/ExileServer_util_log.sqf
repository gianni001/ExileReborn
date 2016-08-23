/**
 * ExileServer_util_log
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_log"];
_log = format["ExileServer - %1", _this];
if(isNil "MAR_fnc_log")then
{
	diag_log _log;
}
else
{
	[_log,"info"] call MAR_fnc_log;
		diag_log _log;
};
true