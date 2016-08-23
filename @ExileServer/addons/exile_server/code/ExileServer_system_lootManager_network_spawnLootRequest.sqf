/**
 * ExileServer_system_lootManager_network_spawnLootRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_buildingNetIDs","_building"];
_sessionID = _this select 0;
_parameters = _this select 1;
_buildingNetIDs = _parameters select 0;
{
	_building = objectFromNetId _x;
	try 
	{
		if (isNull _building) throw false;
		if (isObjectHidden _building) throw false;
		if !(isClass(configFile >> "CfgBuildings" >> typeOf _building)) throw false;
		if (_building getVariable ["ExileHasLoot", false]) throw false;
		_building call ExileServer_system_lootManager_spawnLootInBuilding;
	}
	catch 
	{
	};
}
forEach _buildingNetIDs;