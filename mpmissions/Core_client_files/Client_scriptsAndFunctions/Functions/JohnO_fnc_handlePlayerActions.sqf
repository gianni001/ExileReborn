// ** Hunting ** //

if (cursorObject isKindOf "Animal" && !alive cursorObject && !ExileReborn_hasPickUpAction) then
{	
	if (isNil "ExileReborn_hasPickupAction_Current") then
	{	
		ExileReborn_hasPickupAction_Current = player addAction ExileReborn_pickUpAction;
		ExileReborn_hasPickUpAction = true;
		ExileReborn_userActionArray pushBack ExileReborn_hasPickupAction_Current;
	};	
};
if (cursorObject isKindOf "Animal" && !alive cursorObject && !ExileReborn_hasConsumeAction) then
{
	if (isNil "ExileReborn_hasConsumeAction_Current") then
	{	
		ExileReborn_hasConsumeAction_Current = player addAction ExileReborn_consumeAction;
		ExileReborn_hasConsumeAction = true;
		ExileReborn_userActionArray pushBack ExileReborn_hasConsumeAction_Current;
	};	
};
if (cursorObject isKindOf "Animal" && !alive cursorObject && !ExileReborn_hasCookingAction) then
{
	if (isNil "ExileReborn_cookingAction_current") then
	{	
		ExileReborn_cookingAction_current = player addAction ExileReborn_cookingAction;
		ExileReborn_hasCookingAction = true;
		ExileReborn_userActionArray pushBack ExileReborn_cookingAction_current;
	};	
};
if (!((player getVariable ['hasAnimal',-1]) isEqualTo -1) && !(ExileReborn_hasdropAnimalAction)) then
{
	if (isNil "ExileReborn_dropAnimalAction_current") then
	{	
		ExileReborn_dropAnimalAction_current = player addAction ExileReborn_dropAnimalAction;
		ExileReborn_hasdropAnimalAction = true;
		ExileReborn_userActionArray pushBack ExileReborn_dropAnimalAction_current;
	};	
};	

// ** Drying clothes ** //

if ((ExileClientPlayerAttributes select 6 > 0) && !(ExileReborn_hasDryClothesAction) && ((vehicle player) isEqualTo player)) then
{
	if (isNil "ExileReborn_dryClothesAction_current") then
	{	
		ExileReborn_dryClothesAction_current = player addAction ExileReborn_dryClothesAction;
		ExileReborn_hasDryClothesAction = true;
		ExileReborn_userActionArray pushBack ExileReborn_dryClothesAction_current;
	};	
};

// ** Fill sandbag ** //

_types = ["#GdtBeach","#GdtBeach"];

if (((surfaceType (getPos player)) in _types) && !(ExileReborn_hasFillSandBagAction) && ('Exile_Melee_Shovel' isEqualTo (currentWeapon player))) then
{
	if (isNil "ExileReborn_digSandAction_current") then
	{	
		ExileReborn_digSandAction_current = player addAction ExileReborn_filLSandBagAction;
		ExileReborn_hasFillSandBagAction = true;
		ExileReborn_userActionArray pushBack ExileReborn_digSandAction_current;
	};	
};	

// ** Scavenge rubbish ** //

if ([] call JohnO_fnc_canScavenge) then
{
	if (isNil "ExileReborn_scavengAction_current") then
	{	
		ExileReborn_scavengAction_current = player addAction ExileReborn_scavengeAction;
		ExileReborn_hasscavengeAction = true;
		ExileReborn_userActionArray pushBack ExileReborn_scavengAction_current;
	};	
};	

// Handle action removal.

if (!(isNil "ExileReborn_hasPickupAction_Current") && !(cursorObject isKindOf "Animal")) then
{
	player removeAction ExileReborn_hasPickupAction_Current;
	ExileReborn_hasPickUpAction = false;
	ExileReborn_hasPickupAction_Current = nil;
};	
if (!(isNil "ExileReborn_hasConsumeAction_Current") && !(cursorObject isKindOf "Animal")) then
{
	player removeAction ExileReborn_hasConsumeAction_Current;
	ExileReborn_hasConsumeAction = false;
	ExileReborn_hasConsumeAction_Current = nil;
};

if (!(isNil "ExileReborn_cookingAction_current") && !(cursorObject isKindOf "Animal")) then
{
	player removeAction ExileReborn_cookingAction_current;
	ExileReborn_hasCookingAction = false;
	ExileReborn_cookingAction_current = nil;
};	

if !(isNil "ExileReborn_dryClothesAction_current") then
{	
	if ((ExileClientPlayerAttributes select 6 <= 0) || !((vehicle player) isEqualTo player)) then
	{
		player removeAction ExileReborn_dryClothesAction_current;
		ExileReborn_hasDryClothesAction = false;
		ExileReborn_dryClothesAction_current = nil;
	};
};		

if !(isNil "ExileReborn_digSandAction_current") then
{
	if (!((surfaceType (getPos player)) isEqualTo "#GdtBeach") || !('Exile_Melee_Shovel' isEqualTo (currentWeapon player))) then
	{
		player removeAction ExileReborn_digSandAction_current;
		ExileReborn_hasFillSandBagAction = false;
		ExileReborn_digSandAction_current = nil;
	};
};

if (!(isNil "ExileReborn_scavengAction_current") && !([] call JohnO_fnc_canScavenge)) then
{
	player removeAction ExileReborn_scavengAction_current;
	ExileReborn_hasscavengeAction = false;
	ExileReborn_scavengAction_current = nil;
};		

// ** Action cleanup ** //

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
	ExileReborn_dryClothesAction_current = nil;
	ExileReborn_digSandAction_current = nil;
	ExileReborn_scavengAction_current = nil;

	ExileReborn_hasPickUpAction = false;
	ExileReborn_hasConsumeAction = false;
	ExileReborn_hasCookingAction = false;
	ExileReborn_hasdropAnimalAction = false;
	ExileReborn_hasDryClothesAction = false;
	ExileReborn_hasFillSandBagAction = false;
	ExileReborn_hasscavengeAction = false;
};	