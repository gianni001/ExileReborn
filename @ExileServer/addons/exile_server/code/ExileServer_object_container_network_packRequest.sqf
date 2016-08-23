/**
 * ExileServer_object_container_network_packRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_object","_pincode","_objectPinCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_object = objectFromNetId (_parameters select 0);
_pincode = _parameters select 1;
if!(getNumber(configFile >> "CfgVehicles" >> typeOf _object >> "exileIsLockable") isEqualTo 1)then
{
	_object call ExileServer_object_container_packContainer;
	[_sessionID,"systemChatRequest",["Container Packed!"]] call ExileServer_system_network_send_to;
}
else
{
	_objectPinCode = _object getVariable ["ExileAccessCode","000000"];
	if(_objectPinCode isEqualTo _pincode)then
	{
		_object call ExileServer_object_container_packContainer;
		[_sessionID,"systemChatRequest",["Container Packed!"]] call ExileServer_system_network_send_to;
	}
	else
	{
		[_sessionID,"systemChatRequest",["Wrong PIN code! "]] call ExileServer_system_network_send_to;
	};
};
true