private ["_duration"];

_duration = _this select 0;

sleep 2;

player switchMove "AcinPercMrunSnonWnonDf_agony";
ExileReborn_playerIsKnockedOut = true;
disableUserInput true;

cutText ["","BLACK OUT",5];

while {_duration > 0} do
{
	_duration = _duration - 1;
	//hint str _duration;
	titleText [format["Unconcious - %1",_duration],"PLAIN"];
	if !(alive player) exitWith {};
	uiSleep 1;
};	

cutText ["","BLACK IN",5];

ExileReborn_playerIsKnockedOut = false;

disableUserInput false;