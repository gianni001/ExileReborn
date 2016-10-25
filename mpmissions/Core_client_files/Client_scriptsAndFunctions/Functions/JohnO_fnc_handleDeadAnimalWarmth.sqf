private ["_hasAnimal","_isWarmAnimal"];

_hasAnimal = player getVariable ["hasAnimal",-1];

if !(_hasAnimal isEqualTo -1) then
{	
	_isWarmAnimal = _hasAnimal getVariable ["ExileReborn_animal_isCold",1];

	if !(_isWarmAnimal isEqualTo 1) then
	{
		[[[5,1,120]],"The animal carcass has warmed you up",0,false] call JohnO_fnc_customConsume;
	};
};		