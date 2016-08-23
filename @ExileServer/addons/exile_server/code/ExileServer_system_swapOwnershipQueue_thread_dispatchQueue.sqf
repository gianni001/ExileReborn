/**
 * ExileServer_system_swapOwnershipQueue_thread_dispatchQueue
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_removeEntryFromQueue","_entity","_player","_newOwner","_currentOwner","_localityChanged"];
if !(ExileServerOwnershipSwapQueue isEqualTo []) then
{
	{
		_removeEntryFromQueue = false;
		_entity = _x select 0;
		_player = _x select 1;
		if (isNil "_player" || isNil "_entity" ) then
		{
			_removeEntryFromQueue = true;
		}
		else 
		{
			_newOwner = owner _player;
			if (typeName _entity == "GROUP") then
			{
				_currentOwner = objNull;
			}
			else 
			{
				_currentOwner = owner _entity;
			};
			if (isNull _entity || isNull _player) then
			{	
				_removeEntryFromQueue = true;
			}
			else 
			{
				if (_newOwner isEqualTo _currentOwner) then
				{
					_removeEntryFromQueue = true;
				}
				else
				{
					_localityChanged = false;
					if (typeName _entity == "GROUP") then
					{
						_localityChanged = _entity setGroupOwner _newOwner;
					}
					else 
					{
						_localityChanged = _entity setOwner _newOwner;
					};
					if (_localityChanged) then
					{
						_removeEntryFromQueue = true;
					};
				};	 
			};
		};
		if (_removeEntryFromQueue) then
		{
			ExileServerOwnershipSwapQueue deleteAt _forEachIndex;
		};
	}
	forEach ExileServerOwnershipSwapQueue;
};
true