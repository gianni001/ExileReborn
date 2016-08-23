/**
 * ExileServer_object_vehicle_network_rekeyVehicleRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_vehicle","_newPinCode","_alphabet","_forbiddenCharacter"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_vehicle = objectFromNetId (_parameters select 0);
	_newPinCode = _parameters select 1;
	_alphabet = getText (missionConfigFile >> "CfgClans" >> "clanNameAlphabet");
	_forbiddenCharacter = [_newPinCode, _alphabet] call ExileClient_util_string_containsForbiddenCharacter;
	if !(_forbiddenCharacter isEqualTo -1) then 
	{
		throw format ["Fuuck you!", _forbiddenCharacter];
	};
	_vehicle setVariable ["ExileAccessCode", _newPinCode];
	[_sessionID, "resetCodeResponse", [["SuccessTitleOnly", ["PIN changed successfully!"]], netId _vehicle,_newPinCode]] call ExileServer_system_network_send_to;
	[_vehicle, _newPinCode] call ExileServer_object_vehicle_database_resetCode;	
}
catch
{
};
true