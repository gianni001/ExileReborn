/**
 * ExileServer_object_container_database_delete
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_containerObject","_containerID"];
_containerObject = _this;
_containerID = _containerObject getVariable ["ExileDatabaseID", -1];
if !(_containerID isEqualTo -1) then
{
	format ["deleteContainer:%1", _containerID] call ExileServer_system_database_query_fireAndForget;
};
true