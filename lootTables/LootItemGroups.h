/*
	///////////////////////////////////////////////////////////////////////////////
	// Class Names
	///////////////////////////////////////////////////////////////////////////////

	Remember that item class names, group names and loot table names cannot 
	contain spaces. Also be 100% sure to have the exact same name as in Arma,
	as they are *case sensive*.

	///////////////////////////////////////////////////////////////////////////////
	// Item Groups
	///////////////////////////////////////////////////////////////////////////////

	You can link one group of items to loot tables.
	One item should only be in one group.

	Syntax:
	> <Group Name>
	<Spawn Chance Within Group>,<Item Class Name>

	///////////////////////////////////////////////////////////////////////////////
	// Propability
	///////////////////////////////////////////////////////////////////////////////

	<Spawn Chance>,<Item>

	10, Banana
	20, Tomato
	30, Cherry

	Sum of chances:
	10 + 20 + 30 = 60 = 100%

	Spawn chances:
	Banana	10 : 60 = 10 * 100 / 60 = 16.67%
	Tomato	20 : 60 = 20 * 100 / 60 = 33.33%
	Cherry	30 : 60 = 30 * 100 / 60 = 50%

	In words: 
	If Exile should spawn an item of the above group, it has a 33.33%
	chance to spawn a Tomato.
*/
	
/*
	Item Groups
*/

///////////////////////////////////////////////////////////////////////////////
// Food & Drinks
///////////////////////////////////////////////////////////////////////////////

> Food
3, Exile_Item_CookingPot
5, Exile_Item_CanOpener
5, Exile_Item_Matches
3, Exile_Item_EMRE						// 75% Hunger
6, Exile_Item_GloriousKnakworst			// 60% Hunger
7, Exile_Item_Surstromming				// 55% Hunger
7, Exile_Item_SausageGravy				// 50% Hunger
7, Exile_Item_ChristmasTinner			// 40% Hunger
7, Exile_Item_MacasCheese				// 40% Hunger
7, Exile_Item_BBQSandwich				// 40% Hunger
7, Exile_Item_CatFood					// 40% Hunger
7, Exile_Item_Dogfood					// 30% Hunger
7, Exile_Item_BeefParts					// 30% Hunger
7, Exile_Item_Cheathas					// 30% Hunger
7, Exile_Item_DsNuts					// 30% Hunger
7, Exile_Item_Noodles					// 25% Hunger
8, Exile_Item_CockONut					// 20% Hunger
8, Exile_Item_SeedAstics				// 20% Hunger
9, Exile_Item_Raisins					// 15% Hunger
9, Exile_Item_Moobar					// 10% Hunger
11, Exile_Item_InstantCoffee			//  5% Hunger

> Drinks
7, Exile_Item_PowerDrink					// +95% Thirst
12, Exile_Item_PlasticBottleFreshWater		// +80% Thirst
14, Exile_Item_Beer							// +75% Thirst
17, Exile_Item_EnergyDrink					// +75% Thirst
20, Exile_Item_MountainDupe					// +50% Thirst, spawns always twice!	
25, Exile_Item_ChocolateMilk				// +35% Thirst
30, Exile_Item_PlasticBottleDirtyWater		// +10% Thirst


///////////////////////////////////////////////////////////////////////////////
// Weapons & Attachments
///////////////////////////////////////////////////////////////////////////////

> Pistols
20, hgun_ACPC2_F			// ACP-C2 .45
21, hgun_P07_F				// P07 9 mm
20, hgun_Rook40_F			// Rook-40 9 mm
13, hgun_Pistol_heavy_01_F	// 4-five .45
13, hgun_Pistol_heavy_02_F	// Zubr .45
13, hgun_Pistol_Signal_F	// Starter Pistol
13, Exile_Weapon_Colt1911   // Colt 1911
13, Exile_Weapon_Makarov	// Makarov
13, Exile_Weapon_Taurus		// Taurus
13, Exile_Weapon_TaurusGold	// Taurus (Gold)
13, hgun_Pistol_01_F		// PM 9 mm
13, hgun_P07_khk_F			// P07 9 mm (Khaki)

> PistolAmmo
20, 11Rnd_45ACP_Mag				// 4-five
10, 16Rnd_9x21_Mag				// PDW2000, P07, ROOK-40
20, 30Rnd_9x21_Mag				// Sting, PDW2000, P07, ROOK-40
16, 6Rnd_45ACP_Cylinder			// Zubr
7, 6Rnd_GreenSignal_F			// Starter Pistol
7, 6Rnd_RedSignal_F				// Starter Pistol 
20, 9Rnd_45ACP_Mag				// ACP-C2
20, Exile_Magazine_7Rnd_45ACP	// Colt 1911
20, Exile_Magazine_8Rnd_9x18	// Makarov
20, Exile_Magazine_6Rnd_45ACP	// Taurus
20, 10Rnd_9x21_Mag				// PM 9 mm

> PistolAttachments
36, muzzle_snds_L
36, muzzle_snds_acp
14, optic_Yorris		// No one needs this crap
14, optic_MRD

> CivilianWeapons
5, Exile_Weapon_M1014	//M1014
1, arifle_AKM_F
5, Exile_Weapon_LeeEnfield
2, Exile_Weapon_AK74
3, arifle_AKS_F
1, Exile_Weapon_CZ550

> ShotgunAmmo
1, Exile_Magazine_8Rnd_74Slug		//M1014

