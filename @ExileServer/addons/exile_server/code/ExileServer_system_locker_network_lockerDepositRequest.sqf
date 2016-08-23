/**
 * ExileServer_system_locker_network_lockerDepositRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_deposit","_player","_depositAmount","_playerMoney","_lockerLimit","_lockerAmount","_newLockerAmount","_newPlayerMoney"];
_sessionID = _this select 0;
_parameters = _this select 1;
_deposit = _parameters select 0;
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
	_depositAmount = parseNumber _deposit;
	_playerMoney = _player getVariable ["ExileMoney",0];
	if (_playerMoney < _depositAmount) then
	{
		throw "Not enough pop tabs";
	};
	_lockerLimit = (getNumber(missionConfigFile >> "CfgLocker" >> "maxDeposit"));
	_lockerAmount = _player getVariable ["ExileLocker", 0];
	_newLockerAmount = _depositAmount + _lockerAmount;
	if (_lockerLimit < _newLockerAmount) then
	{
		throw "Not enough space in locker";
	};
	_player setVariable ["ExileLocker", _newLockerAmount, true];
	format["updateLocker:%1:%2", _newLockerAmount, getPlayerUID _player] call ExileServer_system_database_query_fireAndForget;
	_newPlayerMoney = _playerMoney - _depositAmount;
	_player setVariable ["ExileMoney", _newPlayerMoney, true];
	format["setPlayerMoney:%1:%2", _newPlayerMoney, _player getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
	[_sessionID, "toastRequest", ["SuccessTitleOnly", ["Deposited!"]]] call ExileServer_system_network_send_to;
	[_sessionID, "lockerResponse", []] call ExileServer_system_network_send_to;
}
catch 
{
	_exception call ExileServer_util_log;
};
true