/**
 * ExileServer_system_garbageCollector_unscheduled_deleteGroups
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_deleteGroup","_units","_unit"];
{
	if !(_x isEqualTo ExileServerGraveyardGroup) then 
	{
		_deleteGroup = false;
		_group = _x;
		_units = units _group;
		switch (count _units) do 
		{
			case 0: 
			{
				_deleteGroup = true;
			};
			case 1:
			{
				_unit = _units select 0;
				if !(_unit isKindOf "Exile_Unit_GhostPlayer") then 
				{
					if !(alive _unit) then 
					{
						if (isNull ExileServerGraveyardGroup) then 
						{
							ExileServerGraveyardGroup = createGroup independent;
							ExileServerGraveyardGroup setGroupIdGlobal ["Graveyard"];
						};
						[_unit] joinSilent ExileServerGraveyardGroup;
						_deleteGroup = true;
					};
				};
			};
		};
		if (_deleteGroup) then 
		{
			if (local _group) then 
			{
				deleteGroup _group;
			}
			else 
			{
				[groupOwner _group, "DeleteGroupPlz", [_group]] call ExileServer_system_network_send_to;
			};
		};
	};
}
forEach allGroups;