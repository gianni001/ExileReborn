/**
 * ExileClient_gui_hud_thread_update
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
call ExileClient_gui_interactionMenu_update;
if( ExileClientPlayerAttributes select 0 != ExileClientPlayerAttributesASecondAgo select 0) then
{
	if (alive player) then
	{
		if !(ExileClientPlayerIsInSecurityCamera) then 
		{
			//ExileClientPostProcessingColorCorrections ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0.39, 0.32, 0.25, 1 - (damage player)], [0.5,0.5,0.5,0], [0,0,0,0,0,0,4]]; 
			ExileClientPostProcessingColorCorrections ppEffectAdjust [1, 1.1, 0, [0, 0, 0, 0], [1.0,0.7, 0.6, 0.60 - (damage player)], [0.20, 0.60, 0.10, 0.0]];
			ExileClientPostProcessingColorCorrections ppEffectCommit 1;
			if (ExileClientPlayerIsBleeding) then
			{
				[ (100 - (ExileClientPlayerAttributes select 0)) * 10 ] call BIS_fnc_bloodEffect;
			};
		};
	};
	ExileClientPlayerAttributesASecondAgo = 
	[
		ExileClientPlayerAttributes select 0,
		ExileClientPlayerAttributes select 1,
		ExileClientPlayerAttributes select 2,
		ExileClientPlayerAttributes select 3,
		ExileClientPlayerAttributes select 4,
		ExileClientPlayerAttributes select 5,
		ExileClientPlayerAttributes select 6
	];
};
true