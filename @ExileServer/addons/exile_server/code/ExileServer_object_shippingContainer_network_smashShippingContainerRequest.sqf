/**
 * ExileServer_object_shippingContainer_network_smashShippingContainerRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionId","_parameters","_shippingContainer","_player","_shippingContainerVolume","_damagePerHit","_newDamage","_shippingContainerPosition","_numberOfItems","_weaponHolder"];
_sessionId = _this select 0;
_parameters = _this select 1;
_shippingContainer = _parameters select 0;
try 
{
	if (isNull _shippingContainer) then 
	{
		throw format ["Cannot smash unknown shipping container!"];
	};
	if !(alive _shippingContainer) then 
	{
		throw "Cannot smash destroyed shipping container!";
	};
	if !([_shippingContainer, "ShippingContainerSource"] call ExileClient_util_model_isInteraction) then 
	{
		throw "Can only smash shipping containers!";
	};
	_player = _sessionId call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then 
	{
		throw "Unknown players cannot smash shipping containers!";
	};
	if !(alive _player) then 
	{
		throw "The dead cannot smash shipping containers!";
	};
	if ((_player distance _shippingContainer) > 30) then 
	{
		throw "No long distance shipping container smashing! Nope!";
	};
	_shippingContainerVolume = _shippingContainer call ExileClient_util_model_getBoundingBoxVolume;
	if (_shippingContainerVolume < 1) then 
	{
		_shippingContainerVolume = 1;
	};
	_damagePerHit = (1 / (_shippingContainerVolume * 0.5)) min 0.2; 
	_newDamage = ((damage _shippingContainer) + _damagePerHit) min 1;
	if (_newDamage isEqualTo 1) then 
	{
		_shippingContainerPosition = getPosATL _shippingContainer;
		_shippingContainerPosition set [2, 0];
		_shippingContainer setDamage 999; 
		_numberOfItems = (ceil (_shippingContainerVolume / 10)) max 1;
		format ["Spawning %1 junk metal at %2", _numberOfItems, _shippingContainerPosition] call ExileServer_util_log;
		_weaponHolder = createVehicle ["GroundWeaponHolder", _shippingContainerPosition, [], 0, "CAN_COLLIDE"];
		_weaponHolder setPosATL _shippingContainerPosition;
		_weaponHolder addMagazineCargoGlobal ["Exile_Item_JunkMetal", _numberOfItems];
	}
	else 
	{
		_shippingContainer setDamage _newDamage; 
	};
}
catch 
{
	_exception call ExileServer_util_log;
};
true