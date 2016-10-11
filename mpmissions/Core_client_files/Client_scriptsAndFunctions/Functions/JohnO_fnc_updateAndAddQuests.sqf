uiSleep 15;

ExileReborn_quest_progress = profileNamespace getVariable ["ExileReborn_quest_chapterOneStatus",-1];

switch (ExileReborn_quest_progress) do
{
	case -1:
	{
		Quest_chapter1_turnOn8G = player createSimpleTask ["XM8 Familiarization"];

		Quest_chapter1_turnOn8G setSimpleTaskDescription 
		[
		   "Turn on your XM8 by pressing number 6 then pressing the X - Navigate to settings and turn on your 8G network",
		   "XM8 Familiarization",
		   ""
		];
		Quest_chapter1_turnOn8G setTaskState "ASSIGNED";

		["InfoTitleAndText", ["Exile Reborn - Tutorial One", "You have a new task check your map 'Tasks' for more info"]] call ExileClient_gui_toaster_addTemplateToast;

		Check_8G_enabled =
		{
			if ((player getVariable ["ExileXM8IsOnline", false]) isEqualTo true) then
			{
				Quest_chapter1_turnOn8G setTaskState "SUCCEEDED";
				
			    _addRespect = 300;
				[_addRespect,0,true] call JohnO_fnc_updateRespectAndTabs;

				["InfoTitleAndText",
					[
			            "XM8 Familiarization complete",
			            format ["You have familiarized your self with your XM8 device, explore other apps and functions on the device - %1 respect earned", _addRespect]
				    ]
			    ] call ExileClient_gui_toaster_addTemplateToast;

			    [Quest_chapter1_turnOn8G_taskAdd] call ExileClient_system_thread_removeTask;
			    profileNamespace setVariable ["ExileReborn_quest_chapterOneStatus",1];
			    [] call JohnO_fnc_updateAndAddQuests;
			};	
		};

		Quest_chapter1_turnOn8G_taskAdd = [2, Check_8G_enabled, [], true] call ExileClient_system_thread_addtask;
	};
	
	/********************************************************************************************************************************************************************************************/
	/** Chapter 2
	/********************************************************************************************************************************************************************************************/

	case 1:
	{
		Quest_chapter2_userActions = player createSimpleTask ["Custom user actions"];

		Quest_chapter2_userActions setSimpleTaskDescription 
		[
		   "
		   EXILE Reborn features many custom user actions these include but are not limited to<br/>
		   Healing other players - With the right equipment you can look at other players and provide medical aid.<br/>
		   Scavenging - If you walk up to rubbish piles or sacks, you can scavenge for items, when ready walk upto some rubbish and search to complete this task.<br/>
		   Picking berries - You can search and consume berries at small bushes, when ready walk up to a small bush and search for some berries.<br/>
		   There are many more user actions, and you will see them appear when they are available.
		   ",
		   "Custom user actions",
		   ""
		];
		Quest_chapter2_userActions setTaskState "ASSIGNED";

		["InfoTitleAndText", ["Exile Reborn - Tutorial Two - User actions", "You have a new task check your map 'Tasks' for more info"]] call ExileClient_gui_toaster_addTemplateToast;

		ExileReborn_client_completedScavengeTask = false;
		ExileReborn_client_completedBerryTask = false;

		Check_scavenge_completed =
		{
			if ((ExileReborn_client_completedScavengeTask) && (ExileReborn_client_completedBerryTask)) then
			{
				Quest_chapter2_userActions setTaskState "SUCCEEDED";

			    _addRespect = 300;
				[_addRespect,0,true] call JohnO_fnc_updateRespectAndTabs;

				["InfoTitleAndText",
					[
			            "User action familiarization",
			            format ["You now have a better understanding of Exile Reborn custom user actions, be sure to see what other benefits you can gain from these actions - %1 respect earned", _addRespect]
				    ]
			    ] call ExileClient_gui_toaster_addTemplateToast;

			    [Quest_chapter2_taskAdd] call ExileClient_system_thread_removeTask;
			    profileNamespace setVariable ["ExileReborn_quest_chapterOneStatus",2];
			    [] call JohnO_fnc_updateAndAddQuests;
			};	
		};

		Quest_chapter2_taskAdd = [2, Check_scavenge_completed, [], true] call ExileClient_system_thread_addtask;
	};

	/********************************************************************************************************************************************************************************************/
	/** Chapter 3
	/********************************************************************************************************************************************************************************************/

	case 2:
	{
		Quest_chapter3_survivorsAndBandits = player createSimpleTask ["Survivors and Bandits"];

		Quest_chapter3_survivorsAndBandits setSimpleTaskDescription 
		[
		   "
		   EXILE Reborn features different types of AI<br/>
		   Survivors - These AI look and act just like players, they will loot and roam around. Treat them how you would any other Bambi player<br/>
		   Bandits - These AI are enemies to you, and should be killed on sight.<br/>
		   Survivor AI can be interacted with, you can attempt to get close them and bribe them to follow you. Succesfully get a survivor AI to follow you to complete this task!<br/>
		   ",
		   "Survivors and Bandits",
		   ""
		];
		Quest_chapter3_survivorsAndBandits setTaskState "ASSIGNED";

		["InfoTitleAndText", ["Exile Reborn - Tutorial Three - Survivors and Bandits", "You have a new task check your map 'Tasks' for more info"]] call ExileClient_gui_toaster_addTemplateToast;

		ExileReborn_succesfullyBribed = false;

		Check_survivorsAndBandits_completed =
		{
			if (ExileReborn_succesfullyBribed) then
			{
				Quest_chapter3_survivorsAndBandits setTaskState "SUCCEEDED";

			    _addRespect = 500;
				[_addRespect,0,true] call JohnO_fnc_updateRespectAndTabs;

				["InfoTitleAndText",
					[
			            "Survivors and Bandits",
			            format ["You should now have a better understanding of the AI entities in EXILE Reborn, respect them and survive - %1 respect", _addRespect]
				    ]
			    ] call ExileClient_gui_toaster_addTemplateToast;

			    [Quest_chapter3_taskAdd] call ExileClient_system_thread_removeTask;
			    profileNamespace setVariable ["ExileReborn_quest_chapterOneStatus",3];
			    [] call JohnO_fnc_updateAndAddQuests;
			};	
		};

		Quest_chapter3_taskAdd = [2, Check_survivorsAndBandits_completed, [], true] call ExileClient_system_thread_addtask;
	};

	/********************************************************************************************************************************************************************************************/
	/** Chapter 4
	/********************************************************************************************************************************************************************************************/

	case 3:
	{
		["InfoTitleAndText", ["Exile Reborn - Tutorial Four", "Coming soon..."]] call ExileClient_gui_toaster_addTemplateToast;
	};
};