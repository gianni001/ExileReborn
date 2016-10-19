/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_unit","_selectionName","_amountOfDamage","_sourceOfDamage","_typeOfProjectile"];
_unit             = _this select 0;
_selectionName    = _this select 1;
_amountOfDamage   = _this select 2;
_sourceOfDamage   = _this select 3;
_typeOfProjectile = _this select 4;

_chanceForKnockDown = [_typeOfProjectile] call JohnO_fnc_getBulletRating;
_duration = _chanceForKnockDown + 20;

if (_chanceForKnockDown >= random 100) then
{
	if !(ExileReborn_playerIsKnockedOut) then
	{
		if (ExileClientIsAutoRunning) then
		{
			call ExileClient_system_autoRun_stop;
		};
			
		[_duration] spawn JohnO_fnc_maintainKnockOut;
	};	
};	

if (_typeOfProjectile == "") then
{
}
else
{	
	if !(vehicle player != player) then 
	{
		player setBleedingRemaining 90;

		player setVariable ["JohnO_lastSourceOfDamage",_sourceOfDamage,true];

		if !(ExileReborn_playerIsWounded) then
		{	
			ExileReborn_playerIsWounded = true;
			ExileReborn_woundWasTreated = false;
			profileNamespace setVariable ["ExileReborn_playerIsWounded",ExileReborn_playerIsWounded];
			profileNamespace setVariable ["ExileReborn_woundWasTreated",ExileReborn_woundWasTreated];
		};	

		if !(ExileRebornClient_CustomHit_soundIsPlaying) then
		{
			ExileRebornClient_CustomHit_soundIsPlaying = true;
			[] spawn JohnO_fnc_playCustomHitSound;
		};	

		titleText["","WHITE OUT",0.2];
		titleText["","WHITE IN",0.2];
	};	
};	


 

