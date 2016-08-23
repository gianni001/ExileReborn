/*
_caller = _this select 0;
_action = _this select 2;
_caller removeAction _action;
*/

if (isNil "playerHasDocumentsWest") then
{
	playerHasDocumentsWest = false;
};	

if !(playerHasDocumentsWest) then
{	
	playerHasDocumentsWest = true;

	deliverDocumentsWest = player createSimpleTask ["Deliver documents to the north"];

	deliverDocumentsWest setSimpleTaskDescription 
	[
	   "The traders need to keep their paper work in order, but times are tough and they need someone to deliver some documents, email and fax machines do not work very well on the island..takes these documents to the waste dump trader to the north",
	   "Deliver documents",
	   ""
	];
	deliverDocumentsWest setTaskState "ASSIGNED";
	deliverDocumentsWest setSimpleTaskDestination [23336.6,24214.4,0.00115061];

	["InfoTitleAndText", ["Deliver documents", "Thanks, now take these documents to the western trader guard"]] call ExileClient_gui_toaster_addTemplateToast;
}
else
{
	["InfoTitleAndText", ["Task not completed", "You already have a task to deliver documents, complete it first!"]] call ExileClient_gui_toaster_addTemplateToast;
};	

