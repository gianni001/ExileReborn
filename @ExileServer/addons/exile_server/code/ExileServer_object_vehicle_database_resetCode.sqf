/**
 * ExileServer_object_vehicle_database_resetCode
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicle","_newPin","_databaseID"];
_vehicle = _this select 0;
_newPin = _this select 1;
_databaseID = _vehicle getVariable ["ExileDatabaseID",-1];
if!(_databaseID isEqualTo -1)then
{
	format ["vehicleSetPinCode:%1:%2",_newPin,_databaseID] call ExileServer_system_database_query_fireAndForget;	
};
true