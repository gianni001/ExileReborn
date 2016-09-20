private ["_scavengeModels","_scavArray","_isValidObj","_find","_object"];

_scavengeModels = ["garb","sacks_"];
_scavArray = [];
_isValidObj = false;

_object = ([getModelInfo cursorObject, typeOf cursorObject] select 0 select 0); 
if !(isNil "_object") then
{	
	{
		_find = _object find _x; 
		if (_find >= 0) then
		{
			_scavArray pushBack _find;
		};	
	} forEach _scavengeModels;

	if ((count _scavArray > 0) && (player distance cursorObject <3)) then
	{
		_isValidObj = true;
	};
};	
_isValidObj	