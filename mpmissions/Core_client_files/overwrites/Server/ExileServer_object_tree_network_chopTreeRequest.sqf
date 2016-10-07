/**
 * ExileServer_object_tree_network_chopTreeRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionId","_parameters","_treeNetId","_tree","_isTree","_player","_treeHeight","_newDamage","_treePosition","_spawnRadius","_weaponHolders","_weaponHolder","_weaponHolderPosition"];
_sessionId = _this select 0;
_parameters = _this select 1;
_treeNetId = _parameters select 0;
try 
{
	_tree = objectFromNetId _treeNetId;
	if (isNull _tree) then 
	{
		throw format ["Cannot chop unknown tree! %1", _treeNetId];
	};
	if !(alive _tree) then 
	{
		throw "Cannot chop already chopped tree!";
	};
	_isTree = [_tree, "WoodSource"] call ExileClient_util_model_isInteraction;
	if !(_isTree) then 
	{
		throw "Can only chop down trees, you twat!";
	};
	_player = _sessionId call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then 
	{
		throw "Unknown players cannot chop trees!";
	};
	if !(alive _player) then 
	{
		throw "The dead cannot chop down trees!";
	};
	if ((_player distance _tree) > 30) then 
	{
		throw "No long distance tree chopping! Nope!";
	};
	_treeHeight = _tree call ExileClient_util_model_getHeight;
	_treeHeight = _treeHeight max 1; 
	_newDamage = ((damage _tree) + (1 / (floor _treeHeight) )) min 1;
	_tree setDamage _newDamage; 
	if (_newDamage isEqualTo 1) then
	{
		_tree setDamage 999; 
	};
	_treePosition = getPosATL _tree;
	_treePosition set[2, 0];
	_spawnRadius = 3;
	_weaponHolders = nearestObjects[_treePosition, ["GroundWeaponHolder"], _spawnRadius];
	_weaponHolder = objNull;
	if (_weaponHolders isEqualTo []) then
	{	
		_weaponHolderPosition = getPosATL _player;
		_weaponHolder = createVehicle ["GroundWeaponHolder", _weaponHolderPosition, [], 0, "CAN_COLLIDE"];
		_weaponHolder setPosATL _weaponHolderPosition;
	}
	else 
	{
		_weaponHolder = _weaponHolders select 0;
	};
	_weaponHolder addMagazineCargoGlobal ["Exile_Item_WoodLog", 1];
	if ((random 100) > 75) then 
	{	
		if ((random 100) < 50) then 
		{
			_weaponHolder addMagazineCargoGlobal ["Exile_Item_WoodSticks", 1];
		}
		else 
		{
			_weaponHolder addMagazineCargoGlobal ["Exile_Item_Leaves", 1];
		};
	};	
}
catch 
{
	_exception call ExileServer_util_log;
};
true