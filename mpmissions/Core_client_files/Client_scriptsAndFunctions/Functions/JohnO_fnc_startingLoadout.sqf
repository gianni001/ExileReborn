uiSleep 5;

private ["_level","_uniformSelection","_headGearSelection","_uniform","_headGear","_highLevelUniformSelection","_highLevelHeadGearSelection","_nameTag","_safeToExecute","_failSafe"];

_safeToExecute = false;
_failSafe = time + 120;

waitUntil 
{
	if (!(alive player) || (time > _failSafe)) exitwith {};
	if (((getPosATL player select 2) < 2) || (isTouchingGround player)) then
	{
		_safeToExecute = true;
	};	
	_safeToExecute
};

_level = [ExileClientPlayerScore] call JohnO_fnc_getRespectTier;
_nameTag = "";

_uniformSelection = ["U_C_Poloshirt_stripped","U_C_Poloshirt_salmon","U_Rangemaster","U_OrestesBody","U_C_Poloshirt_burgundy","U_IG_Guerilla2_1","U_IG_Guerilla3_2","U_C_Poor_1"];

_highLevelUniformSelection =
[

	"U_C_HunterBody_grn",
	"U_IG_Guerilla1_1",
	"U_IG_Guerilla2_1",
	"U_IG_Guerilla2_2",
	"U_IG_Guerilla2_3",
	"U_IG_Guerilla3_1",
	"U_BG_Guerilla2_1",
	"U_IG_Guerilla3_2",
	"U_BG_Guerrilla_6_1",
	"U_BG_Guerilla1_1",
	"U_BG_Guerilla2_2",
	"U_BG_Guerilla2_3",
	"U_BG_Guerilla3_1",
	"U_BG_leader",
	"U_IG_leader",
	"U_I_G_resistanceLeader_F"
];

_headGearSelection = ["H_Bandanna_khk","H_Watchcap_blk","H_Watchcap_camo","H_TurbanO_blk","H_Booniehat_mcamo","H_Booniehat_dirty","H_Cap_blk","H_Cap_tan"];

_highLevelHeadGearSelection =
[
	"H_Shemag_khk",
	"H_Shemag_olive",
	"H_Shemag_olive_hs",
	"H_Shemag_tan",
	"H_ShemagOpen_khk",
	"H_ShemagOpen_tan",
	"H_TurbanO_blk",
	"H_Booniehat_dgtl",
	"H_Booniehat_dirty",
	"H_Booniehat_grn",
	"H_Booniehat_indp",
	"H_Booniehat_khk",
	"H_Booniehat_khk_h",
	"H_Booniehat_mcamo",
	"H_Booniehat_tan"
];

