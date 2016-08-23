/**
 * ExileServer_util_setDamageTexture
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_constructionObject","_damage"];
_constructionObject = _this;
_damage = _constructionObject getVariable ["ExileConstructionDamage",0];
if(_damage isEqualTo 0)then
{
	{
		_constructionObject setObjectTextureGlobal [_forEachIndex, _x];
	}
	forEach (getArray (configFile >> "CfgVehicles" >> (typeOf _constructionObject) >> "hiddenSelectionsTextures"));
	{
		_constructionObject setObjectMaterialGlobal [_forEachIndex, _x];
	}
	forEach (getArray (configFile >> "CfgVehicles" >> (typeOf _constructionObject) >> "hiddenSelectionMaterials"));
}
else
{
	{
		_constructionObject setObjectTextureGlobal [_forEachIndex, _x];
	}
	forEach (getArray (configFile >> "CfgVehicles" >> (typeOf _constructionObject) >> format ["damageLevel%1Textures", _damage]));
	{
		_constructionObject setObjectMaterialGlobal [_forEachIndex, _x];
	}
	forEach (getArray (configFile >> "CfgVehicles" >> (typeOf _constructionObject) >> format ["damageLevel%1Materials", _damage]));
};
true