private ["_center","_region","_blackList","_position"];

_center = _this select 0;
_region = _this select 1;

_blackList = 
[
	[[0, 0],[0,0]]
];

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

_position = [_center,1,10000,1,0,100,1,_blackList] call BIS_fnc_findSafePos;
while {true} do
{
	_position = [_center,1,10000,1,0,100,1,_blackList] call BIS_fnc_findSafePos;
	if (_position distance Event_world_ARMA_fuckYourWierdnessPosition > 200) exitWith {};
};	
_position