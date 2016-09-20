private ["_object","_hideorShow","_player"]; 

_player = (_this select 0) call ExileServer_system_session_getPlayerObject;
_object = objectFromNetId (_this select 1 select 0);
_hideorShow = (_this select 1 select 1);

if (_hideorShow) then
{
	_object hideObjectGlobal true;
}
else
{
	_object hideObjectGlobal false;
};	
