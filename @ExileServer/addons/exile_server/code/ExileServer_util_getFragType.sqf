/**
 * ExileServer_util_getFragType
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_victim","_killer","_killingPlayer","_type","_victimClanId","_killerClanId"];
_victim = _this select 0;
_killer = _this select 1;
_killingPlayer = _this select 2;
_type = 0;
try 
{
	if (_victim getVariable ["IsPlayingRussianRoulette", false]) then 
	{
		throw 2;
	};
	if (_victim isEqualTo _killer) then
	{
		throw 1;
	};
	if ((vehicle _victim) isEqualTo _killer) then
	{
		throw 3;
	};
	if (isNull _killer) then
	{
		throw 0;
	};
	if (isNull _killingPlayer) then 
	{
		throw 4;
	};
	if ((group _victim) isEqualTo (group _killingPlayer)) then 
	{
		throw 5;
	};
	_victimClanId = _victim getVariable ["ExileClanID", -2];
	_killerClanId = _killer getVariable ["ExileClanID", -3];
	if (!(_victimClanId isEqualTo -1) && (_victimClanId isEqualTo _killerClanId)) then
	{
		throw 5;
	};		
	if (_victim getVariable ["ExileIsBambi", false]) then 
	{
		throw 6;
	};
	throw 7;
}
catch 
{
	_type = _exception;
};
_type