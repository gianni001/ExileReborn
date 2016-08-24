
private ["_unit","_group","_position","_amountMin","_amountMax","_holder","_marker","_roamingRadius"];

/************************* ROAMING AI BASED OFF PLAYER COUNT ********************************/

TownInvasionEvent = false;
_roamingRadius = 200;

if (Event_RoamingAI_CurrentAlive < Event_RoamingAI_MaxAllowedAI) then
{

	if (random 1 >= 0.7) then
	{
		TownInvasionEvent = true;
		_roamingRadius = 50;
	};	

	_position = [] call JohnO_fnc_findSafeTownPosition;

	Event_RoamingAI_lastTown = _position;	

	if !(TownInvasionEvent) then
	{
		_amountMin = Event_RoamingAI_GroupAmountMin;
		_amountMax = Event_RoamingAI_GroupAmountMax;
	}
	else
	{
		_amountMin = Event_RoamingAI_TownMin;
		_amountMax = Event_RoamingAI_TownMax;
	};	

	[
		_position, 							//Position of AI
		2, 									//Amount of AI groups
		_amountMin,							//Minimum AI per group
		_amountMax,							//Max AI per group
		_roamingRadius,						//Patrol Radius
		true,								//Add to sim manager
		true,								//Add to cleanup manager
		Event_TownInvasion_DespawnTime		//Clean up duration
	] call JohnO_fnc_spawnAIGroup;

	if (TownInvasionEvent) then
	{	
		_marker = createMarker [ format["TownInvasion%1", diag_tickTime],_position];
		_marker setMarkerType "ExileMissionStrongholdIcon";
		_marker setMarkerText "Rioters";
		
		//Event_Cleanup_objectArray pushBack [_marker,time + Event_TownInvasion_DespawnTime,true];

		_holder = createVehicle ["Exile_Container_SupplyBox", getMarkerPos _marker, [], 10, "NONE"];
		Event_Cleanup_objectArray pushBack [_holder,time + Event_TownInvasion_DespawnTime,false];
		Event_HeliCrash_Positions pushBack [position _holder, time + Event_TownInvasion_DespawnTime];
		publicVariable "Event_HeliCrash_Positions";

		_marker setMarkerPos getPos _holder;

		deleteMarker _marker;

		for "_i" from 0 to Event_TownInvasion_AmountOfLoot do
		{	
			_item = [2] call JohnO_fnc_getRandomItems_new;
					
			[_holder, _item] call ExileClient_util_containerCargo_add;

			_magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");	
			_holder addMagazineCargoGlobal [(_magazines select 0), 1 + floor (random 3)];

			if (random 1 > 0.5) then
			{	
				_item = [3] call JohnO_fnc_getRandomItems_new;
				[_holder, _item] call ExileClient_util_containerCargo_add;
			};
			if (random 1 > 0.4) then
			{	
				_item = [4] call JohnO_fnc_getRandomItems_new;
				[_holder, _item] call ExileClient_util_containerCargo_add;	
			};		
		};

		//["toastRequest", ["InfoTitleAndText", ["Riot!", "A local town has been taken over by bandits and is being looted. Clear them out!"]]] call ExileServer_system_network_send_broadcast;
		if (useMarmaLoging) then
		{
			[format["[EVENT: Rioters] Rioters have spawned @ %1",_position]] call MAR_fnc_log;
		};	
	};
};	