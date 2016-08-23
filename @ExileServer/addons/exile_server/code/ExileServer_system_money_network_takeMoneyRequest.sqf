/**
 * ExileServer_system_money_network_takeMoneyRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_objectNetID","_amount","_player","_container","_containerMoney","_containerID","_playerMoney"];
_sessionID = _this select 0;
_parameters = _this select 1;
_objectNetID = _parameters select 0;
_amount = _parameters select 1;
try 
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then 
	{
		throw "Non-existent players cannot take money!";
	};
	if !(alive _player) then 
	{
		throw "The dead cannot take money!";
	};
	_container = objectFromNetId _objectNetID;
	if (isNull _container) then 
	{
		throw "Cannot take money from non-existent container!";
	};
	if ((_player distance _container) > 10) then 
	{
		throw "Cannot take money over long distances!";
	};
	_containerMoney = _container getVariable ["ExileMoney", 0];
	if (_containerMoney < 1) then 
	{
		throw "Cannot take money from an empty container!";
	};
	if (_amount isEqualTo 0) then 
	{
		_amount = _containerMoney;
	};
	if (_amount > _containerMoney) then 
	{
		throw "Cannot take more money than the container has!";
	};
	_containerMoney = _containerMoney - _amount;
	_containerID = _container getVariable ["ExileDatabaseID", -1];
	_container setVariable ["ExileMoney", _containerMoney, true];
	if (_containerID > -1) then 
	{
		format["setContainerMoney:%1:%2", _containerMoney, _containerID] call ExileServer_system_database_query_fireAndForget;
	};
	if (_containerMoney isEqualTo 0) then 
	{
		if (_container isKindOf "Exile_PopTabs") then 
		{
			deleteVehicle _container;
		};
	};
	_playerMoney = _player getVariable ["ExileMoney", 0];
	_playerMoney = _playerMoney + _amount;
	_player setVariable ["ExileMoney", _playerMoney, true];
	format["setPlayerMoney:%1:%2", _playerMoney, _player getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
}
catch
{
	_exception call ExileServer_util_log;
};
[_sessionID, "moneyTransactionResponse", ["", _amount]] call ExileServer_system_network_send_to;