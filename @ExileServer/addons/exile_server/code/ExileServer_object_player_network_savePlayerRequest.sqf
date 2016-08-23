/**
 * ExileServer_object_player_network_savePlayerRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_hunger","_thirst","_alcohol","_temperature","_wetness","_player"];
_sessionID = _this select 0;
_parameters = _this select 1;
_hunger = _parameters select 0;
_thirst = _parameters select 1;
_alcohol = _parameters select 2;
_temperature = _parameters select 3;
_wetness = _parameters select 4;
_player = _sessionID call ExileServer_system_session_getPlayerObject;
if (!isNull _player) then
{
	_player setVariable["ExileHunger", _hunger];
	_player setVariable["ExileThirst", _thirst];
	_player setVariable["ExileAlcohol", _alcohol];
	_player setVariable["ExileTemperature", _temperature];
	_player setVariable["ExileWetness", _wetness];
	if !(_player in ExileSystemPlayerSaveASYNC) then
	{
		ExileSystemPlayerSaveASYNC pushBack _player;
	};
};
true