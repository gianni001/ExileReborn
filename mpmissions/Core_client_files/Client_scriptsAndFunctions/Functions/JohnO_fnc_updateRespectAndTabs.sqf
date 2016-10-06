/*

	JohnO_fnc_updateRespectAndTabs

*/

private ["_respectChange","_popTabsChange","_isIncrease"];

_respectChange = _this select 0;
_popTabsChange = _this select 1;
_isIncrease = _this select 2;

if (_isIncrease) then
{	
	ExileClientPlayerScore = ExileClientPlayerScore + _respectChange;
}
else
{
	ExileClientPlayerScore = ExileClientPlayerScore - _respectChange;
};	

["updateRespectAndTabs", [_respectChange,_popTabsChange,_isIncrease]] call ExileClient_system_network_send;
[] call ExileClient_object_player_save;