> SMG
34, SMG_01_F		// Vermin SMG .45 ACP
33, SMG_02_F		// Sting 9 mm
33, SMG_05_F		// Protector 9mm
33, hgun_PDW2000_F	// PDW2000 9 mm

> SMGAmmo
50, 30Rnd_45ACP_Mag_SMG_01					// Vermin SMG
50, 30Rnd_45ACP_Mag_SMG_01_Tracer_Green		// Vermin SMG
50, 30Rnd_9x21_Mag_SMG_02					// Sting, Protector
50, 30Rnd_9x21_Mag_SMG_02_Tracer_Red        // Sting, Protector
50, 30Rnd_9x21_Mag_SMG_02_Tracer_Yellow     // Sting, Protector
50, 30Rnd_9x21_Mag_SMG_02_Tracer_Green      // Sting, Protector

> SMGAttachments
20, optic_Holosight_smg
20, optic_Holosight_smg_blk_F
20, optic_ACO_grn_smg
20, optic_Aco_smg
20, optic_ACO_grn
20, optic_Aco

> Rifles
3, arifle_Katiba_F			// Katiba 6.5 mm
3, arifle_Katiba_GL_F		// Katiba GL 6.5 mm
8, arifle_MXC_F				// MXC 6.5 mm
8, arifle_MX_F				// MX 6.5 mm
4, arifle_MX_GL_F			// MX 3GL 6.5 mm
6, arifle_MXM_F				// MXM 6.5 mm
3, arifle_MXM_Black_F		// MXM 6.5 mm (Black)
6, arifle_SDAR_F			// SDAR 5.56 mm
8, arifle_TRG21_F			// TRG-21 5.56 mm
8, arifle_TRG20_F			// TRG-20 5.56 mm
4, arifle_TRG21_GL_F		// TRG-21 EGLM 5.56 mm
7, arifle_Mk20_F			// Mk20 5.56 mm
7, arifle_Mk20C_F			// Mk20C 5.56 mm
4, arifle_Mk20_GL_F			// Mk20 EGLM 5.56 mm
3, arifle_MXC_Black_F		// MXC 6.5 mm (Black)
3, arifle_MX_Black_F		// MX 6.5 mm (Black)
3, arifle_MX_GL_Black_F		// MX 3GL 6.5 mm (Black)
5, Exile_Weapon_AK107	
5, Exile_Weapon_AK107_GL	
5, Exile_Weapon_AK74_GL
5, Exile_Weapon_AK74
//5, Exile_Weapon_AK47				
//5, Exile_Weapon_AKS_Gold	
5, Exile_Weapon_DMR		
5, Exile_Weapon_LeeEnfield
5, Exile_Weapon_CZ550
5, Exile_Weapon_SVD
3, Exile_Weapon_SVDCamo
5, Exile_Weapon_VSSVintorez
8, arifle_MX_khk_F   			// MX 6.5 mm (Khaki)
4, arifle_MX_GL_khk_F			// MX 3GL 6.5 mm (Khaki)
8, arifle_MXC_khk_F  			// MXC 6.5 mm (Khaki)
3, arifle_MXM_khk_F  			// MXM 6.5 mm (Khaki)
5, arifle_AK12_F          		// AK-12 7.62 mm
3, arifle_AK12_GL_F             // AK-12 GL 7.62 mm
5, arifle_AKM_F                 // AKM 7.62 mm
5, arifle_AKM_FL_F              // AKM 7.62 mm
3, arifle_AKS_F                 // AKS
4, arifle_ARX_blk_F             // Type 115 6.5 mm (Black)
4, arifle_ARX_ghex_F            // Type 115 6.5 mm (Green Hex)
4, arifle_ARX_hex_F             // Type 115 6.5 mm (Hex)
5, arifle_CTAR_blk_F            // CAR-95 5.8 mm (Black)
5, arifle_CTAR_hex_F			// CAR-95 5.8 mm (Hex)
5, arifle_CTAR_ghex_F			// CAR-95 5.8 mm (Green Hex)
5, arifle_CTAR_GL_blk_F         // CAR-95 GL 5.8 mm (Black)
5, arifle_SPAR_01_blk_F         // SPAR-16 5.56 mm (Black)
5, arifle_SPAR_01_khk_F         // SPAR-16 5.56 mm (Khaki)
5, arifle_SPAR_01_snd_F         // SPAR-16 5.56 mm (Sand)
5, arifle_SPAR_01_GL_blk_F      // SPAR-16 GL 5.56 mm (Black)
5, arifle_SPAR_01_GL_khk_F      // SPAR-16 GL 5.56 mm (Khaki)
5, arifle_SPAR_01_GL_snd_F      // SPAR-16 GL 5.56 mm (Sand)



