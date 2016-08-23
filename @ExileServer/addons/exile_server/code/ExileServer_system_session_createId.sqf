/**
 * ExileServer_system_session_createId
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_alphabet","_generateNewSessionId","_sessionId","_i"];
_alphabet = "zyxwvutsrqponmlkjihgfedcbaABCDEFGHIJKLMNOPQRSTUVWXYZ";
_generateNewSessionId = true;
_sessionId = "";
while {_generateNewSessionId} do
{
	_sessionId = "";
	for "_i" from 1 to 8 do 
	{
		_sessionId = _sessionId + (_alphabet select [floor (random 51), 1]);
	};
	if !(_sessionId call ExileServer_system_session_isRegisteredId) then
	{
		_generateNewSessionId = false;
	};
};
_sessionId