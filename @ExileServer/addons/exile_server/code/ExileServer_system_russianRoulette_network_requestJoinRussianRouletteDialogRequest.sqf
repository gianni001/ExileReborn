/**
 * ExileServer_system_russianRoulette_network_requestJoinRussianRouletteDialogRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_buyInAmount"];
_sessionID = _this select 0;
_buyInAmount = getNumber (missionConfigFile >> "CfgExileRussianRoulette" >> "buyInAmount");
if (serverTime > 1000000) then 
{
	[_sessionID, "requestJoinRussianRouletteDialogResponse", [2, _buyInAmount]] call ExileServer_system_network_send_to;
}
else 
{
	[_sessionID, "requestJoinRussianRouletteDialogResponse", [ExileServerRussianRouletteStatus, _buyInAmount]] call ExileServer_system_network_send_to;
};