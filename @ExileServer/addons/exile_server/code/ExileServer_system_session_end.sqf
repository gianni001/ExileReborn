/**
 * ExileServer_system_session_end
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_index"];
_index = ExileSessionIDs find _this;
if !(_index isEqualTo -1) then
{
	ExileSessionIDs deleteAt _index;
	missionNamespace setVariable [format["ExileSessionPlayerObject%1", _this], nil];
};