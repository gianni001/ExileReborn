/**
 * ExileServer_system_process_noobFilter
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_arsenal","_weaponClassNames","_className","_linkedItems","_i"];
_arsenal = "true" configClasses (missionConfigFile >> "CfgExileArsenal");
_weaponClassNames = [];
{
	_className = configName _x;
	try 
	{
		if (isClass (configFile >> "CfgWeapons" >> _className >> "LinkedItems")) then 
		{
			_linkedItems = "true" configClasses (configFile >> "CfgWeapons" >> _className >> "LinkedItems");
			{
				if (isText(_x >> "item")) then 
				{
					if !((getText (_x >> "item")) isEqualTo "") then 
					{
						throw true;
					};
				};
			}
			forEach _linkedItems;
		};
	}
	catch 
	{
		_weaponClassNames pushBack _className;
	};
}
forEach _arsenal;
if ((count _weaponClassNames) > 0) then 
{
	for "_i" from 0 to 100 do 
	{
		"ERROR! ERROR! ERROR! ERROR! ERROR! ERROR!" call ExileServer_util_log;
	};
	"You have added weapons to your server that spawn in with attachments." call ExileServer_util_log;
	"This will allow duping and money farming!" call ExileServer_util_log;
	"To solve this, please remove the following weapons from your loot tables and trader config OR replace them with their non-attachment equivalent:" call ExileServer_util_log;
	format ["%1", _weaponClassNames] call ExileServer_util_log;
	"Example: Use arifle_Katiba_F instead of arifle_Katiba_ACO_pointer_snds_F." call ExileServer_util_log;
};
