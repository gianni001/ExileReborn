/*

	Handle custom medical actions applied on the player

*/

if (("Exile_Item_Bandage" in (magazines player)) && !(ExileReborn_bandageAction)) then
{	
	ExileReborn_bandageAction = true;
	player addAction ["Apply Bandage","JohnO_script_applyBandageToPlayer.sqf","",0,false,true,"","'Exile_Item_Bandage' in (magazines _target) && isBleeding cursorTarget && _target distance cursorTarget < 2"];
};
if (("Exile_Item_InstaDoc" in (magazines player)) && !(ExileReborn_instaDocAction)) then
{	
	ExileReborn_instaDocAction = true;
	player addAction ["Apply InstaDoc","JohnO_script_applyInstaDocToPlayer.sqf","",0,false,true,"","'Exile_Item_InstaDoc' in (magazines _target) && _target distance cursorTarget < 2"];
};
if !(ExileReborn_pressureAction) then
{	
	ExileReborn_pressureAction = true;
	player addAction ["Apply Pressure","JohnO_script_applyPressureToWound.sqf","",0,false,true,"","isBleeding cursorTarget && _target distance cursorTarget < 2"];
};

