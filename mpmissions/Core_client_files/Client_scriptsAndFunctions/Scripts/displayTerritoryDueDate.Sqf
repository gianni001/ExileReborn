waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''};

uiSleep 45;

_playerUID = getPlayerUID player;
{
    _flag = _x;
    _buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
    if (_playerUID in _buildRights) then
    {
		_nextDueDate = _flag getVariable ["ExileTerritoryMaintenanceDue", [0, 0, 0, 0, 0]];
		_name = _flag getVariable ["ExileTerritoryName", ""];
		_dueDate = format 
		[
			"%3/%2/%1",
			_nextDueDate select 0,
			_nextDueDate select 1,
			_nextDueDate select 2
		];
		["InfoTitleAndText", ["Territory Information", format ["Payment Due for: <t color='#E48A36'>%2</t><br/>Date: <t color='#E48A36'>%1</t><br/>Pay your Base at Office Trader!",_dueDate,_name]]] call ExileClient_gui_toaster_addTemplateToast;
	};
}
forEach (allMissionObjects "Exile_Construction_Flag_Static");