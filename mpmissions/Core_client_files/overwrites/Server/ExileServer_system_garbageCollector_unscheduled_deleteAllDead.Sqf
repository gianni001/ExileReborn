/**
 * ExileServer_system_garbageCollector_unscheduled_deleteAllDead
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_lifeTime","_diedAt"];
_lifeTime = 60 * getNumber (configFile >> "CfgSettings" >> "GarbageCollector" >> "Ingame" >> "AllDead" >> "lifeTime");
{
	_diedAt = _x getVariable ["ExileDiedAt", -1];
	_ignore = _x getVariable ["ExileReborn_garbageCollectionIgnore",-1];
	if (_ignore isEqualTo -1) then
	{	
		if (_diedAt isEqualTo -1) then 
		{
			_x setVariable ["ExileDiedAt", time];
		}
		else 
		{
			if ((time - _diedAt) >= _lifeTime) then
			{
				if !(isPlayer _x) then 
				{
					_x call ExileServer_system_garbageCollector_deleteObject;
				};
			};
		};
	};	
}
forEach allDead;
