/**
 * ExileServer_system_swapOwnershipQueue_add
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_object","_entity","_localityChanged"];
_object = _this select 0;
_entity = _this select 1;
_localityChanged = false;
if ((typeName _object) isEqualTo "GROUP") then
{
	_localityChanged = _object setGroupOwner (groupOwner _entity);
}
else 
{
	_localityChanged = _object setOwner (owner _entity);
};
if !(_localityChanged) then
{
	ExileServerOwnershipSwapQueue pushBack _this;
};