/**
 * ExileServer_system_slothMachine_network_slothMachineRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_player","_playerMoney","_spinCost","_dice","_prizeConfig","_chances","_prizeName","_gameTextOutput","_symbols","_allPrizes","_i","_randomPrizeConfig","_newSymbol","_prizeSymbol","_totalWinnings","_jackpotAmount","_playerMoneyAdjustment"];
_sessionID = _this select 0;
try 
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then 
	{
		throw "Null player!";
	};
	if !(alive _player) then 
	{
		throw "Dead player!";
	};
	_playerMoney = _player getVariable ["ExileMoney", 0];
	_spinCost = getNumber (missionConfigFile >> "CfgSlothMachine" >> "spinCost");
	if (_playerMoney < _spinCost) then
	{
		throw "Not enough pop tabs";
	};
	_dice = floor (random 100);
	_prizeConfig = objNull;
	_chances = getArray (missionConfigFile >> "CfgSlothMachine" >> "chances");
	_prizeName = ""; 
	_gameTextOutput = "";
	_symbols = [];
	{
		if (_dice <= (_x select 0)) exitWith 
		{
			_prizeName = _x select 1;
		};
	}
	forEach _chances;
	if (_prizeName isEqualTo "") then 
	{
		_allPrizes = "true" configClasses (missionConfigFile >> "CfgSlothMachine" >> "Prizes");
		for "_i" from 0 to 2 do 
		{
			_randomPrizeConfig = selectRandom _allPrizes;
			_newSymbol = getText (_randomPrizeConfig >> "symbol");
			while {_newSymbol in _symbols} do
			{
				_randomPrizeConfig = selectRandom _allPrizes;
				_newSymbol = getText (_randomPrizeConfig >> "symbol");
			};
			_symbols pushBack _newSymbol;
		};
	}
	else 
	{
		_prizeConfig = missionConfigFile >> "CfgSlothMachine" >> "Prizes" >> _prizeName;
		_prizeSymbol = getText (_prizeConfig >> "symbol");
		_symbols pushBack _prizeSymbol;
		_symbols pushBack _prizeSymbol;
		_symbols pushBack _prizeSymbol;
	};
	if (_prizeName isEqualTo "") then 
	{
		_totalWinnings = 0;
	}
	else 
	{
		if (_prizeName isEqualTo "Jackpot") then
		{		
			_jackpotAmount = getNumber (missionConfigFile >> "CfgSlothMachine" >> "Jackpot");
			_totalWinnings = _jackpotAmount;
		}
		else
		{
			_totalWinnings = getNumber (_prizeConfig >> "prize");
		};
	};
	_playerMoneyAdjustment = _totalWinnings - _spinCost;
	_playerMoney = _playerMoney + _playerMoneyAdjustment;
	_player setVariable ["ExileMoney", _playerMoney, true];
	format["setPlayerMoney:%1:%2", _playerMoney, _player getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
	[_sessionID, "slothMachineResponse", [_prizeName,_totalWinnings,_playerMoneyAdjustment,_symbols]] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileServer_util_log;
};