> RifleAmmo
11, 20Rnd_556x45_UW_mag						// SDAR
15, 30Rnd_556x45_Stanag						// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR, SPAR-16
15, 30Rnd_556x45_Stanag_green				// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR, SPAR-16
15, 30Rnd_556x45_Stanag_red					// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR, SPAR-16
9, 30Rnd_556x45_Stanag_Tracer_Green			// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR, SPAR-16
9, 30Rnd_556x45_Stanag_Tracer_Red			// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR, SPAR-16
9, 30Rnd_556x45_Stanag_Tracer_Yellow		// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR, SPAR-16
15, 30Rnd_65x39_caseless_green				// Katiba, Type 115
9, 30Rnd_65x39_caseless_green_mag_Tracer	// Katiba, Type 115
9, 30Rnd_65x39_caseless_mag					// MX/C/M/SW/3GL
9, 30Rnd_65x39_caseless_mag_Tracer			// MX/C/M/SW/3GL
8, Exile_Magazine_10Rnd_303					// Lee-Enfield
9, Exile_Magazine_30Rnd_762x39_AK			// AK
9, Exile_Magazine_30Rnd_545x39_AK			// AK
9, Exile_Magazine_30Rnd_545x39_AK_Green		// AK
9, Exile_Magazine_30Rnd_545x39_AK_Red		// AK
9, Exile_Magazine_30Rnd_545x39_AK_White		// AK
9, Exile_Magazine_30Rnd_545x39_AK_Yellow	// AK
9, Exile_Magazine_20Rnd_762x51_DMR			// DMR
9, Exile_Magazine_20Rnd_762x51_DMR_Yellow	// DMR
9, Exile_Magazine_20Rnd_762x51_DMR_Red		// DMR
9, Exile_Magazine_20Rnd_762x51_DMR_Green	// DMR
9, Exile_Magazine_20Rnd_762x51_DMR_White	// DMR
9, Exile_Magazine_5Rnd_22LR					// CZ550
9, Exile_Magazine_10Rnd_762x54				// SVD
9, Exile_Magazine_10Rnd_9x39				// VSS
9, Exile_Magazine_20Rnd_9x39				// VSS
9, 30Rnd_762x39_Mag_F						// AK-12, AKM
9, 30Rnd_762x39_Mag_Green_F                 // AK-12, AKM
9, 30Rnd_762x39_Mag_Tracer_F                // AK-12, AKM
9, 30Rnd_762x39_Mag_Tracer_Green_F          // AK-12, AKM
9, 30Rnd_762x39_AK47_M						// AKS
9, 30Rnd_545x39_Mag_F						// AKS
9, 30Rnd_545x39_Mag_Green_F					// AKS
9, 30Rnd_545x39_Mag_Tracer_F				// AKS
9, 30Rnd_545x39_Mag_Tracer_Green_F			// AKS
5, 10Rnd_50BW_Mag_F							// Type 115
9, 30Rnd_580x42_Mag_F						// CAR-95
9, 30Rnd_580x42_Mag_Tracer_F				// CAR-95



> RifleAttachments
10, muzzle_snds_M
10, muzzle_snds_H
10, muzzle_snds_H_khk_F
10, muzzle_snds_H_snd_F
10, muzzle_snds_58_blk_F
10, muzzle_snds_m_khk_F
10, muzzle_snds_m_snd_F
10, muzzle_snds_58_wdm_F
10, muzzle_snds_65_TI_blk_F
10, muzzle_snds_65_TI_hex_F
10, muzzle_snds_65_TI_ghex_F
10, muzzle_snds_H_MG_blk_F
10, muzzle_snds_H_MG_khk_F
10, optic_Arco
10, optic_Arco_blk_F
10, optic_Arco_ghex_F
15, optic_Hamr
15, optic_Hamr_khk_F
10, optic_Holosight
10, optic_Holosight_blk_F
10, optic_Holosight_khk_F
14, acc_flashlight
10, acc_pointer_IR
10, optic_MRCO
10, optic_DMS
10, optic_DMS_ghex_F
5, optic_ERCO_blk_F
5, optic_ERCO_khk_F
5, optic_ERCO_snd_F
5, optic_NVS
//1, optic_tws

> LMG
12, arifle_MX_SW_Black_F	// MX SW 6.5 mm (Black)
12, arifle_MX_SW_F			// MX SW 6.5 mm
25, LMG_Mk200_F				// Mk200 6.5 mm
25, LMG_Zafir_F				// Zafir 7.62 mm
25, Exile_Weapon_RPK
25, Exile_Weapon_PK
25, Exile_Weapon_PKP
25, LMG_03_F				//= LIM-85 5.56 mm
15, arifle_CTARS_blk_F           // CAR-95-1 5.8mm (Black)
15, arifle_CTARS_ghex_F			// CAR-95-1 5.8mm (Green Hex)
15, arifle_CTARS_hex_F			// CAR-95-1 5.8mm (Hex)
15, arifle_SPAR_02_blk_F         // SPAR-16S 5.56 mm (Black)
15, arifle_SPAR_02_khk_F         // SPAR-16S 5.56 mm (Khaki)
15, arifle_SPAR_02_snd_F         // SPAR-16S 5.56 mm (Sand)


> LMGAmmo
12, 100Rnd_65x39_caseless_mag			// MX SW
10, 100Rnd_65x39_caseless_mag_Tracer	// MX SW
12, 150Rnd_762x54_Box					// Zafir
10, 150Rnd_762x54_Box_Tracer			// Zafir
5, 130Rnd_338_Mag
15, 150Rnd_93x64_Mag
10, Exile_Magazine_45Rnd_545x39_RPK_Green
10, Exile_Magazine_75Rnd_545x39_RPK_Green
10, Exile_Magazine_100Rnd_762x54_PK_Green
10, 200Rnd_65x39_Belt					// Mk200
10, 200Rnd_65x39_Belt_Tracer_Green	// Mk200
10, 200Rnd_65x39_Belt_Tracer_Red		// Mk200
10, 200Rnd_65x39_Belt_Tracer_Yellow	// Mk200
10, 200Rnd_556x45_Box_F				// LIM-85 	
10, 200Rnd_556x45_Box_Red_F         // LIM-85	
10, 200Rnd_556x45_Box_Tracer_F      // LIM-85	
10, 200Rnd_556x45_Box_Tracer_Red_F  // LIM-85	
20, 100Rnd_580x42_Mag_F						// CAR-95-1
20, 100Rnd_580x42_Mag_Tracer_F				// CAR-95-1
20, 150Rnd_556x45_Drum_Mag_F					// SPAR-16S 
20, 150Rnd_556x45_Drum_Mag_Tracer_F			// SPAR-16S 

