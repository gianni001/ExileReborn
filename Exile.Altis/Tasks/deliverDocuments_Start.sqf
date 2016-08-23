/*
_caller = _this select 0;
_action = _this select 2;
_caller removeAction _action;
*/

if (isNil "playerHasDocuments") then
{
	playerHasDocuments = false;
};	

if !(playerHasDocuments) then
{	
	playerHasDocuments = true;

	deliverDocuments = player createSimpleTask ["Deliver documents to the west"];

	deliverDocuments setSimpleTaskDescription 
	[
	   "The traders need to keep their paper work in order, but times are tough and they need someone to deliver some documents, email and fax machines do not work very well on the island..take these documents to the western trader, speak to the guards",
	   "Deliver documents",
	   ""
	];
	deliverDocuments setTaskState "ASSIGNED";
	deliverDocuments setSimpleTaskDestination [2993.2,18167,0.353821];

	["InfoTitleAndText", ["Deliver documents", "Thanks, now take these documents to the western trader guard"]] call ExileClient_gui_toaster_addTemplateToast;
}
else
{
	["InfoTitleAndText", ["Task not completed", "You already have a task to deliver documents, complete it first!"]] call ExileClient_gui_toaster_addTemplateToast;
};	

