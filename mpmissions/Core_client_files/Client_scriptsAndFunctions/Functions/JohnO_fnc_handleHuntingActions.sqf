private ["_cookingAction"];

if (cursorObject isKindOf "Animal" && !alive cursorObject && !ExileReborn_hasPickUpAction && (cursorObject getVariable ['AmountLeft',-1] isEqualTo -1)) then
{	
	player addAction ExileReborn_pickUpAction;
	ExileReborn_hasPickUpAction = true;
};
if (cursorObject isKindOf "Animal" && !alive cursorObject && !ExileReborn_hasConsumeAction) then
{
	player addAction ExileReborn_consumeAction;
	ExileReborn_hasConsumeAction = true;
};
if (cursorObject isKindOf "Animal" && !alive cursorObject && !ExileReborn_hasCookingAction) then
{
	ExileReborn_cookingAction_current = player addAction ExileReborn_cookingAction;
	ExileReborn_hasCookingAction = true;
};
if ((ExileReborn_hasCookingAction) && !(cursorObject isKindOf "Animal")) then
{
	ExileReborn_hasCookingAction = false;
	player removeAction ExileReborn_cookingAction_current;
};	