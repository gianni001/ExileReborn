if (isNil "playerHasDocuments") then
{
	playerHasDocuments = false;
};	

if (playerHasDocuments) then
{	
	playerHasDocuments = false;
	deliverDocuments setTaskState "SUCCEEDED";

	_addRespect = 300;	
	_newScore = ExileClientPlayerScore + _addrespect;
    ENIGMA_UpdateStats = [player,_newScore];
    publicVariableServer "ENIGMA_UpdateStats";

	["InfoTitleAndText",
		[
            "Thanks!",
            format ["Thanks for delivering the documents you have earnt %1 respect for your efforts", _addRespect]
	    ]
    ] call ExileClient_gui_toaster_addTemplateToast;
}
else
{
	["InfoTitleAndText", ["No documents", "You need to obtain the documents from the guard at the central trader"]] call ExileClient_gui_toaster_addTemplateToast;
};	