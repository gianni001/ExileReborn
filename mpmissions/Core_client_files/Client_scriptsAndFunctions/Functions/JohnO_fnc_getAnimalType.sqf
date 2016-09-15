private ["_animal","_small","_medium","_large","_meat"];

_animal = _this select 0;

_small =
[
	"Rabbit_F"
];

_medium =
[
	"Exile_Animal_Rooster_Gold", 
	"Exile_Animal_Rooster_Brown", 
	"Exile_Animal_Rooster_White"
];

_large =
[
	"Exile_Animal_Sheep_Beige", 
	"Exile_Animal_Sheep_White", 
	"Exile_Animal_Sheep_Brown", 
	"Exile_Animal_Sheep_Spotted", 
	"Exile_Animal_Sheep_Tricolor",
	"Exile_Animal_Goat_Black", 
	"Exile_Animal_Goat_Dirty", 
	"Exile_Animal_Goat_White", 
	"Exile_Animal_Goat_Old", 
	"Exile_Animal_Goat_Spotted"
];

if (typeOf _animal in _small) then
{
	_meat = 4;
}
else
{
	if (typeOf _animal in _medium) then
	{
		_meat = 7;
	}
	else
	{
		if (typeOf _animal in _large) then
		{
			_meat = 11;
		};	
	};	
};
_meat	