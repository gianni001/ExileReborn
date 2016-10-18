private ["_duration","_soundArray","_soundDelay","_lastSound"];

_duration = _this select 0;

_soundArray = ["sounds\hit1.ogg","sounds\hit2.ogg","sounds\hit3.ogg","sounds\hit4.ogg","sounds\hit5.ogg","sounds\hit6.ogg","sounds\hit7.ogg","sounds\hit8.ogg","sounds\hit9.ogg"];

_soundDelay = 10;
_lastSound = time;

sleep 2;

player switchMove "AcinPercMrunSnonWnonDf_agony";
ExileReborn_playerIsKnockedOut = true;
disableUserInput true;

cutText ["","BLACK OUT",5];

while {_duration > 0} do
{
	_duration = _duration - 1;
	
	if (time - _soundDelay >= _lastSound) then
	{
		_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
		_soundToPlay = _soundPath + (selectRandom _soundArray);
		playSound3D [_soundToPlay, player, false, getPos player, 10, 1, 35];

		_lastSound = time;
	};	

	titleText [format["Unconcious - %1",_duration],"PLAIN"];
	if !(alive player) exitWith {};
	uiSleep 1;
};	

cutText ["","BLACK IN",5];

ExileReborn_playerIsKnockedOut = false;

disableUserInput false;