if (cursorObject isKindOf "Animal" && !alive cursorObject && !ExileReborn_hasPickUpAction && (cursorObject getVariable ['AmountLeft',-1] isEqualTo -1)) then
{	
	ExileReborn_hasPickupAction_Current = player addAction ExileReborn_pickUpAction;
	ExileReborn_hasPickUpAction = true;
};
if (cursorObject isKindOf "Animal" && !alive cursorObject && !ExileReborn_hasConsumeAction) then
{
	ExileReborn_hasConsumeAction_Current = player addAction ExileReborn_consumeAction;
	ExileReborn_hasConsumeAction = true;
};
if (cursorObject isKindOf "Animal" && !alive cursorObject && !ExileReborn_hasCookingAction) then
{
	ExileReborn_cookingAction_current = player addAction ExileReborn_cookingAction;
	ExileReborn_hasCookingAction = true;
};

// Handle action removal.

if (!(isNil "ExileReborn_hasPickupAction_Current") && !(cursorObject isKindOf "Animal")) then
{
	player removeAction ExileReborn_hasPickupAction_Current;
	ExileReborn_hasPickUpAction = false;
};	
if (!(isNil "ExileReborn_hasConsumeAction_Current") && !(cursorObject isKindOf "Animal")) then
{
	player removeAction ExileReborn_hasConsumeAction_Current;
	ExileReborn_hasConsumeAction = false;
};

if (!(isNil "ExileReborn_cookingAction_current") && !(cursorObject isKindOf "Animal")) then
{
	player removeAction ExileReborn_cookingAction_current;
	ExileReborn_hasCookingAction = false;
};	