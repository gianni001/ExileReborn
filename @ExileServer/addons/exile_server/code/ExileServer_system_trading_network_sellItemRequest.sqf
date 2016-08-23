/**
 * ExileServer_system_trading_network_sellItemRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_itemClassName","_quantity","_containerType","_containerNetID","_playerObject","_vehicleObject","_sellPrice","_playerMoney","_noRespectItems","_playerRespect","_respectGain","_logging","_playerMoneyString","_traderLog","_responseCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_itemClassName = _parameters select 0;
_quantity = _parameters select 1;
_containerType = _parameters select 2;
_containerNetID = _parameters select 3;
try 
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw 1;
	};
	if !(alive _playerObject) then
	{
		throw 2;
	};
	if(_playerObject getVariable ["ExileMutex",false]) then
	{
		throw 12;
	};
	_playerObject setVariable ["ExileMutex",true];
	_vehicleObject = objNull;
	if !(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName) ) then
	{
		throw 3;
	};
	_sellPrice = _itemClassName call ExileClient_util_gear_calculateSellPrice;
	if (_containerType isEqualTo 1) then
	{
		if (_itemClassName isEqualTo (primaryWeapon _playerObject)) then
		{
			{
				{
					if !(_x isEqualTo "") then
					{
						_sellPrice = _sellPrice + (_x call ExileClient_util_gear_calculateSellPrice);
					};
				}
				forEach _x;
			}
			forEach 
			[
				primaryWeaponItems _playerObject,
				primaryWeaponMagazine _playerObject
			];
		};
		if (_itemClassName isEqualTo (handgunWeapon _playerObject)) then
		{
			{
				{
					if !(_x isEqualTo "") then
					{
						_sellPrice = _sellPrice + (_x call ExileClient_util_gear_calculateSellPrice);
					};
				}
				forEach _x;
			}
			forEach 
			[
				handgunItems _playerObject,
				handgunMagazine _playerObject
			];
		};
	};
	if (_sellPrice <= 0) then
	{
		throw 4;
	};
	_playerMoney = _playerObject getVariable ["ExileMoney", 0];
	_playerMoney = _playerMoney + _sellPrice;
	_playerObject setVariable ["ExileMoney", _playerMoney, true];
	format["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
	_noRespectItems = 
	[
		"Exile_Item_FlagStolen1",
		"Exile_Item_FlagStolen2",
		"Exile_Item_FlagStolen3",
		"Exile_Item_FlagStolen4",
		"Exile_Item_FlagStolen5",
		"Exile_Item_FlagStolen6",
		"Exile_Item_FlagStolen7",
		"Exile_Item_FlagStolen8",
		"Exile_Item_FlagStolen9",
		"Exile_Item_FlagStolen10"
	];
	_playerRespect = _playerObject getVariable ["ExileScore", 0];
	if !(_itemClassName in _noRespectItems) then 
	{
		_respectGain = _sellPrice * getNumber (configFile >> "CfgSettings" >> "Respect" >> "tradingRespectFactor");
		_playerRespect = floor (_playerRespect + _respectGain);
		_playerObject setVariable ["ExileScore", _playerRespect];
		format["setAccountScore:%1:%2", _playerRespect, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
	};
	[_sessionID, "sellItemResponse", [0, _sellPrice, _itemClassName, 1, _containerType, _containerNetID, str _playerRespect]] call ExileServer_system_network_send_to;
	_logging = getNumber(configFile >> "CfgSettings" >> "Logging" >> "traderLogging");
	if (_logging isEqualTo 1) then
	{
		_playerMoneyString = _playerMoney call ExileClient_util_string_exponentToString;
		_traderLog = format ["PLAYER: ( %1 ) %2 SOLD ITEM %3 FOR %4 POPTABS AND %5 RESPECT | PLAYER TOTAL MONEY: %6",getPlayerUID _playerObject,_playerObject,_itemClassName,_sellPrice,_respectGain,_playerMoneyString];
		"extDB2" callExtension format["1:TRADING:%1",_traderLog];
	};
	if !(_vehicleObject isEqualTo objNull) then
	{
		_vehicleObject call ExileServer_object_vehicle_database_update;
	}
	else 
	{
		_playerObject call ExileServer_object_player_database_update;
	};
}
catch 
{
	_responseCode = _exception;
	[_sessionID, "sellItemResponse", [_responseCode, 0, "", 0, 0, "", ""]] call ExileServer_system_network_send_to;
};
if !(isNull _playerObject) then 
{
	_playerObject setVariable ["ExileMutex", false];
};
true