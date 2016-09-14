if (cursorObject isKindOf "Animal" && !alive cursorObject && !ExileReborn_hasPickUpAction && (cursorObject getVariable ['AmountLeft',-1] isEqualTo -1)) then
{	
	ExileReborn_hasPickupAction_Current = player addAction ExileReborn_pickUpAction;
	ExileReborn_hasPickUpAction = true;
	ExileReborn_userActionArray pushBack ExileReborn_hasPickupAction_Current;
};
if (cursorObject isKindOf "Animal" && !alive cursorObject && !ExileReborn_hasConsumeAction) then
{
	ExileReborn_hasConsumeAction_Current = player addAction ExileReborn_consumeAction;
	ExileReborn_hasConsumeAction = true;
	ExileReborn_userActionArray pushBack ExileReborn_hasConsumeAction_Current;
};
if (cursorObject isKindOf "Animal" && !alive cursorObject && !ExileReborn_hasCookingAction) then
{
	ExileReborn_cookingAction_current = player addAction ExileReborn_cookingAction;
	ExileReborn_hasCookingAction = true;
	ExileReborn_userActionArray pushBack ExileReborn_cookingAction_current;
};
if (!((player getVariable ['hasAnimal',-1]) isEqualTo -1) && !(ExileReborn_hasdropAnimalAction)) then
{
	ExileReborn_dropAnimalAction_current = player addAction ExileReborn_dropAnimalAction;
	ExileReborn_hasdropAnimalAction = true;
	ExileReborn_userActionArray pushBack ExileReborn_dropAnimalAction_current;
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

if ((time - ExileReborn_userActionTimeout_lastCheck >= ExileReborn_userActionTimeout) || !(alive player))then
{

	ExileReborn_userActionTimeout_lastCheck = time;
	if !(alive player) then
	{	
		if !((player getVariable ['hasAnimal',-1]) isEqualTo -1) then
		{	
			_animal = player getVariable ['hasAnimal',-1];
			detach _animal;
			["hideObjectGlobal", [_animal,false]] call ExileClient_system_network_send;
			player setVariable ['hasAnimal',-1];
		};
	};
	
	{
		player removeAction _x;
	} forEach ExileReborn_userActionArray;

	ExileReborn_userActionArray = [];	

	ExileReborn_hasPickupAction_Current = nil;
	ExileReborn_hasConsumeAction_Current = nil;
	ExileReborn_cookingAction_current = nil;
	ExileReborn_dropAnimalAction_current = nil;

	ExileReborn_hasPickUpAction = false;
	ExileReborn_hasConsumeAction = false;
	ExileReborn_hasCookingAction = false;
	ExileReborn_hasdropAnimalAction = false;

};	