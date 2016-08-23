/**
 * ExileServer_system_xm8_sendBaseRaid
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_recipients","_territoryName"];
_recipients = _this getVariable ["ExileTerritoryBuildRights", []];
_territoryName = _this getVariable ["ExileTerritoryName", ""];
["base-raid", _recipients, _territoryName] call ExileServer_system_xm8_send;