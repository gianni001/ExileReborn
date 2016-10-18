/**
 * ExileClient_object_player_event_onHit
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_damage"];
_damage = _this select 2;
if !(ExilePlayerInSafezone) then
{
	[_damage * 10] call BIS_fnc_bloodEffect;
	ExileClientPlayerIsInCombat = true;
	ExileClientPlayerLastCombatAt = diag_tickTime;
	true call ExileClient_gui_hud_toggleCombatIcon;
};

if !(ExileRebornClient_CustomHit_soundIsPlaying) then
{
	ExileRebornClient_CustomHit_soundIsPlaying = true;
	[] spawn JohnO_fnc_playCustomHitSound;
};	

titleText["","WHITE OUT",0.2];
titleText["","WHITE IN",0.2];

true