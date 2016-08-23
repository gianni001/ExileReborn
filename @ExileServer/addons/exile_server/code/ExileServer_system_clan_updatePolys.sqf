/**
 * ExileServer_system_clan_updatePolys
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_clanID","_hash","_polys","_members"];
_clanID = _this;
_hash = missionNameSpace getVariable [format["ExileServer_clan_%1",_clanID],[]];
_polys = _hash select 4;
if!(_hash isEqualTo [])then
{
	_members = _hash call ExileClient_util_clan_getClanMembers;
	if(!(_members isEqualTo []))then
	{
		{
			if(!(isNull _x))then
			{
				[_x,"updatePolys",[_polys]] call ExileServer_system_network_send_to;
			};		
		}
		forEach _members;
	};
};
true