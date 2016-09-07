/*

	Return a respect tier between 1 - 5.
	Usage:
	[_respect] call JohnO_fnc_getRespectTier;

*/

private ["_respectAmount","_level"];

_respectAmount = _this select 0;
_level = 0;

if (_respectAmount <= 5000) then
{
	_level = 0;
};	

if ((_respectAmount > 5000) && (_respectAmount <= 10000)) then
{
	_level = 1;
};

if ((_respectAmount > 10000) && (_respectAmount <= 25000)) then
{
	_level = 2;
};

if ((_respectAmount > 25000) && (_respectAmount <= 40000)) then
{
	_level = 3;
};

if ((_respectAmount > 40000) && (_respectAmount <= 55000)) then
{
	_level = 4;
};

if (_respectAmount > 55000) then
{
	_level = 5;
};

_level