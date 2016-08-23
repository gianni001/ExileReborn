/**
 * ExileServer_util_extDB2_createMessage
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_messageName","_fields","_numberOfFields","_i","_field","_message"];
_messageName = _this select 0;
_fields = _this select 1;
_numberOfFields = count _fields;
for "_i" from 0 to _numberOfFields - 1 do 
{
	_field = _fields select _i;
	if ((typeName _field) isEqualTo "SCALAR") then 
	{
		_fields set[_i, _field call ExileClient_util_string_scalarToString];
	};
};
_message = "";
_message = _fields joinString ":";
_message = [_messageName, _message] joinString ":";
_message