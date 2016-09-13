private ["_pickUpAction","_consumeAction","_hasPickUpAction","_playerhasCookingAction"];

ExileReborn_hasPickUpAction = false;
ExileReborn_hasConsumeAction = false;
ExileReborn_hasCookingAction = false;

ExileReborn_pickUpAction =
["Tie animal to belt",
{

	if ((player getVariable ["hasAnimal",-1]) isEqualTo -1) then
	{	

		_animal = cursorObject;

		if (typeOf cursorObject isEqualTo "Rabbit_F") then
		{
			deleteVehicle cursorObject;
			
			_bugs = createAgent ["Rabbit_F", position player, [], 0, "FORM"];
			_bugs setDamage 1;
			_animal = _bugs;
		};	

		_caller = _this select 0;
		_action = _this select 2;
		_caller removeAction _action;
		ExileReborn_hasPickUpAction = false;
		player setVariable ["hasAnimal",_animal];
		_animal attachTo [player, [0, 0, 1] ]; 
		_animal hideObjectGlobal true;
		_animal setVariable ["ExileReborn_garbageCollectionIgnore",1,true];

		player addAction ["Drop animal",
		{
			private ["_hiddenObject","_deadAnimal"];
			_intersectingObjectArray = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0, 0, 0], AGLToASL positionCameraToWorld [0, 0, 1600], vehicle player, objNull, true, 1, "VIEW", "FIRE"];
			_position = ASLtoAGL ((_intersectingObjectArray select 0) select 0);	

			_deadAnimal = player getVariable ['hasAnimal',-1];

			if !(_deadAnimal isEqualTo -1) then
			{
				detach _deadAnimal;
				_deadAnimal hideObjectGlobal false;
				if (_position distance player < 3) then
				{	
					_deadAnimal setPos _position;
				}
				else
				{
					_deadAnimal setPos position player;
				};	
				player setVariable ["hasAnimal",-1];

				_caller = _this select 0;
				_action = _this select 2;
				_caller removeAction _action;
			};

		},"",0,false,true,"","!(player getVariable ['hasAnimal',-1] isEqualTo -1)"];
	}
	else
	{
		[
			"ErrorTitleAndText", 
			["Hunting info", "You are already carrying an animal"]
		] call ExileClient_gui_toaster_addTemplateToast;
	};	

},"",0,false,true,"","cursorObject isKindOf 'Animal' && _target distance cursorObject < 2 && !alive cursorObject"];


ExileReborn_consumeAction =
["Consume",
{
	_caller = _this select 0;
	_action = _this select 2;
	_caller removeAction _action;
	ExileReborn_hasConsumeAction = false;

	_amountLeft = cursorObject getVariable ["AmountLeft",-1];
	_isCooked =  cursorObject getVariable ["animalIsCooked",-1];
	if (_isCooked isEqualTo 1) then
	{	
		if !(_amountLeft <= 0) then
		{	
			player addItem "Exile_Item_BeefParts";
			["Exile_Item_BeefParts"] execVM "JohnO_script_consumeAnimal.sqf"; 
			_amountLeft = _amountLeft - 1;
			cursorObject setVariable ["AmountLeft",_amountLeft,true];
		}
		else
		{
			[
				"ErrorTitleAndText", 
				["Consume info", "There is no edible meat left on this animal"]
			] call ExileClient_gui_toaster_addTemplateToast;
		};
	}
	else
	{
		[
			"ErrorTitleAndText", 
			["Consume info", "This animal is not cooked yet"]
		] call ExileClient_gui_toaster_addTemplateToast;
	};		
},"",0,false,true,"","!(cursorObject getVariable ['AmountLeft',-1] isEqualTo -1) && _target distance cursorObject <2"];

ExileReborn_cookingAction = 
["Start cooking",
{

	_caller = _this select 0;
	_action = _this select 2;
	_caller removeAction _action;

	if ((cursorObject getVariable ["AmountLeft",-1]) isEqualTo -1) then
	{	
		if ([(getPos cursorObject),3] call ExileClient_util_world_isFireInRange) then
		{	
			ExileReborn_hasCookingAction = false;
			cursorObject setVariable ["AmountLeft",10,true];

			[cursorObject] spawn
			{
				private ["_deadAnimal","_timer","_timeToCook","_caller","_action"];
				_deadAnimal = _this select 0;
				
				_timeToCook = 60;
				_timer = 0;
				while {_timer < _timeToCook} do
				{
					_timer = _timer + 1;
				
					uiSleep 1;
				};
				_deadAnimal setVariable ["animalIsCooked",1,true];
			};
		}
		else
		{
			ExileReborn_hasCookingAction = false;
			[
				"ErrorTitleAndText", 
				["Cooking info", "You need to place the animal closer to a fire"]
			] call ExileClient_gui_toaster_addTemplateToast;
		};
	}
	else
	{
		ExileReborn_hasCookingAction = false;
		[
			"ErrorTitleAndText", 
			["Cooking info", "This animal is cooked already"]
		] call ExileClient_gui_toaster_addTemplateToast;
	};			
},"",0,false,true,"",""];