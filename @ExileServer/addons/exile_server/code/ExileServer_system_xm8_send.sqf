/**
 * ExileServer_system_xm8_send
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_methodName","_recipients","_text","_allowedMethods","_escapedText","_message","_result"];
_methodName = _this select 0;
_recipients = _this select 1;
_text = _this select 2;
_allowedMethods = ["base-raid", "flag-stolen", "flag-restored", "protection-money-due", "protection-money-paid"];
try 
{
	if !(_methodName in _allowedMethods) then 
	{
		throw format ["Forbidden method name: %1!", _methodName];
	};
	if !(_recipients isEqualType []) then 
	{
		throw "Broken recipient list!";
	};
	_recipients = _recipients call ExileClient_util_array_unique;
	if ((count _recipients) isEqualTo 0) then 
	{
		throw "No recipients!";
	};
	if ((count _recipients) > 30) then 
	{
		throw "Too many recipients!";
	};
	_escapedText = _text call ExileClient_util_string_escapeJson;
	if (_escapedText isEqualTo "") then 
	{
		throw "Invalid text!";
	};
	_message = format ['{"r":%1,"m":"%2","t":"%3"}', _recipients, _methodName, _escapedText];
	_result = "XM8" callExtension _message;
	format ["XM8 mesage sent: %1 (%2)", _message, _result] call ExileServer_util_log;
}
catch 
{
	format ["XM8 message failed: %1", _exception] call ExileServer_util_log;
};