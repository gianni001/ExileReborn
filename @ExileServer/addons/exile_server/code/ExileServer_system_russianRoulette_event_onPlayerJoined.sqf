/**
 * ExileServer_system_russianRoulette_event_onPlayerJoined
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_playerObject","_buyInAmount","_playerMoney","_chairIndex","_chairInfo","_chair","_probabilities"];
_playerObject = _this;
_buyInAmount = getNumber (missionConfigFile >> "CfgExileRussianRoulette" >> "buyInAmount");
_playerMoney = _playerObject getVariable ["ExileMoney", 0];
_playerMoney = _playerMoney - _buyInAmount;
format["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
ExileServerRussianRoulettePotValue = ExileServerRussianRoulettePotValue + _buyInAmount;
_chairIndex = count ExileServerRussianRoulettePlayers;
_chairInfo = ExileRouletteChairPositions select _chairIndex;
_chair = ExileRouletteChairs select _chairIndex;
_chair setDir (deg (_chairInfo select 1));
_chair setPosWorld (_chairInfo select 0);
_chair disableCollisionWith _playerObject;
_chair setOwner (owner _playerObject); 
_probabilities = [false, false, false, false, false, true] call ExileClient_util_array_shuffle;
_playerObject setVariable ["SavedRussianRoulettePosition", getPosASL _playerObject];
_playerObject setVariable ["SavedRussianRouletteDirection", getDir _playerObject];
_playerObject setVariable ["IsPlayingRussianRoulette", true]; 
_playerObject setVariable ["ExileMoney", _playerMoney, true];
_playerObject setVariable ["RussianRouletteProbabilities", _probabilities];
_playerObject setVariable ["RussianRouletteCurrentShot", -1]; 
ExileServerRussianRoulettePlayers pushBack [netId _playerObject, name _playerObject];
ExileServerRussianRouletteAlivePlayers pushBack _playerObject;
[_playerObject, "joinRussianRouletteResponse", [netID _chair]] call ExileServer_system_network_send_to;
format ["Russian Roulette: %1 joined the game.", name _playerObject] call ExileServer_util_log;
switch (count ExileServerRussianRoulettePlayers) do 
{	
	case 2:
	{
		ExileServerRussianRouletteCountDownEndTime = serverTime + 2*60;
		["systemChatRequest", ["A round of Russian Roulette starts in two minutes!"]] call ExileServer_system_network_send_broadcast;
		"Russian Roulette: Game starts in two minutes." call ExileServer_util_log;
		ExileServerRussianRouletteStartGameCountDownThread = [] spawn 
		{
			while {serverTime < ExileServerRussianRouletteCountDownEndTime} do 
			{
				uiSleep 1;
			};
			call ExileServer_system_russianRoulette_startGame;
		};
		call ExileServer_system_russianRoulette_broadcastGameStatus;
	};
	case 6:
	{
		if !(isNil "ExileServerRussianRouletteStartGameCountDownThread") then 
		{
			terminate ExileServerRussianRouletteStartGameCountDownThread;
			ExileServerRussianRouletteStartGameCountDownThread = nil;
		};
		call ExileServer_system_russianRoulette_startGame; 
	};
	default 
	{
		call ExileServer_system_russianRoulette_broadcastGameStatus;
	};
};
