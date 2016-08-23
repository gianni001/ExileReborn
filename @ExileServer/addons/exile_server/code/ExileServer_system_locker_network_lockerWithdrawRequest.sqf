/**
 * ExileServer_system_locker_network_lockerWithdrawRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_withdraw","_player","_lockerAmount","_withdrawAmount","_newLockerAmount","_playerMoney","_newPlayerMoney"];
_sessionID = _this select 0;
_parameters = _this select 1;
_withdraw = _parameters select 0;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then
	{
		throw "Null player";
	};
	if !(alive _player) then
	{
		throw "Dead player";
	};
	_lockerAmount = _player getVariable ["ExileLocker",0];
	_withdrawAmount = parseNumber _withdraw;
	if (_lockerAmount < _withdrawAmount) then
	{
		throw "Not enough pop tabs";
	};
	_newLockerAmount = _lockerAmount - _withdrawAmount;
	_player setVariable ["ExileLocker", _newLockerAmount, true];
	format["updateLocker:%1:%2", _newLockerAmount, getPlayerUID _player] call ExileServer_system_database_query_fireAndForget;
	_playerMoney = _player getVariable ["ExileMoney",0];
	_newPlayerMoney = _playerMoney + _withdrawAmount;
	_player setVariable ["ExileMoney", _newPlayerMoney, true];
	format["setPlayerMoney:%1:%2", _newPlayerMoney, _player getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
	[_sessionID, "toastRequest", ["SuccessTitleOnly", ["Withdrawn!"]]] call ExileServer_system_network_send_to;
	[_sessionID, "lockerResponse", []] call ExileServer_system_network_send_to;
}
catch 
{
	_exception call ExileServer_util_log;
};
true