/**
 * ExileServer_system_network_send_to
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_recipient","_messageName","_messageParameters","_owner","_publicMessage"];
_recipient = _this select 0;
_messageName = _this select 1;
_messageParameters = _this select 2;
switch (typeName _recipient) do 
{
	case "OBJECT": 
	{
		_owner = owner _recipient;
	};
	case "STRING": 
	{
		_owner = owner (_recipient call ExileServer_system_session_getPlayerObject);
	};
	default
	{
		_owner = _recipient;
	};
};
if (_owner > 0) then 
{
	_publicMessage = [_messageName, _messageParameters];
	_publicMessage remoteExecCall ["ExileClient_system_network_dispatchIncomingMessage", _owner];
};
_publicMessage = nil;