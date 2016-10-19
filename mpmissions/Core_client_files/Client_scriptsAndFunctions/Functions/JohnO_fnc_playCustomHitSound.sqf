private ["_soundArray"];

_soundArray = ["sounds\hit1.ogg","sounds\hit2.ogg","sounds\hit3.ogg","sounds\hit4.ogg","sounds\hit5.ogg","sounds\hit6.ogg","sounds\hit7.ogg","sounds\hit8.ogg","sounds\hit9.ogg"];

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + (selectRandom _soundArray);
playSound3D [_soundToPlay, player, false, getPos player, 10, 1, 35];

uiSleep 3;

ExileRebornClient_CustomHit_soundIsPlaying = false;