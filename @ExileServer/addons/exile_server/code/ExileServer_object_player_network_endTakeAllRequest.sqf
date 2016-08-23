/**
 * ExileServer_object_player_network_endTakeAllRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_objectNetID","_object"];
_sessionID = _this select 0;
_parameters = _this select 1;
_objectNetID = _parameters select 0;
_object = objectFromNetId _objectNetID;
if !(isNull _object) then
{
	if ((_object getVariable ["ExileTakeAllLock", ""]) isEqualTo _sessionID) then
	{
		_object setVariable ["ExileTakeAllLock", nil];
	};
};