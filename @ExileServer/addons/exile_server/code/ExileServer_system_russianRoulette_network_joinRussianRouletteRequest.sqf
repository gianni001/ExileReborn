/**
 * ExileServer_system_russianRoulette_network_joinRussianRouletteRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_playerObject","_buyInAmount","_playerMoney"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then 
	{
		throw "Unknown player!";
	};
	if !(alive _playerObject) then 
	{
		throw "The dead cannot play Russian Roulette!";
	};
	_buyInAmount = getNumber (missionConfigFile >> "CfgExileRussianRoulette" >> "buyInAmount");
	if (_buyInAmount < 1) then 
	{
		throw "Invalid Buy-In amount in config!";
	};
	_playerMoney = _playerObject getVariable ["ExileMoney", 0];
	if (_playerMoney < _buyInAmount) then 
	{
		throw "You are too poor!";
	};
	if !(ExileServerRussianRouletteStatus isEqualTo 0) then 
	{
		throw "Game is already running!";
	};
	_playerObject call ExileServer_system_russianRoulette_event_onPlayerJoined;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to join!", _exception]]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;
};