> Snipers
25, srifle_DMR_01_F			// Rahim 7.62 mm
25, srifle_EBR_F			// Mk18 ABR 7.62 mm
1, srifle_GM6_F				// GM6 Lynx 12.7 mm
1, srifle_LRR_F				// M320 LRR .408
22, srifle_LRR_tna_F    	// M320 LRR .408 (Tropic)
1, srifle_GM6_ghex_F   		// GM6 Lynx 12.7 mm (Green Hex)
10, srifle_DMR_07_blk_F     // CMR-76 6.5 mm (Black)
10, srifle_DMR_07_hex_F     // CMR-76 6.5 mm (Hex)
10, srifle_DMR_07_ghex_F    // CMR-76 6.5 mm (Green Hex)
10, arifle_SPAR_03_blk_F         // SPAR-17 7.62 mm (Black)
10, arifle_SPAR_03_khk_F         // SPAR-17 7.62 mm (Khaki)
10, arifle_SPAR_03_snd_F         // SPAR-17 7.62 mm (Sand)

> SniperAmmo
10, 5Rnd_127x108_Mag									// GM6 Lynx
10, 7Rnd_408_Mag										// M320 LRR
17, 10Rnd_762x54_Mag									// Rahim
19, 20Rnd_762x51_Mag									// Mk18 ABR
8, 5Rnd_127x108_APDS_Mag								// GM6 Lynx 
21, 20Rnd_650x39_Cased_Mag_F							// CMR-76
2, Exile_Magazine_5Rnd_127x108_Bullet_Cam_Mag 			// GM6 Lynx 12.7 mm
5, Exile_Magazine_10Rnd_93x64_DMR_05_Bullet_Cam_Mag 	// Cyrus 9.3mm	
3, Exile_Magazine_7Rnd_408_Bullet_Cam_Mag 				// M320 LRR .408	
5, Exile_Magazine_10Rnd_338_Bullet_Cam_Mag 				// MAR-10 .338	

> SniperAttachments
19, muzzle_snds_B
10, muzzle_snds_B_khk_F
10, muzzle_snds_B_snd_F
//1, optic_tws
//1, optic_tws_mg
27, optic_DMS
26, optic_SOS
26, optic_SOS_khk_F
26, optic_LRPS
26, optic_LRPS_tna_F
26, optic_LRPS_ghex_F

> DLCRifles
// To overpowered. Do not use in vanilla Exile
1, MMG_01_hex_F				//Navid
1, MMG_01_tan_F				//Navid
1, MMG_02_black_F				//SPMG
1, MMG_02_camo_F				//SPMG
1, MMG_02_sand_F				//SPMG
4, srifle_DMR_02_camo_F			//MAR10
4, srifle_DMR_02_F				//MAR10
4, srifle_DMR_02_sniper_F		//MAR10
3, srifle_DMR_03_F				//MK1EMR
3, srifle_DMR_03_khaki_F		//MK1EMR
3, srifle_DMR_03_tan_F			//MK1EMR
3, srifle_DMR_03_woodland_F		//MK1EMR
6, srifle_DMR_04_F				//ASP1KIR
6, srifle_DMR_04_Tan_F			//ASP1KIR
4, srifle_DMR_05_blk_F			//CYRUS
4, srifle_DMR_05_hex_F			//CYRUS
4, srifle_DMR_05_tan_F			//CYRUS
6, srifle_DMR_06_camo_F			//Mk14
6, srifle_DMR_06_olive_F		//Mk14

> DLCAmmo
//18, 150Rnd_93x64_Mag		//Navid
//25, 130Rnd_338_Mag			//SPMG
16, 10Rnd_338_Mag			//MAR10
11, 20Rnd_762x51_Mag		//MK1EMR
14, 10Rnd_127x54_Mag		//ASP1KIR
16, 10Rnd_93x64_DMR_05_Mag	//CYRUS

> DLCOptics
14, optic_AMS
14, optic_AMS_khk
14, optic_AMS_snd
14, optic_KHS_blk
14, optic_KHS_hex
14, optic_KHS_old
14, optic_KHS_tan

> DLCSupressor
40, muzzle_snds_338_black
40, muzzle_snds_338_green
40, muzzle_snds_338_sand
40, muzzle_snds_93mmg
40, muzzle_snds_93mmg_tan
40, muzzle_snds_B

> EpicWeapons
6, MMG_01_hex_F				//Navid
6, MMG_01_tan_F				//Navid
4, MMG_02_black_F			//SPMG
4, MMG_02_camo_F			//SPMG
4, MMG_02_sand_F			//SPMG

> Bipods
17, bipod_03_F_oli
17, bipod_03_F_blk
17, bipod_02_F_tan
16, bipod_02_F_hex
17, bipod_02_F_blk
17, bipod_01_F_snd
16, bipod_01_F_mtp
17, bipod_01_F_blk
17, bipod_01_F_khk

> HEGrenades
67, 1Rnd_HE_Grenade_shell
33, 3Rnd_HE_Grenade_shell

