{
	_position = _x select 0;
	_time = _x select 1;

	if (_time >= time) then
	{	
		_smoke = createVehicle ["SmokeShell",_position,[], 0, "can_collide"];
	}
	else
	{
		Event_HeliCrash_Positions deleteAt _forEachIndex;
		publicVariable "Event_HeliCrash_Positions";
	};	
} forEach Event_HeliCrash_Positions;	

//hint str Event_HeliCrash_Positions;

