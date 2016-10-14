private ["_center","_region","_blackList"];

_center = _this select 0;
_region = _this select 1;

_blackList = [];

switch (_region) do
{
	case "West":
	{
		_blackList = Event_world_blackListWEST;
	
	};
	case "East":
	{
		_blackList = Event_world_blackListEAST;
	};
};

_position = [_center,1,Event_world_size,1,0,10,1,_blackList] call BIS_fnc_findSafePos;
_position