> UGLFlares
8, 3Rnd_UGL_FlareGreen_F
8, 3Rnd_UGL_FlareRed_F
8, 3Rnd_UGL_FlareWhite_F
8, 3Rnd_UGL_FlareYellow_F
17, UGL_FlareGreen_F
17, UGL_FlareRed_F
17, UGL_FlareWhite_F
17, UGL_FlareYellow_F
// No Infrared for now
//UGL_FlareCIR_F
//3Rnd_UGL_FlareCIR_F

> UGLSmokes
10, 1Rnd_Smoke_Grenade_shell
10, 1Rnd_SmokeBlue_Grenade_shell
10, 1Rnd_SmokeGreen_Grenade_shell
10, 1Rnd_SmokeOrange_Grenade_shell
10, 1Rnd_SmokePurple_Grenade_shell
10, 1Rnd_SmokeRed_Grenade_shell
10, 1Rnd_SmokeYellow_Grenade_shell
4, 3Rnd_Smoke_Grenade_shell
4, 3Rnd_SmokeBlue_Grenade_shell
4, 3Rnd_SmokeGreen_Grenade_shell
4, 3Rnd_SmokeOrange_Grenade_shell
4, 3Rnd_SmokePurple_Grenade_shell
4, 3Rnd_SmokeRed_Grenade_shell
4, 3Rnd_SmokeYellow_Grenade_shell

> HandGrenades
50, HandGrenade
50, MiniGrenade

> Explosives
12, DemoCharge_Remote_Mag
12, IEDUrbanSmall_Remote_Mag
12, IEDLandSmall_Remote_Mag
20, APERSMine_Range_Mag
20, APERSBoundingMine_Range_Mag
20, APERSTripMine_Wire_Mag
4, SatchelCharge_Remote_Mag

///////////////////////////////////////////////////////////////////////////////
// Clothing & Gear
///////////////////////////////////////////////////////////////////////////////

//Civilian

> CivilianItems
30, ItemWatch
30, ItemRadio
20, ItemGPS
20, Binocular
40, Exile_Item_Heatpack
35, ItemMap
5, Exile_Item_MobilePhone
2, Exile_Item_SleepingMat

> CivilianClothing
9, U_C_Poor_1
9, U_C_Poor_2
9, U_C_Poor_shorts_1
9, U_C_HunterBody_grn
7, U_C_Poloshirt_salmon
7, U_C_Poloshirt_tricolour
7, U_C_Poloshirt_stripped
7, U_C_Poloshirt_burgundy
7, U_C_Poloshirt_blue
9, U_C_Journalist
9, U_C_Scientist
9, U_Rangemaster
1, U_OrestesBody
1, U_NikosBody
1, U_NikosAgedBody
5, U_I_C_Soldier_Bandit_1_F         // Bandit Clothes (Polo Shirt)
5, U_I_C_Soldier_Bandit_2_F         // Bandit Clothes (Skull)
5, U_I_C_Soldier_Bandit_3_F         // Bandit Clothes (Tee)
5, U_I_C_Soldier_Bandit_4_F         // Bandit Clothes (Checkered)
5, U_I_C_Soldier_Bandit_5_F         // Bandit Clothes (Tank Top)
5, U_C_man_sport_1_F                // Sport Clothes (Beach)
5, U_C_man_sport_2_F                // Sport Clothes (Orange)
5, U_C_man_sport_3_F                // Sport Clothes (Blue)
5, U_C_Man_casual_1_F               // Casual Clothes (Navy)
5, U_C_Man_casual_2_F               // Casual Clothes (Blue)
5, U_C_Man_casual_3_F               // Casual Clothes (Green)
5, U_C_Man_casual_4_F               // Summer Clothes (Sky)
5, U_C_Man_casual_5_F               // Summer Clothes (Yellow)
5, U_C_Man_casual_6_F               // Summer Clothes (Red)

> CivilianBackpacks
10, B_OutdoorPack_blk
9, B_OutdoorPack_tan
9, B_OutdoorPack_blu
8, B_HuntingBackpack
7, B_AssaultPack_khk
7, B_AssaultPack_dgtl
7, B_AssaultPack_rgr
7, B_AssaultPack_sgg
7, B_AssaultPack_blk
7, B_AssaultPack_cbr
7, B_AssaultPack_mcamo
5, B_Kitbag_mcamo
5, B_Kitbag_sgg
5, B_Kitbag_cbr
7, B_AssaultPack_tna_F 

> CivilianVests
50, V_Rangemaster_belt
25, V_Press_F
25, V_TacVest_blk_POLICE

> CivilianHeadgear
5, H_Bandanna_surfer
5, H_Beret_blk_POLICE
5, H_Cap_blk
5, H_Cap_blk_Raven
5, H_Cap_blu
5, H_Cap_grn
5, H_Cap_headphones
5, H_Cap_oli
6, H_Cap_press
6, H_Cap_red
6, H_Cap_tan
6, H_Hat_blue
6, H_Hat_brown
6, H_Hat_checker
6, H_Hat_grey
6, H_Hat_tan
6, H_StrawHat
6, H_StrawHat_dark

//Guerilla

> GuerillaItems
25, Rangefinder
8, NVGoggles
8, O_NVGoggles_hex_F
8, O_NVGoggles_urb_F
8, O_NVGoggles_ghex_F
8, NVGoggles_tna_F
50, ItemCompass

