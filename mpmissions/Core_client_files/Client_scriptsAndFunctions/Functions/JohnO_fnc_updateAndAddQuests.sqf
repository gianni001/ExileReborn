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
				_newScore = ExileClientPlayerScore + _addrespect;
			    ENIGMA_UpdateStats = [player,_newScore];
			    publicVariableServer "ENIGMA_UpdateStats";

				["InfoTitleAndText",
					[
			            "XM8 Familiarization complete",
			            format ["You have familiarized your self with your XM8 device, explore other apps and functions on the device - %1 respect earned", _addRespect]
				    ]
			    ] call ExileClient_gui_toaster_addTemplateToast;

			    [Quest_chapter1_turnOn8G_taskAdd] call ExileClient_system_thread_removeTask;
			    profileNamespace setVariable ["ExileReborn_quest_chapterOneStatus",1];
			    [] call JohnO_fnc_updateAndAddQuests;
			}	
		};

		Quest_chapter1_turnOn8G_taskAdd = [2, Check_8G_enabled, [], true] call ExileClient_system_thread_addtask;
	};
	
	/********************************************************************************************************************************************************************************************/
	/** Chapter 2
	/********************************************************************************************************************************************************************************************/

	case 1:
	{
		["InfoTitleAndText", ["Exile Reborn - Tutorial Two", "Coming soon.."]] call ExileClient_gui_toaster_addTemplateToast;
	};
};