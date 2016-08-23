private ["_aliveUnits","_nearPlayers","_nearVehicles","_nearPlayers","_timeStamp"];

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

	if (_nearPlayers ) then
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

{
	_timeStamp = _x getVariable "JohnO_RoaminAI";

	if !(isNil "_timeStamp") then
	{
		if (time >= _timeStamp) then
		{
			deleteVehicle _x;
			Event_RoamingAI_CurrentAlive = Event_RoamingAI_CurrentAlive - 1;
			Event_ALLAI_SimulatedUnits = Event_ALLAI_SimulatedUnits - [_x];
		};
	};		
} forEach AllUnits;

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
			deleteMarker _object;
		}
		else
		{
			deleteVehicle _object;
		};

		Event_Cleanup_objectArray deleteAt _forEachIndex;
	};	

	//hint str Event_Cleanup_objectArray;
	
} forEach Event_Cleanup_objectArray;
