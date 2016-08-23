/**
 * ExileServer_system_breaching_network_detonateAllCharges
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_player","_chargesDetonated","_playerUID","_charge","_constructionObject","_owner","_explosiveClassName","_chargePosition","_ammo","_weaponHolderPosition","_weaponHolder","_territory","_serverTime","_currentDamage","_newDamage"];
_sessionID = _this select 0;
_player = _sessionID call ExileServer_system_session_getPlayerObject;
_chargesDetonated = 0;
if !(isNull _player) then
{
	_playerUID = getPlayerUID _player;
	if !(ExileServerBreachingCharges isEqualTo []) then
	{
		{
			_charge = _x select 0;
			_constructionObject = _x select 1;
			_owner = _x select 2;
			if (_owner isEqualTo _playerUID) then
			{
				if !(isNull _constructionObject) then 
				{
					if !(isNull _charge) then
					{
						_explosiveClassName = getText (configFile >> "CfgVehicles" >> (typeOf _charge) >> "ammo");
						_chargePosition = getPosATL _charge;
						deleteVehicle _charge;
						_ammo = createVehicle [_explosiveClassName, _chargePosition, [], 0, "CAN_COLLIDE"];
						_ammo setPosATL _chargePosition;
						_ammo setDamage 1;
						if (_explosiveClassName isEqualTo "Exile_Ammo_BreachingCharge_BigMomma") then 
						{
							_weaponHolderPosition = 
							[
								_chargePosition select 0,
								_chargePosition select 1,
								(getPosATL _constructionObject) select 2
							];
							_weaponHolder = createVehicle ["GroundWeaponHolder", _weaponHolderPosition, [], 0, "CAN_COLLIDE"];
							_weaponHolder setPosATL _weaponHolderPosition;
							_weaponHolder addMagazineCargoGlobal ["Exile_Item_MobilePhone", 1];
						};
						_territory = _constructionObject call ExileClient_util_world_getTerritoryAtPosition;
						_serverTime = time;
						if(_serverTime > ((_territory getVariable ["ExileXM8MobileNotifiedTime",-1800]) + 1800))then
						{
							_territory call ExileServer_system_xm8_sendBaseRaid;
							_territory setVariable ["ExileXM8MobileNotifiedTime", _serverTime];
						};
						_currentDamage = _constructionObject getVariable ["ExileConstructionDamage", 0];
						_newDamage = _currentDamage + 1;
						if (_newDamage > 2) then
						{
							_constructionObject call ExileServer_object_construction_database_delete;
							deleteVehicle _constructionObject;
						}
						else
						{
							_constructionObject setVariable ["ExileConstructionDamage", _newDamage, true];
							_constructionObject setVariable ["ExileBreaching", false, true];
							(format [
							"updateDamage:%1:%2",
							_newDamage,
							_constructionObject getVariable ["ExileDatabaseID",-1]
							]) call ExileServer_system_database_query_fireAndForget;
							_constructionObject call ExileServer_util_setDamageTexture;
						};
					};
				};
				_chargesDetonated = _chargesDetonated + 1;
				ExileServerBreachingCharges deleteAt _forEachIndex;
			};
		}
		forEach ExileServerBreachingCharges;
	};
};
if (_chargesDetonated isEqualTo 0) then 
{
	[_sessionID, "toastRequest", ["InfoTitleOnly", ["There are no breaching charges to detonate."]]] call ExileServer_system_network_send_to;
};