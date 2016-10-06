_lootWeapons =
[
	// APEX
	"SMG_05_F",
	"arifle_AKM_F",
	"arifle_AKM_FL_F",
	"arifle_AKS_F",
	"arifle_SPAR_01_blk_F",
	//Exile stuff
	"Exile_Weapon_M1014",
	"Exile_Weapon_LeeEnfield",
	"Exile_Weapon_CZ550",
	"Exile_Weapon_SVD",
	"Exile_Weapon_RPK",
	"Exile_Weapon_AK107"
];

_weapon = selectRandom _lootWeapons;

_weaponItem =

[
	""
];


_attachment = selectRandom _weaponItem;

_uniforms =
[

	"U_I_C_Soldier_Para_1_F",
	"U_I_C_Soldier_Para_2_F",
	"U_I_C_Soldier_Para_3_F",
	"U_I_C_Soldier_Para_4_F",
	"U_I_C_Soldier_Para_5_F",
	"U_I_C_Soldier_Bandit_1_F",
	"U_I_C_Soldier_Bandit_2_F",
	"U_I_C_Soldier_Bandit_3_F",
	"U_I_C_Soldier_Bandit_4_F",
	"U_I_C_Soldier_Bandit_5_F",
	"U_I_C_Soldier_Camo_F",
	// Guerilla stuff
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

_uniform = selectRandom _uniforms;

_vests =

[

	"V_BandollierB_blk",
	"V_BandollierB_cbr",
	"V_BandollierB_khk",
	"V_BandollierB_oli",
	"V_BandollierB_rgr",
	"V_Press_F",
	"V_Rangemaster_belt",
	"V_TacVest_blk",
	"V_TacVest_blk_POLICE",
	"V_TacVest_brn",
	"V_TacVest_camo",
	"V_TacVest_khk",
	"V_TacVest_oli",
	"V_TacVestCamo_khk",
	"V_TacVestIR_blk",
	"V_I_G_resistanceLeader_F",
	"V_Chestrig_blk",
	"V_Chestrig_khk",
	"V_Chestrig_oli",
	"V_Chestrig_rgr",
	"V_HarnessO_brn",
	"V_HarnessO_gry",
	"V_HarnessOGL_brn",
	"V_HarnessOGL_gry",
	"V_HarnessOSpec_brn",
	"V_HarnessOSpec_gry"

];

_vest = selectRandom _vests;

_backPacks =
[

	"B_HuntingBackpack",
	"B_OutdoorPack_blk",
	"B_OutdoorPack_blu",
	"B_OutdoorPack_tan",
	"B_AssaultPack_blk",
	"B_AssaultPack_cbr",
	"B_AssaultPack_dgtl",
	"B_AssaultPack_khk",
	"B_AssaultPack_mcamo",
	"B_AssaultPack_rgr",
	"B_AssaultPack_sgg",
	"B_FieldPack_blk",
	"B_FieldPack_cbr",
	"B_FieldPack_ocamo",
	"B_FieldPack_oucamo",
	"B_TacticalPack_blk",
	"B_TacticalPack_rgr",
	"B_TacticalPack_ocamo",
	"B_TacticalPack_mcamo",
	"B_TacticalPack_oli",
	"B_Kitbag_cbr",
	"B_Kitbag_mcamo",
	"B_Kitbag_sgg",
	"B_Bergen_blk",
	"B_Bergen_mcamo",
	"B_Bergen_rgr",
	"B_Bergen_sgg",
	"B_Carryall_cbr",
	"B_Carryall_khk",
	"B_Carryall_mcamo",
	"B_Carryall_ocamo",
	"B_Carryall_oli",
	"B_Carryall_oucamo"

];

_backpack = selectRandom _backPacks;

_items =
[

	"Chemlight_blue",
	"Chemlight_green",
	"Chemlight_red",
	"FlareGreen_F",
	"FlareRed_F",
	"FlareWhite_F",
	"FlareYellow_F",
	"UGL_FlareGreen_F",
	"UGL_FlareRed_F",
	"UGL_FlareWhite_F",
	"UGL_FlareYellow_F",
	"3Rnd_UGL_FlareGreen_F",
	"3Rnd_UGL_FlareRed_F",
	"3Rnd_UGL_FlareWhite_F",
	"3Rnd_UGL_FlareYellow_F",
	"HandGrenade",
	"MiniGrenade",
	"B_IR_Grenade",
	"O_IR_Grenade",
	"I_IR_Grenade",
	"1Rnd_HE_Grenade_shell",
	"3Rnd_HE_Grenade_shell",
	"Exile_Item_EMRE",
	"Exile_Item_GloriousKnakworst",
	"Exile_Item_Surstromming",
	"Exile_Item_SausageGravy",
	"Exile_Item_Catfood",
	"Exile_Item_ChristmasTinner",
	"Exile_Item_BBQSandwich",
	"Exile_Item_Dogfood",
	"Exile_Item_BeefParts",
	"Exile_Item_Cheathas",
	"Exile_Item_Noodles",
	"Exile_Item_SeedAstics",
	"Exile_Item_Raisins",
	"Exile_Item_Moobar",
	"Exile_Item_InstantCoffee",
	"Exile_Item_PlasticBottleCoffee",
	"Exile_Item_PowerDrink",
	"Exile_Item_PlasticBottleFreshWater",
	"Exile_Item_Beer",
	"Exile_Item_EnergyDrink",
	"Exile_Item_ChocolateMilk",
	"Exile_Item_MountainDupe",
	"Exile_Item_PlasticBottleEmpty",
	"Exile_Item_InstaDoc",
	"Exile_Item_Bandage",
	"Exile_Item_Vishpirin",
	"Exile_Item_Heatpack",
	"Exile_Item_CodeLock"

];

_item = selectRandom _items;

_headgears =
[
	"H_Booniehat_dgtl",
	"H_Booniehat_dirty",
	"H_Booniehat_grn",
	"H_Booniehat_indp",
	"H_Booniehat_khk",
	"H_Booniehat_khk_hs",
	"H_Booniehat_mcamo",
	"H_Booniehat_tan",
	"H_Beret_02",
	"H_Beret_blk",
	"H_Beret_blk_POLICE",
	"H_Beret_brn_SF",
	"H_Beret_Colonel",
	"H_Beret_grn",
	"H_Beret_grn_SF",
	"H_Beret_ocamo",
	"H_Beret_red",
	"H_Shemag_khk",
	"H_Shemag_olive",
	"H_Shemag_olive_hs",
	"H_Shemag_tan",
	"H_ShemagOpen_khk",
	"H_ShemagOpen_tan",
	"H_TurbanO_blk",
	"H_Watchcap_blk",
	"H_Watchcap_camo",
	"H_Watchcap_khk",
	"H_Watchcap_sgg",
	"H_MilCap_blue",
	"H_MilCap_dgtl",
	"H_MilCap_mcamo",
	"H_MilCap_ocamo",
	"H_MilCap_oucamo",
	"H_MilCap_rucamo"
];

_headGear = selectRandom _headgears;

_gear = [_weapon,_attachment,_uniform,_vest,_backpack,_item,_headGear];
_gear