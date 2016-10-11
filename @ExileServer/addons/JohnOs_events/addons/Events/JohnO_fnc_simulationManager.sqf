private ["_aliveUnits","_nearPlayers","_nearVehicles","_nearPlayers","_timeStamp","_diedAt","_nearPlayers_AI","_nearVehicles_AI","_cleanUpCount"];

_aliveUnits = Event_ALLAI_SimulatedUnits; 

{	

	_nearVehicles = getpos _x nearEntities [["Air","Car",'Exile_Unit_Player'], Event_SimulationManager_SimulateRange];
	_nearPlayers = false;
	{
		private "_x";
		if (isPlayer _x) then
		{
			_nearPlayers = true;

		}; 	
	} forEach _nearVehicles;

	if (_nearPlayers) then
	{
		_x enableSimulationGlobal true;
		_x hideObjectGlobal false;
		_aliveUnits = _aliveUnits - [_x]; 
	}
	else
	{
		_x enableSimulationGlobal false;
		_x hideObjectGlobal true;
	};

} forEach _aliveUnits;

/****************** Deletion of units added to the cleanup manager *************************/
Event_simulationManager_cleanUpCount = 0;
{
	_timeStamp = _x getVariable "JohnO_RoaminAI";
	_nearVehicles_AI = getpos _x nearEntities [["Air","Car",'Exile_Unit_Player'], 100];
	_nearPlayers_AI = false;
	{
		private "_x";
		if (isPlayer _x) then
		{
			_nearPlayers_AI = true;
		}; 	
	} forEach _nearVehicles_AI;

	if !(isNil "_timeStamp") then
	{
		if ((time >= _timeStamp) && !(_nearPlayers_AI)) then
		{
			deleteVehicle _x;
			Event_ALLAI_SimulatedUnits = Event_ALLAI_SimulatedUnits - [_x];
			Event_simulationManager_cleanUpCount = Event_simulationManager_cleanUpCount + 1;
		};
	};		
} forEach AllUnits;

if (Event_extraDebugLogging) then
{
	if (Event_simulationManager_cleanUpCount > 0) then
	{	
		format ["[CLEANUP MANAGER] Deleted %1 units",Event_simulationManager_cleanUpCount] call ExileServer_util_log;
	};
};	
/****************** Delete Objects and markers **************************/

{
	_index = _forEachIndex;
	_objectArray = Event_Cleanup_objectArray select _index;
	_object = _objectArray select 0;
	_time = _objectArray select 1;
	_isMarker = _objectArray select 2;

	if (time >= _time) then
	{
		if (_isMarker) then
		{	
			_nearVehicles_object = getMarkerPos _object nearEntities [["Air","Car",'Exile_Unit_Player'], 100];
			_nearPlayers_object = false;
			{
				private "_x";
				if (isPlayer _x) then
				{
					_nearPlayers_object = true;
				}; 	
			} forEach _nearVehicles_object;
			if !(_nearPlayers_object) then
			{	
				deleteMarker _object;
				Event_Cleanup_objectArray deleteAt _forEachIndex;
			};	
		}
		else
		{
			_nearVehicles_object = getPos _object nearEntities [["Air","Car",'Exile_Unit_Player'], 100];
			_nearPlayers_object = false;
			{
				private "_x";
				if (isPlayer _x) then
				{
					_nearPlayers_object = true;

				}; 	
			} forEach _nearVehicles_object;
			if !(_nearPlayers_object) then
			{	
				deleteVehicle _object;
				Event_Cleanup_objectArray deleteAt _forEachIndex;
			};	
		};
	};	

	//hint str Event_Cleanup_objectArray;
	
} forEach Event_Cleanup_objectArray;

/************* Monitor animal warm *******************************/

{
	_diedAt = _x getVariable ["ExileReborn_animal_isWarm",-1];
	if !(_diedAt isEqualTo -1) then
	{	
		if (time - Event_animalWarth_Duration >= _diedAt) then
		{
			_x setVariable ["ExileReborn_animal_isCold",1,true];
		};
	};		
} forEach Event_warmAnimals;