> GuerillaClothing
16, U_IG_Guerilla1_1
16, U_IG_Guerilla2_1
16, U_IG_Guerilla2_2
16, U_IG_Guerilla2_3
15, U_IG_Guerilla3_1
15, U_IG_Guerilla3_2
4, U_IG_leader
2, U_I_G_resistanceLeader_F
5, U_I_C_Soldier_Para_1_F           // Paramilitary Garb (Tee)
5, U_I_C_Soldier_Para_2_F           // Paramilitary Garb (Jacket)
5, U_I_C_Soldier_Para_3_F           // Paramilitary Garb (Shirt)
5, U_I_C_Soldier_Para_4_F           // Paramilitary Garb (Tank Top)
5, U_I_C_Soldier_Para_5_F           // Paramilitary Garb (Shorts)
5, U_I_C_Soldier_Camo_F             // Syndikat Uniform

> GuerillaBackpacks
14, B_FieldPack_blk
14, B_FieldPack_ocamo
14, B_FieldPack_oucamo
14, B_FieldPack_cbr
11, B_Bergen_sgg
11, B_Bergen_mcamo
11, B_Bergen_rgr
11, B_Bergen_blk
11, B_FieldPack_ghex_F 
4, B_ViperHarness_base_F         
4, B_ViperHarness_blk_F          
4, B_ViperHarness_ghex_F         
4, B_ViperHarness_hex_F          
4, B_ViperHarness_khk_F          
4, B_ViperHarness_oli_F          
6, B_ViperLightHarness_base_F    
6, B_ViperLightHarness_blk_F     
6, B_ViperLightHarness_ghex_F    
6, B_ViperLightHarness_hex_F     
6, B_ViperLightHarness_khk_F     
6, B_ViperLightHarness_oli_F    

> GuerillaVests
7, V_BandollierB_khk
7, V_BandollierB_cbr
7, V_BandollierB_rgr
7, V_BandollierB_blk
7, V_BandollierB_oli
5, V_Chestrig_khk
5, V_Chestrig_rgr
5, V_Chestrig_blk
5, V_Chestrig_oli
7, V_HarnessO_brn
7, V_HarnessOGL_brn
7, V_HarnessO_gry
7, V_HarnessOGL_gry
7, V_HarnessOSpec_brn
7, V_HarnessOSpec_gry
3, V_I_G_resistanceLeader_F

> GuerillaHeadgear
4, Exile_Headgear_GasMask
4, H_Booniehat_khk
4, H_Booniehat_indp
4, H_Booniehat_mcamo
4, H_Booniehat_grn
4, H_Booniehat_tan
4, H_Booniehat_dirty
4, H_Booniehat_dgtl
4, H_Booniehat_khk_hs
3, H_Bandanna_khk
3, H_Bandanna_khk_hs
3, H_Bandanna_cbr
3, H_Bandanna_sgg
3, H_Bandanna_gry
3, H_Bandanna_camo
3, H_Bandanna_mcamo
3, H_BandMask_blk
1, H_Beret_blk
1, H_Beret_red
1, H_Beret_grn
1, H_Beret_grn_SF
1, H_Beret_brn_SF
1, H_Beret_ocamo
1, H_Beret_02
1, H_Beret_Colonel
3, H_Hat_camo
3, H_Cap_brn_SPECOPS
3, H_Cap_tan_specops_US
3, H_Cap_khaki_specops_UK
3, H_Watchcap_blk
3, H_Watchcap_khk
2, H_Watchcap_camo
2, H_Watchcap_sgg
2, H_TurbanO_blk
2, H_Shemag_khk
2, H_Shemag_tan
2, H_Shemag_olive
2, H_Shemag_olive_hs
2, H_ShemagOpen_khk
2, H_ShemagOpen_tan  
2, H_MilCap_tna_F             
2, H_MilCap_ghex_F 
2, H_Booniehat_tna_F   
2, H_MilCap_gen_F             
2, H_Cap_oli_Syndikat_F       
2, H_Cap_tan_Syndikat_F       
2, H_Cap_blk_Syndikat_F       
2, H_Cap_grn_Syndikat_F       
2, H_FakeHeadgear_Syndikat_F    


//Military

