/*

	ExileServer_JohnO_network_updateRespectAndTabs
	
*/

private ["_player","_respectChange","_popTabsChange","_isIncrease","_currentRespect","_currentPopTabs","_newRespect","_newMoney"];

_player = (_this select 0) call ExileServer_system_session_getPlayerObject;

_respectChange = (_this select 1 select 0);
_popTabsChange = (_this select 1 select 1);
_isIncrease = (_this select 1 select 2);

_currentRespect = _player getVariable ["ExileScore",0];
_currentPopTabs = _player getVariable ["ExileMoney",0];

switch (_isIncrease) do
{
	case true:
	{
		_newRespect = _currentRespect + _respectChange;
		_newMoney = _currentPopTabs + _popTabsChange;
	};
	case false:
	{
		_newRespect = _currentRespect - _respectChange;
		_newMoney = _currentPopTabs - _popTabsChange;
	};
};

_player setVariable ["ExileScore",_newRespect,true];
_player setVariable ["ExileMoney",_newMoney,true];