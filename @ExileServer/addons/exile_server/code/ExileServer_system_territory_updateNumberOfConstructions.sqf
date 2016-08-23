/**
 * ExileServer_system_territory_updateNumberOfConstructions
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_flag","_territoryRange","_numberOfConstructions"];
_flag = _this;
_territoryRange = _flag getVariable ["ExileTerritorySize", 0];
_numberOfConstructions = count (_flag nearObjects ["Exile_Construction_Abstract_Static", _territoryRange]);
_flag setVariable ["ExileTerritoryNumberOfConstructions", _numberOfConstructions, true];
