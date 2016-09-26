private ["_veryWarmClothing","_midlyWarmClothing","_veryWarmHeadGear","_midlyWarmHeadGear","_clothingColdProtection","_warmth"];

_veryWarmClothing = 
[
	"U_B_GhillieSuit",
	"U_O_GhillieSuit",
	"U_I_GhillieSuit",
	"U_B_FullGhillie_lsh",
	"U_B_FullGhillie_sard",
	"U_B_FullGhillie_ard",
	"U_O_FullGhillie_lsh",
	"U_I_FullGhillie_ard",
	"U_I_FullGhillie_lsh",
	"U_O_FullGhillie_sard",
	"U_IG_Guerilla3_1",
	"U_IG_Guerilla3_2",
	"U_BG_Guerrilla_6_1",
	"U_BG_Guerilla3_1",
	"U_BG_leader",
	"U_IG_leader",
	"U_B_HeliPilotCoveralls",
	"U_B_PilotCoveralls",
	"U_I_HeliPilotCoveralls",
	"U_I_pilotCoveralls",
	"U_O_PilotCoveralls",
	"U_IG_Guerilla3_2",
	"U_BG_Guerilla3_2",
	"U_OG_Guerilla3_1",
	"U_OG_Guerilla3_2",
	"U_C_WorkerCoveralls",
	"U_C_HunterBody_grn",
	"U_C_HunterBody_brn",
	"U_C_Scientist",
	//Apex?
	"U_B_T_Sniper_F",
	"U_B_T_FullGhillie_tna_F",
	"U_O_T_Sniper_F",
	"U_O_T_FullGhillie_tna_F",
	// Bambi
	"Exile_Uniform_BambiOverall"
];

_midlyWarmClothing = 
[
	"Exile_Uniform_Woodland",
	"U_O_SpecopsUniform_ocamo",
	"U_O_SpecopsUniform_blk",
	"U_B_SpecopsUniform_sgg",
	"U_O_OfficerUniform_ocamo",
	"U_O_CombatUniform_oucamo",
	"U_O_CombatUniform_ocamo",
	"U_I_OfficerUniform",
	"U_I_CombatUniform",
	"U_B_CTRG_3",
	"U_B_CTRG_1",
	"U_B_CombatUniform_mcam_worn",
	"U_B_CombatUniform_mcam_vest",
	"U_B_CombatUniform_mcam",
	"U_B_CombatUniform_wdl",
	"U_B_CombatUniform_wdl_vest",
	"U_B_CombatUniform_sgg",
	"U_B_CombatUniform_sgg_vest",
	"U_MillerBody",
	"U_OG_leader",
	// Apex?
	"U_B_T_Soldier_SL_F",
	"U_B_CTRG_Soldier_F",
	"U_B_GEN_Soldier_F",
	"U_B_GEN_Commander_F",
	"U_O_T_Soldier_F",
	"U_O_T_Officer_F",
	"U_O_V_Soldier_Viper_F",
	"U_O_V_Soldier_Viper_hex_F",
	"U_B_CTRG_Soldier_urb_1_F"
];

_veryWarmHeadGear = 
[
	"H_ShemagOpen_tan",
	"H_ShemagOpen_khk",
	"H_Shemag_tan",
	"H_Shemag_olive_hs",
	"H_Shemag_olive",
	"H_Shemag_khk"
];

_midlyWarmHeadGear = 
[
	"H_Watchcap_blk",
	"H_Watchcap_camo",
	"H_Watchcap_khk",
	"H_Watchcap_sgg",
	"H_Bandanna_khk",
	"H_Bandanna_khk_hs",
	"H_Bandanna_cbr",
	"H_Bandanna_sgg",
	"H_Bandanna_sand",
	"H_Bandanna_surfer_grn",
	"H_Bandanna_surfer_blk",
	"H_Bandanna_mcamo",
	"H_Bandanna_camo",
	"H_Bandanna_blu",
	"H_Bandanna_blu"
];

_clothingColdProtection = 0;
_warmth = "None";
	
if !((uniform player) isEqualTo "") then 
{
	_clothingColdProtection = _clothingColdProtection + 0.05; //Original : 0.25
	

	if ((uniform player) in _midlyWarmClothing) then
	{
		_clothingColdProtection = _clothingColdProtection + 0.10; //15
		
	}
	else
	{
		if ((uniform player) in _veryWarmClothing) then
		{
			_clothingColdProtection = _clothingColdProtection + 0.34; // 39
			
		};	
	};	

};
if !((headgear player) isEqualTo "") then 
{
	_clothingColdProtection = _clothingColdProtection + 0.01; //Original : 0.05
	

	if ((headgear player) in _midlyWarmHeadGear) then
	{	
		_clothingColdProtection = _clothingColdProtection + 0.07; //8
		
	}
	else
	{	
		if ((headgear player) in _veryWarmHeadGear) then
		{
			_clothingColdProtection = _clothingColdProtection + 0.15; // 16
			
		};
	};		

};
if !((vest player) isEqualTo "") then 
{
	_clothingColdProtection = _clothingColdProtection + 0.10; //Original : 0.10
};

_clothingColdProtection