switch (_level) do
{
	case 0:
	{
		_uniform = _uniformSelection call BIS_fnc_selectRandom;
		_headGear = _headGearSelection call BIS_fnc_selectRandom;
		player forceAddUniform _uniform;
		player addHeadgear _headGear;
		player addItemToUniform "Exile_Item_Bandage";
		player addItemToUniform "Exile_Item_PlasticBottleFreshWater";
		player addItemToUniform "Chemlight_blue";
		player addVest "V_Rangemaster_belt";
		[player, "hgun_P07_F",2] call BIS_fnc_addWeapon;
		_nameTag = "Lacky";
		[parseText format["<t size='0.6'font='OrbitronLight' color='#ffffff'>You are a </t><t size='0.6'font='OrbitronLight' color='#ff0000'>%1</t><br/><t size='0.5'font='OrbitronLight' color='#ffffff'>Loadout supplied - gain more respect to rank up</t>",_nameTag],0,1,10,0] spawn bis_fnc_dynamictext;

	};
	case 1:
	{
		_uniform = _uniformSelection call BIS_fnc_selectRandom;
		_headGear = _headGearSelection call BIS_fnc_selectRandom;
		player forceAddUniform _uniform;
		player addHeadgear _headGear;
		player addItemToUniform "Exile_Item_Bandage";
		player addItemToUniform "Exile_Item_PlasticBottleFreshWater";
		player addItemToUniform "Chemlight_blue";
		player addVest "V_Rangemaster_belt";
		[player, "hgun_P07_F",2] call BIS_fnc_addWeapon;
		_nameTag = "Associate";
		[parseText format["<t size='0.6'font='OrbitronLight' color='#ffffff'>You are a </t><t size='0.6'font='OrbitronLight' color='#ff0000'>%1</t><br/><t size='0.5'font='OrbitronLight' color='#ffffff'>Loadout supplied - gain more respect to rank up</t>",_nameTag],0,1,10,0] spawn bis_fnc_dynamictext;
	};
	case 2:
	{
		_uniform = _uniformSelection call BIS_fnc_selectRandom;
		_headGear = _headGearSelection call BIS_fnc_selectRandom;
		player forceAddUniform _uniform;
		player addHeadgear _headGear;
		player addItemToUniform "Exile_Item_Bandage";
		player addItemToUniform "Exile_Item_PlasticBottleFreshWater";
		player addItemToUniform "Chemlight_blue";
		player addVest "V_Rangemaster_belt";
		[player, "hgun_P07_F",2] call BIS_fnc_addWeapon;
		_nameTag = "Soldier";
		[parseText format["<t size='0.6'font='OrbitronLight' color='#ffffff'>You are a </t><t size='0.6'font='OrbitronLight' color='#ff0000'>%1</t><br/><t size='0.5'font='OrbitronLight' color='#ffffff'>Loadout supplied - gain more respect to rank up</t>",_nameTag],0,1,10,0] spawn bis_fnc_dynamictext;
	};
	case 3:
	{
		_uniform = _highLevelUniformSelection call BIS_fnc_selectRandom;
		_headGear = _highLevelHeadGearSelection call BIS_fnc_selectRandom;
		player forceAddUniform _uniform;
		player addHeadgear _headGear;
		player addItemToUniform "Exile_Item_Bandage";
		player addItemToUniform "Exile_Item_PlasticBottleFreshWater";
		player addItemToUniform "Chemlight_blue";
		player addVest "V_Chestrig_blk";
		player addItem "Exile_Item_Bandage";
		player addItem "Exile_Item_Bandage";
		[player, "hgun_P07_F",3] call BIS_fnc_addWeapon;
		_nameTag = "Capo";
		[parseText format["<t size='0.6'font='OrbitronLight' color='#ffffff'>You are a </t><t size='0.6'font='OrbitronLight' color='#ff0000'>%1</t><br/><t size='0.5'font='OrbitronLight' color='#ffffff'>Loadout supplied - gain more respect to rank up</t>",_nameTag],0,1,10,0] spawn bis_fnc_dynamictext;
	};
	case 4:
	{
		_uniform = _highLevelUniformSelection call BIS_fnc_selectRandom;
		_headGear = _highLevelHeadGearSelection call BIS_fnc_selectRandom;
		player forceAddUniform _uniform;
		player addHeadgear _headGear;
		player addItemToUniform "Exile_Item_Bandage";
		player addItemToUniform "Exile_Item_PlasticBottleFreshWater";
		player addItemToUniform "Chemlight_blue";
		player addVest "V_Chestrig_blk";
		player addItem "Exile_Item_Bandage";
		player addItem "Exile_Item_Bandage";
		player addItem "Exile_Item_BeefParts";
		[player, "Exile_Weapon_M1014",3] call BIS_fnc_addWeapon;
		_nameTag = "Underboss";
		[parseText format["<t size='0.6'font='OrbitronLight' color='#ffffff'>You are a </t><t size='0.6'font='OrbitronLight' color='#ff0000'>%1</t><br/><t size='0.5'font='OrbitronLight' color='#ffffff'>Loadout supplied - gain more respect to rank up</t>",_nameTag],0,1,10,0] spawn bis_fnc_dynamictext;
	};
	case 5:
	{
		_uniform = _highLevelUniformSelection call BIS_fnc_selectRandom;
		_headGear = _highLevelHeadGearSelection call BIS_fnc_selectRandom;
		player forceAddUniform _uniform;
		player addHeadgear _headGear;
		player addItemToUniform "Exile_Item_Bandage";
		player addItemToUniform "Exile_Item_PlasticBottleFreshWater";
		player addItemToUniform "Chemlight_blue";
		player addVest "V_Chestrig_blk";
		player addItem "Exile_Item_Bandage";
		player addItem "Exile_Item_Bandage";
		player addItem "Exile_Item_BeefParts";
		[player, "Exile_Weapon_LeeEnfield",4] call BIS_fnc_addWeapon;
		_nameTag = "Boss";
		[parseText format["<t size='0.6'font='OrbitronLight' color='#ffffff'>You are a </t><t size='0.6'font='OrbitronLight' color='#ff0000'>%1</t><br/><t size='0.5'font='OrbitronLight' color='#ffffff'>Loadout supplied.</t>",_nameTag],0,1,10,0] spawn bis_fnc_dynamictext;
	};
};