/**
 * ExileServer_object_construction_network_moveConstructionRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_objectNetID","_object","_objectClassname","_isContainer","_playerObject","_playerUID","_objectID","_ownerUID","_canMove","_flag","_buildRights","_money","_holderPosition","_holder"];
_sessionID = _this select 0;
_parameters = _this select 1;
_objectNetID = _parameters select 0;
try 
{
	_object = objectFromNetId _objectNetID;
	_objectClassname = typeOf _object;
	_isContainer = isNumber(configFile >> "CfgVehicles" >> _objectClassname >> "exileContainer");
	if (isNull _object) then 
	{
		throw "Construction object is null!";
	};
	if (_object isKindOf "Exile_Construction_Abstract_Physics") then 
	{
		throw "You can only move static objects!";
	};
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then 
	{
		throw "Player object is null!";
	};
	if (_object getVariable ["ExileConstructionDamage",0] > 0)then
	{
		throw "You cant move Damaged objects, repair it first";
	};
	_playerUID = getPlayerUID _playerObject;
	_objectID = _object getVariable ["ExileDatabaseID", -1];
	if (_objectID isEqualTo -1) then 
	{
		throw "Construction object is not saved in database!";
	};
	_ownerUID = _object getVariable ["ExileOwnerUID", -1];
	if (_ownerUID isEqualTo -1) then 
	{
		throw "Object has no owner!";
	};
	_canMove = false;
	_flag = _object call ExileClient_util_world_getTerritoryAtPosition;
	if ((_flag getVariable ["ExileFlagStolen", 0]) isEqualTo 1) then
	{
		throw "You cannot move parts while your flag is stolen.";
	};
	if (_playerUID isEqualTo _ownerUID) then
	{
		_canMove = true;
	}
	else 
	{
		if !(isNull _flag) then 
		{
			_buildRights = _flag getVariable ["ExileTerritoryBuildRights",[]];
			if (_playerUID in _buildRights) then
			{
				_canMove = true;
			};
		};
	};	
	if !(_canMove) then 
	{
		throw "You have no permission to move this!";
	};
	if (_isContainer) then
	{
		_money = _object getVariable ["ExileMoney", 0];
		ExileContainerCargo =
		[
			_object call ExileServer_util_getItemCargo,
			magazinesAmmoCargo _object,
			weaponsItemsCargo _object,
			_object call ExileServer_util_getObjectContainerCargo,
			_money
		];
		_object call ExileServer_object_container_database_delete;
	} else
	{
		if !((_object getVariable ["ExileAccessCode", -1]) isEqualTo -1) then
		{
			_holderPosition = getPosATL _playerObject;
			_holder = createVehicle ["GroundWeaponHolder", _holderPosition, [], 0, "CAN_COLLIDE"];
			_holder setPosATL _holderPosition;
			_holder addMagazineCargoGlobal ["Exile_Item_Codelock", 1];
		};
		_object call ExileServer_object_construction_database_delete;
	};
	deleteVehicle _object;
	if !(isNull _flag) then 
	{
		_flag call ExileServer_system_territory_updateNumberOfConstructions;
	};
	[_sessionID, "constructionMoveResponse", [true, typeOf _object]] call ExileServer_system_network_send_to;
}
catch 
{
	[_sessionID, "constructionMoveResponse", [false, _exception]] call ExileServer_system_network_send_to;
};
true