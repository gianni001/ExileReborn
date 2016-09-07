/**
 * ExileClient_gui_map_event_onMouseButtonUp
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_mapControl","_mouseButton","_position","_shift","_ctrl","_alt","_stopPropagation","_maxLines","_control","_buttonControl","_statusControl","_colorDropdown","_render","_color","_renderPosition","_lines","_count","_text","_linesLabel","_linesStatus","_clickPosition","_display","_contextControl"];
_mapControl = _this select 0;
_mouseButton = _this select 1;
_position = [_this select 2,_this select 3];
_shift = _this select 4;
_ctrl = _this select 5;
_alt = _this select 6;
_stopPropagation = false;
if (ExileClientMapPolyMode) then
{
	_maxLines = getNumber(missionConfigFile >> "CfgClans" >> "maximumPolyNode");
	_control = uiNamespace getVariable ["RscExileMapCreatePoly",controlNull];
	_buttonControl = _control controlsGroupCtrl 4002;
	_statusControl = _control controlsGroupCtrl 4001;
	_colorDropdown = _control controlsGroupCtrl 4000;
	if(_mouseButton isEqualTo 0)then
	{
		if((count ExileClientClanMapLineRenderArray) < _maxLines)then
		{
			if(!ExileClientClanMapLineCompleated)then
			{
				_render = [];
				_color = (_colorDropdown lbColor (lbCursel _colorDropdown));
				_renderPosition = _mapControl ctrlMapScreenToWorld _position;
				_renderPosition pushback 0;
				if(_renderPosition call ExileClient_gui_clan_polyAddMenu_isCompleatedPoly)then
				{
					_buttonControl ctrlEnable true;
					_buttonControl ctrlCommit 0;
					_statusControl ctrlSetBackGroundColor [160/255, 223/255, 59/255, 1];
					_statusControl ctrlCommit 0;
					_render = [ExileClientLineLastRenderPos,((ExileClientClanMapLineRenderArray select 0) select 0),_color];
					ExileClientClanMapLineRenderArray pushback _render;
					ExileClientClanMapLineCompleated = true;
				}
				else
				{
					if(ExileClientLineLastRenderPos isEqualTo [0,0,0])then
					{
						_colorDropdown ctrlEnable false;
					}
					else
					{
						_render = [ExileClientLineLastRenderPos,_renderPosition,_color];
						ExileClientClanMapLineRenderArray pushback _render;
					};
					ExileClientLineLastRenderPos = _renderPosition;
				};
			};
		}
		else
		{
			_buttonControl ctrlEnable false;
			_buttonControl ctrlCommit 0;
		};
	}
	else
	{
		if(ExileClientLastMapDown + 0.1 > diag_tickTime)then
		{
			_lines = count ExileClientClanMapLineRenderArray;
			if(_lines > 0)then
			{
				if(ExileClientClanMapLineCompleated)then
				{
					_buttonControl ctrlEnable false;
					_buttonControl ctrlCommit 0;
					_statusControl ctrlSetBackGroundColor [221/255, 38/255, 38/255, 1];
					_statusControl ctrlCommit 0;
					ExileClientClanMapLineCompleated = false;
				};
				if(count ExileClientClanMapLineRenderArray > 1)then
				{
					ExileClientLineLastRenderPos = (ExileClientClanMapLineRenderArray select (_lines - 1)) select 0;
				}
				else
				{
					_colorDropdown ctrlEnable true;
					ExileClientLineLastRenderPos = [0,0,0];
				};
				ExileClientClanMapLineRenderArray deleteAt (_lines -1);
			};
		};
	};
	_count = count ExileClientClanMapLineRenderArray;
	_text = format ["%1/%2",_count,_maxLines];
	_linesLabel = _control controlsGroupCtrl 4004;
	_linesLabel ctrlSetText _text;
	_linesLabel ctrlCommit 0;
	_linesStatus = _control controlsGroupCtrl 4003;
	_linesStatus progressSetPosition (_count/_maxLines);
	_linesStatus ctrlCommit 0;
}
else
{
	switch (_mouseButton) do 
	{
		case 0:
		{
			if (_shift) then
			{
				_clickPosition = _mapControl ctrlMapScreenToWorld _position;
				_clickPosition pushBack 0;
				ExileClientWaypoints pushBack _clickPosition;
				if ((count ExileClientWaypoints) > 1) then 
				{
					ExileClientWaypoints deleteAt 0;
				};
				_stopPropagation = true;
			};
		};
		case 1:
		{
			if !(_shift || _alt || _ctrl) then				
			{
				if(ExileClientLastMapDown + 0.1 > diag_tickTime)then
				{
					_display = ctrlParent _mapControl;
					if!(ExileClientClanInfo isEqualTo [])then
					{
						_contextControl = _display ctrlCreate ["RscExileMapContextMenu",24032];
						_contextControl ctrlSetPosition _position;
						_contextControl ctrlCommit 0;
					};
					ExileClientMapPositionClick = _mapControl ctrlMapScreenToWorld _position;
					ExileClientMapScreenPos = _position;
				};
			};
			_stopPropagation = true;
		};
	};
};
_stopPropagation