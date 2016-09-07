private ["_listOfCrashSites","_crashPos","_crashGridPos"];

if (isNil "Event_HeliCrash_Positions") then
{
	Event_HeliCrash_Positions = [];
};	

_listOfCrashSites = [];

{
	_listOfCrashSites pushBack (_x select 0);

} forEach Event_HeliCrash_Positions;

if !(_listOfCrashSites isEqualTo []) then
{	
	_crashPos = selectRandom _listOfCrashSites;	
	_crashGridPos = mapGridPosition _crashPos;
}
else
{
	_crashGridPos = -1;
};	

_crashGridPos