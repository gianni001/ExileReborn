private ["_player","_animal"];

_animal = _this select 0;

_animal setVariable ["ExileReborn_animal_diedAt",time,true];
_animal setVariable ["ExileReborn_animal_isCold",-1,true];

Event_warmAnimals pushBack _animal;