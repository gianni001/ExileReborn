/**
 * ExileServer_object_construction_network_upgradeConstructionRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_object","_playerObject","_maxRange","_flags","_buildRights","_objectConfig","_objectClass","_position","_vectorUp","_vectorDir","_objectDatabaseID","_objectOwner","_accessCode","_newObject"];
_sessionID = _this select 0;
_parameters = _this select 1;
_object = _parameters select 0;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	_maxRange = getArray(missionConfigFile >> "CfgTerritories" >> "prices");
	_maxRange = (_maxRange select ((count _maxRange) -1)) select 1;
	_flags = nearestObjects [_playerObject,["Exile_Construction_Flag_Static"],_maxRange];
	if (_flags isEqualTo []) then 
	{
		throw "You are retarded!";
	};
	_flags = _flags select 0;
	_buildRights = _flags getVariable ["ExileTerritoryBuildRights",[]];
	if !((getPlayerUID _playerObject) in _buildRights) then 
	{
		throw "No territory access!";
	};
	if !("Exile_Item_FortificationUpgrade" in (magazines _playerObject)) then 
	{
		throw "Really?";
	};
	if !(_object getVariable ["ExileConstructionDamage",0] isEqualTo 0)then
	{
		throw "Please repair the object first.";
	};
	_objectConfig =
	"
	isText(_x >> 'upgradeObject')
 	&& 
 	getText(_x >> 'staticObject') isEqualTo (typeOf _object)
 	"
 	configClasses 
 	(configFile >> 'CfgConstruction');
 	if (_objectConfig isEqualTo []) then 
	{
 		throw "Invalid Upgrade";
	};
 	_objectConfig = _objectConfig select 0;
 	_objectClass = getText (_objectConfig >> "upgradeObject");
 	_position = getPosATL _object;
 	_vectorUp = vectorUp _object;
 	_vectorDir = vectorDir _object;
 	_objectDatabaseID = _object getVariable ["ExileDatabaseID",0];
 	_objectOwner = _object getVariable ["ExileOwnerUID",""];
 	if (_objectDatabaseID isEqualTo 0) then 
	{
 		throw "Invalid Database ID";
	};
 	_accessCode = _object getVariable ["ExileAccessCode","000000"];
 	deleteVehicle _object;
 	format ["upgradeObject:%1:%2",_objectClass,_objectDatabaseID] call ExileServer_system_database_query_fireAndForget;
 	_newObject = createVehicle [_objectClass,_position,[],0,"CAN_COLIDE"];
 	_newObject setVariable ["ExileDatabaseID",_objectDatabaseID];
 	_newObject setVariable ["ExileOwnerUID",_objectOwner];
 	_newObject setVariable ["ExileIsPersistent",true];
 	_newObject setPosATL _position;
 	_newObject setVectorDirAndUp [_vectorDir,_vectorUp];
 	if !(_accessCode isEqualTo "000000") then
 	{
 		_newObject setVariable ["ExileAccessCode",_accessCode];
 		_newObject setVariable ["ExileIsLocked",0,true];
 	};
 	_newObject call ExileServer_util_vehicle_enableSimulationIfRequired;
 	[_sessionID,"upgradeConstructionResponse",[_newObject]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to upgrade!", _exception]]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;
};
true
