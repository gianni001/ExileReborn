private ["_currentMoney","_bribeAmount","_newMoney","_survivor"];

_survivor = _this select 0;

_currentMoney = player getVariable ["ExileMoney",0];

_bribeAmount = 200;

if (_currentMoney > _bribeAmount) then
{
	/*
	_newMoney = _currentMoney - _bribeAmount;
	player setVariable ["ExileMoney",_newMoney,true];
	*/

	[0,_bribeAmount,false] call JohnO_fnc_updateRespectAndTabs;

	_currentChance = _survivor getVariable ["ExileReborn_survivor_chance",0];
	_newChance = _currentChance + 10;
	_survivor setVariable ["ExileReborn_survivor_chance",_newChance,true];

	["InfoTitleAndText",
	    [
	        "Bribed",
	        format ["I have offered the survivor %1 poptabs, hopefully this sways him in my favour",_bribeAmount]
	    ]
	] call ExileClient_gui_toaster_addTemplateToast;
}
else
{
	["ErrorTitleAndText",
	    [
	        "Bribed",
	        format ["The survivor wants nothing less then %1 poptabs",_bribeAmount]
	    ]
	] call ExileClient_gui_toaster_addTemplateToast;
};