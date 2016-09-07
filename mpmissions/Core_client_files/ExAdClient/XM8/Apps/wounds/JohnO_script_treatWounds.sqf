if ((ExileReborn_playerIsWounded) || (ExileReborn_playerIsInfected)) then
{	
	if (("Exile_Item_PlasticBottleFreshWater" in (magazines player)) && ("Exile_Item_Vishpirin" in (magazines player))) then
	{	
		player playActionNow "medic";
		sleep 4;
		ExileReborn_woundWasTreated = true;
		ExileReborn_playerIsWounded = false;
		profileNamespace setVariable ["ExileReborn_playerIsWounded",ExileReborn_playerIsWounded];
		profileNamespace setVariable ["ExileReborn_woundWasTreated",ExileReborn_woundWasTreated];
		["InfoTitleAndText",
			[
	            "Cleaned wounds",
	            format ["I have cleaned my wounds..I think I will feel better over time"]
		    ]
    	] call ExileClient_gui_toaster_addTemplateToast;

    	player removeItem "Exile_Item_PlasticBottleFreshWater";
    	player removeItem "Exile_Item_Vishpirin";
    }
    else
    {
    	["InfoTitleAndText",
			[
	            "I dont have the items!",
	            format ["I need vishpirin and fresh water to clean my wounds.."]
		    ]
    	] call ExileClient_gui_toaster_addTemplateToast;
	};
}
else
{	
	["InfoTitleAndText",
		[
            "I am fine",
            format ["I am not wounded"]
	    ]
	] call ExileClient_gui_toaster_addTemplateToast;
};	