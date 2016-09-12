/**
 * ExileClient_system_thread_initialize
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
scriptName 'ExileClient Main Thread';
ExileSystemSpawnThread = [];
ExileSystemThreadDelays = [];
ExileSystemMainTimer = time;
ExileSystemThreadSleep = 0.01;
ExileSystemThreadID = 10000;
[] spawn 
{
	waitUntil {!isNil "ExileClientLoadedIn"};
	"Main thread started" call ExileClient_util_log;
	while {true} do
	{
		if !(ExileSystemSpawnThread isEqualTo []) then
		{
			{
				if (ExileSystemMainTimer > (((_x select 1) + (_x select 0)) - ExileSystemThreadSleep)) then
				{
					(_x select 3) call (_x select 2);
					_x set [1, time];
					if !(_x select 5) then
					{
						[_x select 4] call ExileClient_system_thread_removeTask;
					};
				};
			} 
			forEach ExileSystemSpawnThread;
		};
		//onEachFrame {};
		ExileSystemMainTimer = time;
		uiSleep ExileSystemThreadSleep;
	};
};