> MilitaryClothing
5, U_B_CTRG_1						// CTRG Combat Uniform (UBACS)
5, U_B_CTRG_2						// CTRG Combat Uniform (UBACS2)
5, U_B_CTRG_3						// CTRG Combat Uniform (Tee)
5, U_B_CombatUniform_mcam			// Combat Fatigues (MTP)
5, U_B_CombatUniform_mcam_tshirt	// Combat Fatigues (MTP) (Tee)
5, U_B_CombatUniform_mcam_vest		// Recon Fatigues (MTP)
5, U_B_CombatUniform_mcam_worn		// Worn Combat Fatigues (MTP)
3, U_B_SpecopsUniform_sgg			// Specop Fatigues (Sage)
2, U_O_OfficerUniform_ocamo			// Officer Fatigues (Hex)
2, U_I_OfficerUniform				// Combat Fatigues [AAF] (Tee)
4, U_I_CombatUniform				// Combat Fatigues [AAF]
4, U_I_CombatUniform_tshirt			// Combat Fatigues [AAF] (Tee)
4, U_I_CombatUniform_shortsleeve	// Combat Fatigues [AAF]
4, U_B_HeliPilotCoveralls			// Heli Pilot Coveralls
4, U_O_PilotCoveralls				// Pilot Coveralls [CSAT]
4, U_B_PilotCoveralls				// Pilot Coveralls [NATO]
4, U_I_pilotCoveralls				// Pilot Coveralls [AAF]
4, U_I_HeliPilotCoveralls			// Heli Pilot Coveralls
2, U_B_Wetsuit						// Wetsuit [NATO]
2, U_O_Wetsuit						// Wetsuit [CSAT]
2, U_I_Wetsuit						// Wetsuit [AAF]
2, U_O_CombatUniform_ocamo			// Heli Pilot Coveralls
2, U_O_CombatUniform_oucamo			// Fatigues (Urban) [CSAT]
2, U_O_SpecopsUniform_ocamo			// Recon Fatigues (Hex)
2, U_O_SpecopsUniform_blk			// Recon Fatigues (Black)
2, U_O_V_Soldier_Viper_F            // Special Purpose Suit (Green Hex)
2, U_O_V_Soldier_Viper_hex_F        // Special Purpose Suit (Hex)
5, U_B_T_Soldier_AR_F               // Combat Fatigues (Tropic, Tee)
5, U_B_T_Soldier_SL_F               // Recon Fatigues (Tropic)
5, U_B_CTRG_Soldier_F               // CTRG Stealth Uniform
5, U_B_CTRG_Soldier_2_F             // CTRG Stealth Uniform (Tee)
5, U_B_CTRG_Soldier_3_F             // CTRG Stealth Uniform (Rolled-up)
5, U_B_CTRG_Soldier_urb_1_F         // CTRG Urban Uniform
5, U_B_CTRG_Soldier_urb_2_F         // CTRG Urban Uniform (Tee)
5, U_B_CTRG_Soldier_urb_3_F         // CTRG Urban Uniform (Rolled-up)
5, U_B_GEN_Soldier_F                // Gendarmerie Uniform
5, U_B_GEN_Commander_F              // Gendarmerie Commander Uniform
5, U_O_T_Soldier_F                  // Fatigues (Green Hex) [CSAT]
5, U_O_T_Officer_F                  // Officer Fatigues (Green Hex) [CSAT]

> MilitaryBackpacks
15, B_Carryall_ocamo
15, B_Carryall_oucamo
15, B_Carryall_mcamo
18, B_Carryall_oli
18, B_Carryall_khk
19, B_Carryall_cbr
19, B_Carryall_ghex_F  
6, B_Bergen_Base_F				
6, B_Bergen_mcamo_F              
6, B_Bergen_dgtl_F               
6, B_Bergen_hex_F                
6, B_Bergen_tna_F  

> MilitaryVests
10, V_PlateCarrier1_blk
10, V_PlateCarrier1_rgr
10, V_PlateCarrier2_rgr
10, V_PlateCarrier3_rgr
10, V_PlateCarrierGL_rgr
10, V_PlateCarrierIA1_dgtl
10, V_PlateCarrierIA2_dgtl
10, V_PlateCarrierIAGL_dgtl
10, V_PlateCarrierSpec_rgr
5, V_PlateCarrierL_CTRG
5, V_PlateCarrierH_CTRG

> MilitaryHeadgear
4, Exile_Headgear_GasMask
4, H_MilCap_ocamo
4, H_MilCap_mcamo
4, H_MilCap_oucamo
4, H_MilCap_blue
4, H_MilCap_rucamo
4, H_MilCap_dgtl
3, H_HelmetB
3, H_HelmetB_paint
3, H_HelmetB_light
3, H_HelmetB_plain_blk
3, H_HelmetSpecB
3, H_HelmetSpecB_paint1
3, H_HelmetSpecB_paint2
3, H_HelmetSpecB_blk
3, H_HelmetIA
2, H_HelmetIA_net
2, H_HelmetIA_camo
2, H_HelmetB_grass
2, H_HelmetB_snakeskin
2, H_HelmetB_desert
2, H_HelmetB_black
2, H_HelmetB_sand
2, H_HelmetB_light_grass
2, H_HelmetB_light_snakeskin
2, H_HelmetB_light_desert
2, H_HelmetB_light_black
2, H_HelmetB_light_sand
1, H_HelmetCrew_B
1, H_HelmetCrew_O
1, H_HelmetCrew_I
1, H_PilotHelmetFighter_B
1, H_PilotHelmetFighter_O
1, H_PilotHelmetFighter_I
1, H_PilotHelmetHeli_B
1, H_PilotHelmetHeli_O
1, H_PilotHelmetHeli_I
1, H_HelmetB_camo
1, H_CrewHelmetHeli_B
1, H_CrewHelmetHeli_O
1, H_CrewHelmetHeli_I
2, H_BandMask_khk
2, H_BandMask_reaper
2, H_BandMask_demon
1, H_HelmetO_oucamo
1, H_HelmetLeaderO_oucamo
1, H_HelmetSpecO_ocamo
1, H_HelmetSpecO_blk
1, H_HelmetO_ocamo
1, H_HelmetLeaderO_ocamo
1, H_HelmetO_ghex_F 
2, H_Helmet_Skate    
2, H_HelmetB_Enh_tna_F        
2, H_HelmetB_Light_tna_F 	
2, H_Beret_gen_F  
2, H_HelmetB_tna_F   		 
2, H_HelmetSpecO_ghex_F       
2, H_HelmetLeaderO_ghex_F
2, H_HelmetCrew_O_ghex_F 
2, H_HelmetB_TI_tna_F   

