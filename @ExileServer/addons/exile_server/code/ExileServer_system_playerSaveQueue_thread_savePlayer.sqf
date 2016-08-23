/**
 * ExileServer_system_playerSaveQueue_thread_savePlayer
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_playerObject"];
if !(ExileSystemPlayerSaveASYNC isEqualTo []) then
{
	{
		_playerObject = _x;
		if (!isNull _playerObject) then
		{
			_playerObject call ExileServer_object_player_database_update;
		};
	} 
	forEach ExileSystemPlayerSaveASYNC;
	ExileSystemPlayerSaveASYNC = [];
};