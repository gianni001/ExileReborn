/**
 * ExileServer_object_concreteMixer_network_concreteMixerStartRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_concreteMixerNetID","_recipeClassName","_player","_concreteMixer","_recipeConfig","_components","_equippedMagazines","_hasAllComponents","_componentQuantity","_componentItemClassName","_equippedComponentQuantity","_i"];
_sessionID = _this select 0;
_parameters = _this select 1;
_concreteMixerNetID = _parameters select 0;
_recipeClassName = _parameters select 1;
try 
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then 
	{
		throw "Unknown player!";
	};
	if !(alive _player) then 
	{
		throw "The dead cannot use the concrete mixer!";
	};
	_concreteMixer = objectFromNetid _concreteMixerNetID;
	if (isNull _concreteMixer) then 
	{
		throw "Unknown concrete mixer!";
	};
	if (_concreteMixer getVariable ["IsMixing", false]) then 
	{
		throw "Concrete mixer is already in use!";
	};
	if ((_player distance _concreteMixer) > 10) then 
	{
		throw "No long distance mixing!";
	};
	if !(isClass (missionConfigFile >> "CfgCraftingRecipes" >> _recipeClassName)) then 
	{
		throw "Invalid mixing recipe!";
	};
	_recipeConfig = missionConfigFile >> "CfgCraftingRecipes" >> _recipeClassName;
	_components = getArray(_recipeConfig >> "components");
	_equippedMagazines = magazines _player;
	_hasAllComponents = true;
	{
		_componentQuantity = _x select 0;
		_componentItemClassName = _x select 1;
		_equippedComponentQuantity = { _x == _componentItemClassName } count _equippedMagazines;
		if (_equippedComponentQuantity < _componentQuantity ) then
		{
			_hasAllComponents = false;
		};
	}
	forEach _components;
	if !(_hasAllComponents) then 
	{
		throw "Missing components!";
	};
	{
		_componentQuantity = _x select 0;
		_componentItemClassName = _x select 1;
		for "_i" from 1 to _componentQuantity do 
		{
			_player removeItem _componentItemClassName;
		};
	}
	forEach _components;
	[_concreteMixer, _recipeClassName] spawn ExileServer_object_concreteMixer_mixingProcess;
}
catch 
{
	[_sessionID, "toastRequest", ["ErrorTitleOnly", [_exception]]] call ExileServer_system_network_send_to;
};