> Ghillies
1, U_B_GhillieSuit			// Ghillie Suit [NATO]
1, U_O_GhillieSuit			// Ghillie Suit [CSAT]
1, U_I_GhillieSuit			// Ghillie Suit [AAF]

> DLCGhillies
1, U_B_FullGhillie_ard		
1, U_B_FullGhillie_lsh
1, U_B_FullGhillie_sard
1, U_O_FullGhillie_ard
1, U_O_FullGhillie_lsh
1, U_O_FullGhillie_sard
1, U_I_FullGhillie_ard
1, U_I_FullGhillie_lsh
1, U_I_FullGhillie_sard
5, U_B_T_Sniper_F                   // Ghillie Suit (Tropic) [NATO]
5, U_B_T_Soldier_F        			// Ghillie Suit (Tropic) [NATO]
5, U_B_T_FullGhillie_tna_F          // Full Ghillie (Jungle) [NATO]
5, U_O_T_Sniper_F                   // Ghillie Suit (Green Hex) [CSAT]
5, U_O_T_FullGhillie_tna_F          // Full Ghillie (Jungle) [CSAT]

> DLCVests
1, V_PlateCarrierGL_blk
1, V_PlateCarrierGL_mtp
1, V_PlateCarrierGL_rgr
1, V_PlateCarrierIAGL_dgtl
1, V_PlateCarrierIAGL_oli
1, V_PlateCarrierSpec_blk
1, V_PlateCarrierSpec_mtp
1, V_PlateCarrierSpec_rgr
1, V_TacChestrig_grn_F         
1, V_TacChestrig_oli_F         
1, V_TacChestrig_cbr_F         
1, V_PlateCarrier1_tna_F       
1, V_PlateCarrier2_tna_F       
1, V_PlateCarrierSpec_tna_F    
1, V_PlateCarrierGL_tna_F      
1, V_HarnessO_ghex_F           
1, V_HarnessOGL_ghex_F         
1, V_BandollierB_ghex_F        
1, V_TacVest_gen_F             
1, V_PlateCarrier1_rgr_noflag_F
1, V_PlateCarrier2_rgr_noflag_F

> Rebreathers
1, V_RebreatherB
1, V_RebreatherIR
1, V_RebreatherIA

///////////////////////////////////////////////////////////////////////////////
// Other Items
///////////////////////////////////////////////////////////////////////////////

> MedicalItems
2, Exile_Item_InstaDoc
5, Exile_Item_Bandage
10, Exile_Item_Vishpirin
10, Exile_Item_Heatpack

> IndustrialItems
1, Exile_Item_ThermalScannerPro
1, Exile_Item_Codelock
2, Exile_Item_Knife
3, Exile_Item_Cement
3, Exile_Item_FloodLightKit
3, Exile_Item_PortableGeneratorKit
4, Exile_Item_CamoTentKit
4, Exile_Item_MetalBoard
4, Exile_Item_Foolbox
4, Exile_Item_Sand
5, Exile_Item_Grinder
5, Exile_Item_MetalScrews
5, Exile_Melee_SledgeHammer
8, Exile_Item_ExtensionCord
9, Exile_Item_LightBulb
10, Exile_Item_WaterCanisterEmpty
10, Exile_Melee_Shovel
11, Exile_Item_JunkMetal
13, Exile_Item_Handsaw
13, Exile_Item_Pliers
13, Exile_Item_ScrewDriver
22, Exile_Melee_Axe
10,Exile_Item_MetalWire
20, Exile_Item_Wrench
8, Exile_Item_CordlessScrewdriver
3, Exile_Item_FireExtinguisher
10, Exile_Item_OilCanister
14, Exile_Item_Hammer
4, Exile_Item_Rope
20,	Exile_Item_CarWheel

> Vehicle
40, Exile_Item_FuelCanisterFull
50, Exile_Item_FuelCanisterEmpty
10, Exile_Item_DuctTape

// Throwables

> Chemlights
1, Chemlight_blue
1, Chemlight_green
1, Chemlight_red
1, Chemlight_yellow

> RoadFlares
1, FlareGreen_F
1, FlareRed_F
1, FlareWhite_F
1, FlareYellow_F

> SmokeGrenades
1, SmokeShell
1, SmokeShellRed
1, SmokeShellGreen
1, SmokeShellYellow
1, SmokeShellPurple
1, SmokeShellBlue
1, SmokeShellOrange

> Restraints
1, Exile_Item_ZipTie

> Electronics
1, Exile_Item_Laptop
1, Exile_Item_BaseCameraKit

 // Trash or items not currently being used

> Trash
4, Exile_Item_Can_Empty
4, Exile_Item_ToiletPaper
4, Exile_Item_PlasticBottleEmpty			// Nothing :)
1, Exile_Item_Magazine01
1, Exile_Item_Magazine02
1, Exile_Item_Magazine03
1, Exile_Item_Magazine04

> ThermalHelmetGroup
50, Exile_Item_Can_Empty
50, Exile_Item_ToiletPaper
50, Exile_Item_PlasticBottleEmpty			// Nothing :)
1, Chemlight_blue
1, Chemlight_green
1, Chemlight_red
1, Chemlight_yellow
1, 	H_HelmetO_ViperSP_hex_F


> Unused
3, Exile_Item_CordlessScrewdriver
3, Exile_Item_FireExtinguisher
10, Exile_Item_OilCanister
14, Exile_Item_Hammer
5, Exile_Item_Defibrillator
4, Exile_Item_Rope
