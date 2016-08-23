
/*

	paramters:
	
	_typeOfProjectile


*/

_bullet = _this select 0;

_lowChance = 
[
	//small arms
	
	//APEX
	"B_580x42_Ball_F",
	"B_762x39_Ball_F",
	"B_762x39_Ball_Green_F",
	"B_545x39_Ball_F",
	"B_545x39_Ball_Green_F",
	"B_556x45_Ball",
	"B_556x45_Ball_Tracer_Red",
	"B_556x45_Ball_Tracer_Green",
	"B_556x45_Ball_Tracer_Yellow",
	"B_65x39_Caseless",
	"B_65x39_Caseless_green",
	"B_65x39_Caseless_yellow",
	"B_65x39_Minigun_Caseless_Red_splash",
	"B_65x39_Case",
	"B_65x39_Case_Green",
	"B_65x39_Minigun_Caseless_Green_splash",
	"B_65x39_Case_Yellow",
	"B_65x39_Minigun_Caseless_Yellow_splash"	

];

_mediumChance = 
[
	//APEX
	"B_50BW_Ball_F",
	"B_762x51_Ball",
	"B_762x54_Ball",
	"B_762x51_Tracer_Red",
	"B_762x51_Tracer_Yellow",
	"B_762x51_Tracer_Green",
	"B_762x54_Tracer_Green",
	"B_762x51_Minigun_Tracer_Red_splash",
	"B_762x51_Minigun_Tracer_Yellow_splash"

];

_highChance =
[		
	"B_127x54_Ball",
	"B_93x64_Ball",
	"B_338_Ball",
	"B_338_NM_Ball",
	"B_408_Ball",
	"B_127x108_Ball",
	"B_127x99_Ball",
	"B_127x99_Ball_Tracer_Red",
	"B_127x99_Ball_Tracer_Green",
	"B_127x99_Ball_Tracer_Yellow",
	"B_127x108_APDS"
];

_chance = 0;

if (_bullet in _lowChance) then
{
	_chance = 5;
};
if (_bullet in _mediumChance) then
{
	_chance = 55;
};
if (_bullet in _highChance) then
{
	_chance = 100;
};

_chance
