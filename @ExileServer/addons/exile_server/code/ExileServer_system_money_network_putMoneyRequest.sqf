/**
 * ExileServer_system_money_network_putMoneyRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_objectNetID","_amount","_newContainerNetID","_player","_playerMoney","_container","_containerMoney","_nearbyPopTabs","_maximumLoad","_maximumPoptabsLoad","_maximumAmmountToAdd","_containerID"];
_sessionID = _this select 0;
_parameters = _this select 1;
_objectNetID = _parameters select 0;
_amount = _parameters select 1;
_newContainerNetID = "";
try 
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then 
	{
		throw "Non-existent players cannot put money somewhere!";
	};
	if !(alive _player) then 
	{
		throw "The dead cannot put money somewhere!";
	};
	if (_amount < 1) then 
	{
		throw "Invalid money parameter!";
	};
	_playerMoney = _player getVariable ["ExileMoney", 0];
	if (_amount > _playerMoney) then 
	{
		throw "Cannot store money that this player does not have!";
	};
	_container = objectFromNetId _objectNetID;
	if (isNull _container) then 
	{
		throw "Cannot store money in non-existent container!";
	};
	if ((_player distance _container) > 10) then 
	{
		throw "Cannot store money over long distances!";
	};
	_containerMoney = _container getVariable ["ExileMoney", 0];
	if (_container isKindOf "GroundWeaponHolder") then 
	{
		_nearbyPopTabs = nearestObjects [_player, ["Exile_PopTabs"], 3];
		if (_nearbyPopTabs isEqualTo []) then
		{
			_container = createVehicle ["Exile_PopTabs", (getPos _player), [], 0, "CAN_COLLIDE"];
			_container setPosASL (getPosASL _player);
		}
		else 
		{
			_container = _nearbyPopTabs select 0;
		};
		_newContainerNetID = netID _container;
	}
	else
	{
		if!(_container isKindOf "man")then
		{
			_maximumLoad = getNumber (configFile >> "CfgVehicles" >> typeOf _container >> "maximumLoad");
			if(_maximumLoad isEqualTo 0)then
			{
				throw "Invalid container load";
			};
			_maximumPoptabsLoad = _maximumLoad * 10;
			_maximumAmmountToAdd = _maximumPoptabsLoad - _containerMoney;
			if(_amount > _maximumAmmountToAdd)then
			{
				_amount = _maximumAmmountToAdd;
			};
		};
	};
	_playerMoney = _playerMoney - _amount;
	_player setVariable ["ExileMoney", _playerMoney, true];
	format["setPlayerMoney:%1:%2", _playerMoney, _player getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
	_containerMoney = _container getVariable ["ExileMoney", 0];
	_containerMoney = _containerMoney + _amount;
	_container setVariable ["ExileMoney", _containerMoney, true];
	_containerID = _container getVariable ["ExileDatabaseID", -1];
	if (_containerID > -1) then 
	{
		if ((getNumber (configFile >> "CfgVehicles" >> (typeOf _container) >> "exileContainer")) isEqualTo 1) then 
		{
			format["setContainerMoney:%1:%2", _containerMoney, _containerID] call ExileServer_system_database_query_fireAndForget;
		}
		else 
		{
			format["setVehicleMoney:%1:%2", _containerMoney, _containerID] call ExileServer_system_database_query_fireAndForget;
		};
	};
}
catch
{
	_exception call ExileServer_util_log;
};
[_sessionID, "moneyTransactionResponse", [_newContainerNetID, -1 * _amount]] call ExileServer_system_network_send_to;