private ["_hintArray","_hint"];

_hint = ExileReborn_hintArray select 0;

titleText [format ["%1", _hint], "PLAIN DOWN"];

ExileReborn_hintArray deleteAt 0;

ExileReborn_hintArray pushBack _hint;