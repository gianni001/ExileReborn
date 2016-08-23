/**
 * ExileServer_object_lock_network_setPin
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_object","_pincode","_newPinCode","_objectPinCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_object = objectFromNetId (_parameters select 0);
_pincode = _parameters select 1;
_newPinCode = _parameters select 2;
_objectPinCode = _object getVariable ["ExileAccessCode", "000000"];
if(_pincode isEqualTo _objectPinCode)then
{
	_object setVariable ["ExileAccessCode",_newPinCode];
	[_sessionID, "setPinResponse", [["SuccessTitleOnly", ["PIN changed successfully!"]], netId _object, _newPinCode]] call ExileServer_system_network_send_to;
	[_object,_newPinCode] call ExileServer_object_container_database_setpin;
}
else
{
	[_sessionID, "setPinResponse", [["ErrorTitleAndText", ["Wrong PIN!", "Please try again."]], "", ""]] call ExileServer_system_network_send_to;
};
true