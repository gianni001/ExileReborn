/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */
 
if (!hasInterface || isServer) exitWith {};
 
setTerrainGrid 3.125;
setViewDistance 1500;
 
switch (toLower worldName) do
{
    case "altis":
    {  
        // 20 NPCs
        private _npcs = [
        ["Exile_Trader_SpecialOperations", ["c4coming2cDf_genericstani1","c4coming2cDf_genericstani2","c4coming2cDf_genericstani3"], "Exile_Trader_SpecialOperations", "AfricanHead_03", [["srifle_DMR_02_sniper_F","","","optic_AMS_khk",["10Rnd_338_Mag",10],[],"bipod_01_F_khk"],[],[],["U_B_CTRG_Soldier_3_F",[["10Rnd_338_Mag",10,1]]],[],[],"H_Watchcap_blk","",[],["","","","","",""]], [4878.63, 21930.1, 347.208], [-0.465058, -0.88528, 0], [0, 0, 1]],
        ["Exile_Trader_Vehicle", ["Acts_carFixingWheel"], "Exile_Trader_Vehicle", "WhiteHead_12", [[],[],[],["U_I_C_Soldier_Bandit_2_F",[]],[],[],"H_Bandanna_khk","",[],["","","","","",""]], [20676, 15631.9, 16.6631], [-0.672225, -0.740347, 0], [0, 0, 1]],
        ["Exile_Guard_01", ["InBaseMoves_assemblingVehicleErc"], "", "GreekHead_A3_09", [[],[],[],["U_C_Man_casual_4_F",[]],[],[],"","G_Combat",[],["","","","","",""]], [20677.9, 15629, 16.7329], [-0.788929, -0.614484, 0], [0, 0, 1]],
        ["Exile_Trader_Aircraft", ["InBaseMoves_patrolling1"], "Exile_Trader_Aircraft", "WhiteHead_14", [["Exile_Weapon_AK74_GL","","","",["Exile_Magazine_30Rnd_545x39_AK",30],[],""],[],[],["U_I_C_Soldier_Para_2_F",[["Exile_Magazine_30Rnd_545x39_AK",30,1]]],[],[],"","G_Tactical_Clear",[],["","","","","",""]], [20828, 7208.62, 29.0015], [0.183008, -0.983112, 0], [0, 0, 1]],
        ["Exile_Guard_01", ["AmovPsitMstpSrasWrflDnon_WeaponCheck1"], "", "GreekHead_A3_07", [["srifle_DMR_03_F","","","",[],[],""],[],[],["U_BG_Guerilla1_1",[]],[],[],"H_ShemagOpen_tan","G_Aviator",[],["","","","","",""]], [20825.3, 7205.78, 29.002], [-0.606946, 0.794743, 0], [0, 0, 1]],
        ["Exile_Trader_Armory", ["HubSittingChairA_idle1","HubSittingChairA_idle2"], "Exile_Trader_Armory", "WhiteHead_16", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"H_Cap_headphones","G_Shades_Black",[],["","","","","",""]], [9242.63, 11478.9, 109.956], [-0.994946, -0.100414, 0], [0, 0, 1]],
        ["Exile_Guard_03", ["InBaseMoves_patrolling1"], "", "GreekHead_A3_07", [["SMG_02_F","","","",[],[],""],[],[],["U_BG_Guerilla2_3",[]],["V_TacVestIR_blk",[]],[],"H_Bandanna_camo","G_Squares_Tinted",[],["","","","","",""]], [9240.6, 11473.3, 110.047], [-0.663286, -0.748366, 0], [0, 0, 1]],
        ["Exile_Trader_Office", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Office", "WhiteHead_16", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","G_Aviator",[],["","","","","",""]], [3138.57, 13088.9, 70.7448], [-0.994392, 0.105761, 0], [0, 0, 1]],
        ["Exile_Guard_01", ["InBaseMoves_patrolling1"], "", "WhiteHead_13", [["srifle_DMR_03_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_TacVest_khk",[]],[],"H_ShemagOpen_tan","G_Aviator",[],["","","","","",""]], [3134.75, 13099.9, 75.8115], [-0.602066, -0.798446, 0], [0, 0, 1]],
        ["Exile_Guard_02", ["InBaseMoves_patrolling2"], "", "WhiteHead_13", [["arifle_Mk20_GL_F","","","",[],[],""],[],[],["U_BG_Guerilla1_1",[]],["V_PlateCarrierIA2_dgtl",[]],[],"H_Hat_camo","G_Combat",[],["","","","","",""]], [3149.01, 13077.5, 78.249], [-0.839563, -0.543263, 0], [0, 0, 1]],
        ["Exile_Trader_Hardware", ["HubSittingChairUB_idle3"], "Exile_Trader_Hardware", "WhiteHead_08", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"H_Booniehat_khk_hs","G_Tactical_Clear",[],["","","","","",""]], [6229.53, 16256.5, 44.0361], [0.0146079, 0.999893, 0], [0, 0, 1]],
        ["Exile_Guard_03", ["Acts_LyingWounded_loop1"], "", "AfricanHead_01", [[],[],[],["U_I_C_Soldier_Bandit_4_F",[]],["V_TacVestIR_blk",[]],[],"H_Bandanna_camo","G_Squares_Tinted",[],["","","","","",""]], [6233.16, 16256, 43.0013], [-1, -0.00079869, 0], [0, 0, 1]],
        ["Exile_Trader_Boat", ["HubSittingChairUA_idle1"], "Exile_Trader_Boat", "WhiteHead_15", [[],[],[],["U_OrestesBody",[]],[],[],"H_Cap_surfer","",[],["","","","","",""]], [13363, 14512.2, 1.70189], [0.506124, -0.862461, 0], [0, 0, 1]],
        ["Exile_Trader_Diving", ["AdvePercMstpSnonWnonDnon"], "Exile_Trader_Diving", "GreekHead_A3_09", [[],[],[],["U_I_Wetsuit",[]],["V_RebreatherIA",[]],[],"","G_I_Diving",[],["","","","","",""]], [13374.6, 14498.5, -0.832719], [-0.571172, 0.82083, 0], [0, 0, 1]],
        ["Exile_Trader_WasteDump", ["LHD_krajPaluby"], "Exile_Trader_WasteDump", "WhiteHead_09", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","G_Combat",[],["","","","","",""]], [5883.02, 20111.8, 225.972], [-0.78726, 0.616621, 0], [0, 0, 1]],
        ["Exile_Guard_01", ["InBaseMoves_patrolling1"], "", "WhiteHead_09", [["srifle_LeeEnfield","","","",["10x_303_M",10],[],""],[],[],["U_BG_Guerilla3_1",[["10x_303_M",10,3]]],["V_TacVest_khk",[]],[],"H_Cap_tan","G_Combat",[],["","","","","",""]], [5889.27, 20118.6, 225.482], [0, 1, 0], [0, 0, 1]],
        ["Exile_Guard_01", ["InBaseMoves_patrolling2"], "", "WhiteHead_01", [["arifle_MX_Black_F","","","optic_Arco_blk_F",["30Rnd_65x39_caseless_mag",30],[],"bipod_01_F_blk"],[],[],["U_I_G_resistanceLeader_F",[["30Rnd_65x39_caseless_mag",30,3]]],["V_TacVest_khk",[]],["B_AssaultPack_blk",[]],"H_Bandanna_gry","G_Bandanna_shades",[],["","","","","",""]], [5864.97, 20105.8, 225.847], [0.47115, 0.882053, 0], [0, 0, 1]],
        ["Exile_Trader_Equipment", ["c5efe_MichalLoop"], "Exile_Trader_Equipment", "WhiteHead_15", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"H_Watchcap_khk","G_Combat",[],["","","","","",""]], [9240.05, 11476.3, 112.362], [0.999916, 0.0129649, 0], [0, 0, 1]],
        ["Exile_Trader_AircraftCustoms", ["HubBriefing_scratch","HubBriefing_think"], "Exile_Trader_AircraftCustoms", "WhiteHead_09", [[],[],[],["U_I_G_Story_Protagonist_F",[]],[],[],"H_Booniehat_oli","G_Tactical_Clear",[],["","","","","",""]], [20821.9, 7203.51, 29.0007], [-0.531857, 0.846834, 0], [0, 0, 1]],
        ["Exile_Trader_VehicleCustoms", ["HubFixingVehicleProne_idle1"], "Exile_Trader_VehicleCustoms", "WhiteHead_09", [[],[],[],["U_BG_Guerilla2_2",[]],[],[],"H_StrawHat_dark","",[],["","","","","",""]], [20677.7, 15627, 16.7865], [0.661139, -0.750263, 0], [0, 0, 1]]
        ];
 
        {
            private _logic = "Logic" createVehicleLocal [0, 0, 0];
            private _trader = (_x select 0) createVehicleLocal [0, 0, 0];
            private _animations = _x select 1;
           
            _logic setPosWorld (_x select 5);
            _logic setVectorDirAndUp [_x select 6, _x select 7];
           
            _trader setVariable ["BIS_enableRandomization", false];
            _trader setVariable ["BIS_fnc_animalBehaviour_disable", true];
            _trader setVariable ["ExileAnimations", _animations];
            _trader setVariable ["ExileTraderType", _x select 2];
            _trader disableAI "ANIM";
            _trader disableAI "MOVE";
            _trader disableAI "FSM";
            _trader disableAI "AUTOTARGET";
            _trader disableAI "TARGET";
            _trader disableAI "CHECKVISIBLE";
            _trader allowDamage false;
            _trader setFace (_x select 3);
            _trader setUnitLoadOut (_x select 4);
            _trader setPosWorld (_x select 5);
            _trader setVectorDirAndUp [_x select 6, _x select 7];
            _trader reveal _logic;
            _trader attachTo [_logic, [0, 0, 0]];
            _trader switchMove (_animations select 0);
            _trader addEventHandler ["AnimDone", {_this call ExileClient_object_trader_event_onAnimationDone}];
        }
        forEach _npcs;
    };
    case "esseker":
    {
        private _npcs = [
        ["Exile_Trader_Equipment", ["HubSittingChairA_idle1","HubSittingChairA_idle2"], "Exile_Trader_Equipment", "GreekHead_A3_08", [["arifle_AK107","","acc_pointer_IR","optic_Arco",["30Rnd_545x39_AK",30],[],""],[],[],["U_BG_Guerrilla_6_1",[["30Rnd_545x39_AK",30,1]]],["V_I_G_resistanceLeader_F",[["30Rnd_545x39_AK",30,2]]],[],"H_Booniehat_oli","G_Tactical_Clear",[],["","","","","",""]], [8071.92, 6415.11, 116.19], [0.999974, -0.00725673, 0], [0, 0, 1]],
        ["Exile_Guard_01", ["InBaseMoves_patrolling1","InBaseMoves_patrolling2"], "", "WhiteHead_05", [["arifle_CTARS_hex_F","muzzle_snds_58_blk_F","acc_flashlight","optic_AMS",[],[],""],[],["Exile_Weapon_Makarov","","","",["Exile_Magazine_8Rnd_9x18",8],[],""],["U_BG_Guerilla2_1",[["Exile_Magazine_8Rnd_9x18",8,3]]],["V_PlateCarrier1_blk",[]],[],"H_ShemagOpen_khk","G_Tactical_Black",[],["","","","","",""]], [8091.43, 6434.16, 119.946], [0, 1, 0], [0, 0, 1]],
        ["Exile_Trader_Armory", ["HubStanding_idle1","HubStanding_idle2","HubStanding_idle3"], "Exile_Trader_Armory", "WhiteHead_03", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"H_Beret_02","G_Shades_Black",[],["","","","","",""]], [2752.78, 11263.2, 136.92], [0.0317422, -0.999496, 0], [0, 0, 1]],
        ["Exile_Guard_01", ["InBaseMoves_patrolling1","InBaseMoves_patrolling2"], "", "WhiteHead_03", [["Exile_Weapon_AKM","","acc_pointer_IR","optic_Holosight",["Exile_Magazine_30Rnd_762x39_AK",30],[],""],[],[],["U_I_C_Soldier_Camo_F",[["Exile_Magazine_30Rnd_762x39_AK",30,1]]],["V_TacVest_camo",[]],[],"H_Cap_blk","G_Tactical_Clear",[],["","","","","",""]], [2728.18, 11283.9, 134.825], [0, 1, 0], [0, 0, 1]],
        ["Exile_Guard_02", ["HubSittingChairA_idle1","HubSittingChairA_idle2"], "", "GreekHead_A3_07", [["Exile_Weapon_AKM","","acc_pointer_IR","optic_Holosight",["Exile_Magazine_30Rnd_762x39_AK",30],[],""],[],[],["U_I_C_Soldier_Camo_F",[["Exile_Magazine_30Rnd_762x39_AK",30,1]]],["V_TacVest_oli",[]],[],"H_Cap_oli_hs","G_Bandanna_oli",[],["","","","","",""]], [2730.34, 11281.3, 135.021], [-0.902702, -0.430266, 0], [0, 0, 1]],
        ["Exile_Trader_Hardware", ["InBaseMoves_sitHighUp1"], "Exile_Trader_Hardware", "WhiteHead_14", [[],[],[],["U_BG_Guerilla2_1",[]],[],[],"H_Bandanna_gry","",[],["","","","","",""]], [3977.57, 9286.04, 150.587], [-0.801588, -0.597876, 0], [0, 0, 1]],
        ["Exile_Guard_01", ["InBaseMoves_patrolling1"], "", "GreekHead_A3_09", [["arifle_CTAR_GL_ghex_F","muzzle_snds_58_wdm_F","acc_pointer_IR","optic_AMS",["30Rnd_580x42_Mag_F",30],[],""],[],[],["U_B_CTRG_Soldier_3_F",[["30Rnd_580x42_Mag_F",30,3]]],["V_PlateCarrier1_rgr",[]],[],"H_Bandanna_gry","G_Bandanna_sport",[],["","","","","",""]], [3969.2, 9284.63, 154.613], [-0.588731, -0.808329, 0], [0, 0, 1]],
        ["Exile_Guard_02", ["InBaseMoves_patrolling2"], "", "AfricanHead_01", [["arifle_MX_GL_F","muzzle_snds_H_khk_F","acc_pointer_IR","optic_AMS",["30Rnd_65x39_caseless_mag",30],[],""],[],[],["U_I_OfficerUniform",[["30Rnd_65x39_caseless_mag",30,3]]],["V_PlateCarrier2_blk",[]],[],"H_Beret_gen_F","G_Bandanna_shades",[],["","","","","",""]], [3972.96, 9292.2, 154.25], [0, 1, 0], [0, 0, 1]],
        ["Exile_Trader_WasteDump", ["InBaseMoves_SittingRifle1"], "Exile_Trader_WasteDump", "WhiteHead_02", [["Exile_Weapon_LeeEnfield","","","",["Exile_Magazine_10Rnd_303",10],[],""],[],[],["U_I_G_Story_Protagonist_F",[["Exile_Magazine_10Rnd_303",10,3]]],["V_Rangemaster_belt",[]],[],"H_MilCap_ocamo","G_Tactical_Clear",[],["","","","","",""]], [11166.3, 9103.02, 65.0034], [-0.999056, 0.0434448, 0], [0, 0, 1]],
        ["Exile_Guard_02", ["InBaseMoves_patrolling2"], "", "WhiteHead_02", [["LMG_Mk200_F","","","",["200Rnd_65x39_cased_Box",200],[],""],[],[],["U_BG_Guerilla2_1",[]],["V_PlateCarrierH_CTRG",[["200Rnd_65x39_cased_Box",200,1]]],[],"H_Cap_usblack","G_Tactical_Clear",[],["","","","","",""]], [11191.1, 9101.75, 70.8194], [-0.966007, -0.258515, 0], [0, 0, 1]],
        ["Exile_Trader_SpecialOperations", ["HubStanding_idle1","HubStanding_idle2","HubStanding_idle3"], "Exile_Trader_SpecialOperations", "WhiteHead_13", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],["",[]],"H_HelmetB_light_black","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [6646.1, 3711.54, 238.683], [-0.102654, -0.994717, 0], [0, 0, 1]],
        ["Exile_Guard_01", ["InBaseMoves_patrolling1"], "", "WhiteHead_19", [["Exile_Weapon_DMR","","","",["Exile_Magazine_20Rnd_762x51_DMR",20],[],""],[],[],["U_I_G_Story_Protagonist_F",[["Exile_Magazine_20Rnd_762x51_DMR",20,1]]],["V_TacVest_oli",[]],[],"H_HelmetB","G_Tactical_Black",[],["","","","","","O_NVGoggles_ghex_F"]], [6648.05, 3710.19, 241.204], [0.999939, 0.0110826, 0], [0, 0, 1]],
        ["Exile_Trader_Vehicle", ["InBaseMoves_table1"], "Exile_Trader_Vehicle", "WhiteHead_09", [[],[],[],["U_C_Driver_3",[]],[],[],"H_Watchcap_blk","G_Shades_Black",[],["","","","","",""]], [3108.8, 4488.93, 113.988], [0.973802, 0.227399, 0], [0, 0, 1]],
        ["Exile_Trader_VehicleCustoms", ["AidlPercMstpSnonWnonDnon_G01","AidlPercMstpSnonWnonDnon_G02","AidlPercMstpSnonWnonDnon_G03","AidlPercMstpSnonWnonDnon_G04","AidlPercMstpSnonWnonDnon_G05","AidlPercMstpSnonWnonDnon_G06"], "", "WhiteHead_09", [[],[],[],["U_C_WorkerCoveralls",[]],[],[],"","G_Shades_Red",[],["","","","","",""]], [3111.35, 4492.2, 113.812], [-0.773508, -0.633786, 0], [0, 0, 1]],
        ["Exile_Guard_01", ["InBaseMoves_patrolling2"], "", "WhiteHead_07", [["LMG_Mk200_F","muzzle_snds_H_MG_khk_F","","optic_Arco_blk_F",[],[],"bipod_02_F_hex"],[],[],["U_I_G_Story_Protagonist_F",[]],[],[],"H_Cap_brn_SPECOPS","G_Balaclava_TI_tna_F",[],["","","","","",""]], [3139.29, 4504.25, 116.994], [0, 1, 0], [0, 0, 1]],
        ["Exile_Guard_02", ["InBaseMoves_patrolling1"], "", "GreekHead_A3_06", [["LMG_Mk200_F","muzzle_snds_H_MG_khk_F","","optic_Arco_blk_F",[],[],"bipod_02_F_hex"],[],[],["U_I_G_Story_Protagonist_F",[]],[],[],"H_Booniehat_oli","G_Bandanna_sport",[],["","","","","",""]], [3132.43, 4472.07, 116.994], [-0.87165, -0.490128, 0], [0, 0, 1]],
        ["Exile_Trader_Aircraft", ["LHD_krajPaluby"], "Exile_Trader_Aircraft", "AfricanHead_02", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"H_Cap_grn_BI","G_Shades_Green",[],["","","","","",""]], [10046, 4847.35, 17.0699], [0, 1, 0], [0, 0, 1]],
        ["Exile_Trader_AircraftCustoms", ["InBaseMoves_sitHighUp1"], "Exile_Trader_AircraftCustoms", "GreekHead_A3_08", [["arifle_AK47","","","",["30Rnd_762x39_AK47_M",30],[],""],[],[],["Exile_Uniform_ExileCustoms",[["30Rnd_762x39_AK47_M",30,1]]],[],[],"H_Cap_blk_CMMG","G_Tactical_Clear",[],["","","","","",""]], [10043.2, 4845.17, 16.8701], [0.835136, -0.550044, 0], [0, 0, 1]],["Exile_Guard_01", ["InBaseMoves_patrolling2"], "", "WhiteHead_20", [["arifle_ARX_ghex_F","muzzle_snds_65_TI_hex_F","acc_flashlight","optic_Arco",["30Rnd_65x39_caseless_green",30],[],"bipod_02_F_hex"],[],[],["U_B_CombatUniform_mcam_tshirt",[["30Rnd_65x39_caseless_green",30,3]]],["V_PlateCarrier2_blk",[]],[],"H_Booniehat_tan","G_Tactical_Clear",[],["","","","","",""]], [10043.8, 4845.19, 20.9099], [0, 1, 0], [0, 0, 1]],
        ["Exile_Guard_02", ["InBaseMoves_patrolling1"], "", "WhiteHead_01", [["arifle_ARX_blk_F","muzzle_snds_65_TI_hex_F","acc_flashlight","optic_Arco",["30Rnd_65x39_caseless_green",30],[],"bipod_02_F_hex"],[],[],["U_I_G_resistanceLeader_F",[["30Rnd_65x39_caseless_green",30,3]]],["V_PlateCarrier2_rgr",[]],[],"H_Watchcap_blk","G_Tactical_Clear",[],["","","","","",""]], [10039.2, 4847.72, 17.0777], [0, 1, 0], [0, 0, 1]],
        ["Exile_Trader_Office", ["HubSittingAtTableU_idle1","HubSittingAtTableU_idle2","HubSittingAtTableU_idle3"], "Exile_Trader_Office", "WhiteHead_05", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","",[],["","","","","",""]], [7579.91, 4538.88, 117.07], [0, 1, 0], [0, 0, 1]],
        ["Exile_Trader_Boat", ["HubStandingUA_idle1","HubStandingUA_idle2","HubStandingUA_idle3"], "Exile_Trader_Boat", "AfricanHead_03", [[],[],[],["U_OrestesBody",[]],[],[],"H_Cap_surfer","G_Tactical_Clear",[],["","","","","",""]], [5736.68, 5447.53, 1.24214], [-0.680515, -0.732734, 0], [0, 0, 1]],
        ["Exile_Trader_BoatCustoms", ["Acts_CivilListening_2"], "Exile_Trader_BoatCustoms", "WhiteHead_07", [[],[],[],["U_C_Man_casual_6_F",[]],[],[],"","G_Sport_Blackyellow",[],["","","","","",""]], [5729.82, 5437.14, 1.26416], [-0.682624, -0.73077, 0], [0, 0, 1]],
        ["Exile_Trader_Diving", ["HubSittingChairB_idle1","HubSittingChairB_idle2","HubSittingChairB_idle3","HubSittingChairB_move1"], "Exile_Trader_Diving", "WhiteHead_14", [["arifle_SDAR_F","","","",[],[],""],[],[],["U_I_Wetsuit",[]],["V_RebreatherIA",[]],[],"","G_I_Diving",[],["","","","","",""]], [5762.67, 5456.62, 0.424396], [0.650111, 0.759839, 0], [0, 0, 1]]
        ];

        {
            private _logic = "Logic" createVehicleLocal [0, 0, 0];
            private _trader = (_x select 0) createVehicleLocal [0, 0, 0];
            private _animations = _x select 1;
           
            _logic setPosWorld (_x select 5);
            _logic setVectorDirAndUp [_x select 6, _x select 7];
           
            _trader setVariable ["BIS_enableRandomization", false];
            _trader setVariable ["BIS_fnc_animalBehaviour_disable", true];
            _trader setVariable ["ExileAnimations", _animations];
            _trader setVariable ["ExileTraderType", _x select 2];
            _trader disableAI "ANIM";
            _trader disableAI "MOVE";
            _trader disableAI "FSM";
            _trader disableAI "AUTOTARGET";
            _trader disableAI "TARGET";
            _trader disableAI "CHECKVISIBLE";
            _trader allowDamage false;
            _trader setFace (_x select 3);
            _trader setUnitLoadOut (_x select 4);
            _trader setPosWorld (_x select 5);
            _trader setVectorDirAndUp [_x select 6, _x select 7];
            _trader reveal _logic;
            _trader attachTo [_logic, [0, 0, 0]];
            _trader switchMove (_animations select 0);
            _trader addEventHandler ["AnimDone", {_this call ExileClient_object_trader_event_onAnimationDone}];
        }
        forEach _npcs;
    };
    
    case "tanoa":
    {
        // 76 NPCs
        private _npcs = [
        ["Exile_Trader_WasteDump", ["Acts_CivilListening_2"], "Exile_Trader_WasteDump", "Default", [[],[],[],["U_I_C_Soldier_Bandit_4_F",[]],[],[],"H_Hat_grey","",[],["","","","","",""]], [2253.92, 8581.53, 1.44809], [-0.031831, 0.999493, 0], [0, 0, 1]],
        ["Exile_Trader_Aircraft", ["LHD_krajPaluby"], "Exile_Trader_Aircraft", "AfricanHead_03", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"H_PilotHelmetHeli_O","",[],["","","","","",""]], [2104.65, 3447.84, 12.9514], [-0.480545, 0.87697, 0], [0, 0, 1]],
        ["Exile_Trader_AircraftCustoms", ["HubStandingUA_idle1","HubStandingUA_idle2","HubStandingUA_idle3","HubStandingUA_move1","HubStandingUA_move2"], "Exile_Trader_AircraftCustoms", "WhiteHead_01", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"H_PilotHelmetFighter_B","G_Tactical_Clear",[],["","","","","",""]], [2096.73, 3442.05, 12.9514], [0.884801, 0.46597, 0], [0, 0, 1]],
        ["Exile_Trader_RussianRoulette", ["HubStandingUB_idle1","HubStandingUB_idle2","HubStandingUB_idle3","HubStandingUB_move1"], "Exile_Trader_RussianRoulette", "WhiteHead_04", [[],[],["hgun_Pistol_Signal_F","","","",[],[],""],["U_Marshal",[]],["V_Rangemaster_belt",[]],[],"H_Cap_marshal","G_Sport_Blackyellow",[],["","","","","",""]], [9385.44, 6210.36, 1.63078], [0.606488, 0.795093, 0], [0, 0, 1]],
        ["Exile_Trader_Armory", ["InBaseMoves_SittingRifle1","InBaseMoves_SittingRifle2"], "Exile_Trader_Armory", "WhiteHead_10", [["arifle_SPAR_03_khk_F","","","",["20Rnd_762x51_Mag",20],[],""],[],[],["U_I_C_Soldier_Para_1_F",[["20Rnd_762x51_Mag",20,2]]],["V_Rangemaster_belt",[["20Rnd_762x51_Mag",20,1]]],[],"","",[],["","","","","",""]], [2295.35, 8589.59, 1.50615], [-0.666272, 0.745709, 0], [0, 0, 1]],
        ["Exile_Trader_Equipment", ["HubStanding_idle1","HubStanding_idle2","HubStanding_idle3"], "Exile_Trader_Equipment", "WhiteHead_20", [["arifle_CTAR_blk_F","","","",["30Rnd_580x42_Mag_F",30],[],""],[],[],["U_I_C_Soldier_Para_4_F",[["30Rnd_580x42_Mag_F",30,3]]],["V_I_G_resistanceLeader_F",[]],[],"H_Bandanna_camo","G_Bandanna_tan",[],["","","","","",""]], [2287.87, 8588.71, 1.47454], [0, 1, 0], [0, 0, 1]],
        ["Exile_Trader_Hardware", ["HubSittingHighB_idle1","HubSittingHighB_idle2","HubSittingHighB_idle3"], "Exile_Trader_Hardware", "WhiteHead_14", [["arifle_SPAR_01_blk_F","","","",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_Pistol_01_F","","","",[],[],""],["U_I_C_Soldier_Camo_F",[["16Rnd_9x21_Mag",16,4],["30Rnd_556x45_Stanag",30,1]]],["V_TacChestrig_oli_F",[["30Rnd_556x45_Stanag",30,2]]],[],"H_Booniehat_khk_hs","",[],["","","","","",""]], [2284.32, 8597.58, 1.52897], [0.765317, -0.643654, 0], [0, 0, 1]],
        ["Exile_Trader_Office", ["HubSittingChairUB_idle1","HubSittingChairUB_idle2","HubSittingChairUB_idle3","HubSittingChairUB_move1"], "Exile_Trader_Office", "WhiteHead_16", [[],[],[],["U_I_C_Soldier_Camo_F",[]],[],[],"H_Booniehat_khk","",[],["","","","","",""]], [2279.14, 8589.32, 4.06135], [0.675045, 0.737777, 0], [0, 0, 1]],
        ["Exile_Trader_Food", ["HubSittingChairB_idle1","HubSittingChairB_idle2","HubSittingChairB_idle3","HubSittingChairB_move1"], "Exile_Trader_Food", "AfricanHead_02", [[],[],[],["U_I_C_Soldier_Bandit_2_F",[]],[],[],"H_Bandanna_sand","",[],["","","","","",""]], [2251.37, 8602.04, 1.29314], [-0.604542, -0.796573, 0], [0, 0, 1]],
        ["Exile_Trader_Boat", ["HubSittingChairUB_idle1","HubSittingChairUB_idle2","HubSittingChairUB_idle3","HubSittingChairUB_move1"], "Exile_Trader_Boat", "WhiteHead_21", [[],[],[],["U_C_man_sport_1_F",[]],[],[],"H_Bandanna_surfer","G_Shades_Blue",[],["","","","","",""]], [2224.45, 8652.17, 1.29101], [-0.0264541, -0.99965, 0], [0, 0, 1]],
        ["Exile_Trader_BoatCustoms", ["Acts_passenger_flatground_leanright"], "Exile_Trader_BoatCustoms", "WhiteHead_04", [[],[],[],["U_C_man_sport_3_F",[]],[],[],"H_Bandanna_surfer_blk","",[],["","","","","",""]], [2222.15, 8651.68, 1.28518], [0.449575, -0.893243, 0], [0, 0, 1]],
        ["Exile_Trader_Vehicle", ["Kart_driver"], "Exile_Trader_Vehicle", "WhiteHead_01", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"H_RacingHelmet_4_F","G_Combat",[],["","","","","",""]], [2217.15, 8605.66, 1.27332], [0.674077, 0.716846, -0.178193], [0.120389, 0.131394, 0.983993]],
        ["Exile_Trader_VehicleCustoms", ["InBaseMoves_table1"], "Exile_Trader_VehicleCustoms", "AfricanHead_02", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"","G_Squares_Tinted",[],["","","","","",""]], [2212.38, 8596.92, 1.38616], [0, 1, 0], [0, 0, 1]],
        ["Exile_Trader_SpecialOperations", ["Acts_passenger_flatground_leanright"], "Exile_Trader_SpecialOperations", "AfricanHead_03", [[],[],[],["U_B_CTRG_Soldier_3_F",[]],["V_BandollierB_oli",[]],["B_ViperLightHarness_oli_F",[]],"H_HelmetB_TI_tna_F","G_Balaclava_TI_G_tna_F",[],["","","","","",""]], [4434.98, 4311.21, 14.0379], [0.743393, -0.668855, 0], [0, 0, 1]],
        ["Exile_Guard_01", ["InBaseMoves_SittingRifle1","InBaseMoves_SittingRifle2"], "", "GreekHead_A3_05", [["arifle_SPAR_03_khk_F","","","optic_AMS_khk",["20Rnd_762x51_Mag",20],[],""],[],[],["U_B_CTRG_Soldier_F",[["20Rnd_762x51_Mag",20,2]]],[],["B_ViperHarness_oli_F",[["20Rnd_762x51_Mag",20,1]]],"H_HelmetB_TI_tna_F","G_Balaclava_TI_G_tna_F",[],["","","","","",""]], [4442.91, 4311.77, 13.5701], [0.0396142, -0.999215, 0], [0, 0, 1]],
        ["Exile_Trader_WasteDump", ["InBaseMoves_HandsBehindBack1"], "Exile_Trader_WasteDump", "WhiteHead_12", [[],[],["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",16],[],""],["U_B_CTRG_Soldier_2_F",[["16Rnd_9x21_Mag",16,3]]],["V_Rangemaster_belt",[]],[],"H_Cap_oli","",[],["","","","","",""]], [12209.1, 8161.91, 49.5289], [-0.910106, -0.414376, 0], [0, 0, 1]],
        ["Exile_Trader_Armory", ["InBaseMoves_SittingRifle1","InBaseMoves_SittingRifle2"], "Exile_Trader_Armory", "GreekHead_A3_07", [["arifle_MX_GL_khk_F","muzzle_snds_H_khk_F","","optic_ERCO_khk_F",["30Rnd_65x39_caseless_mag",30],[],""],[],[],["U_B_T_Soldier_AR_F",[["30Rnd_65x39_caseless_mag",30,3]]],["V_Rangemaster_belt",[]],[],"H_HelmetB_Enh_tna_F","G_Shades_Green",[],["","","","","",""]], [12212.4, 8178.57, 50.7307], [0.261202, -0.965284, 0], [0, 0, 1]],
        ["Exile_Trader_Equipment", ["HubSittingHighB_idle1","HubSittingHighB_idle2","HubSittingHighB_idle3"], "Exile_Trader_Equipment", "GreekHead_A3_09", [["arifle_SPAR_03_khk_F","muzzle_snds_B_khk_F","","optic_LRPS_tna_F",["20Rnd_762x51_Mag",20],[],"bipod_01_F_khk"],[],[],["U_B_T_Soldier_SL_F",[["20Rnd_762x51_Mag",20,2]]],["V_PlateCarrier1_tna_F",[["20Rnd_762x51_Mag",20,1]]],[],"H_HelmetB_tna_F","G_Sport_Blackred",[],["","","","","",""]], [12207.7, 8172.72, 50.2165], [0.0895986, 0.992624, 0.0816693], [-0.0073427, -0.0813386, 0.996659]],
        ["Exile_Trader_Food", ["HubSittingChairUC_idle1","HubSittingChairUC_idle2","HubSittingChairUC_idle3","HubSittingChairUC_move1"], "Exile_Trader_Food", "WhiteHead_11", [[],[],[],["U_B_T_Soldier_F",[]],[],[],"","G_Spectacles_Tinted",[],["","","","","",""]], [12213, 8180.09, 51.9029], [-0.525523, 0.850779, 0], [0, 0, 1]],
        ["Exile_Trader_Office", ["HubSittingAtTableU_idle1","HubSittingAtTableU_idle2","HubSittingAtTableU_idle3"], "Exile_Trader_Office", "WhiteHead_07", [[],[],["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",16],[],""],["U_B_T_Soldier_AR_F",[["16Rnd_9x21_Mag",16,3]]],["V_Rangemaster_belt",[]],[],"H_MilCap_tna_F","",[],["","","","","",""]], [12179.6, 8195.8, 51.4501], [0.157762, 0.987477, 0], [0, 0, 1]],
        ["Exile_Guard_02", ["InBaseMoves_patrolling1"], "", "WhiteHead_21", [["arifle_SPAR_01_GL_khk_F","muzzle_snds_m_khk_F","","optic_Hamr_khk_F",["30Rnd_556x45_Stanag",30],[],""],[],[],["U_B_T_Soldier_F",[["30Rnd_556x45_Stanag",30,3]]],["V_PlateCarrier1_tna_F",[]],["B_AssaultPack_tna_F",[]],"H_HelmetB_Enh_tna_F","G_Combat_Goggles_tna_F",[],["","","","","",""]], [12192.7, 8153.75, 49.037], [0.934906, -0.354895, 0], [0, 0, 1]],
        ["Exile_Guard_01", ["InBaseMoves_patrolling2"], "", "WhiteHead_20", [["arifle_MX_khk_F","muzzle_snds_H_khk_F","","optic_ERCO_khk_F",["30Rnd_65x39_caseless_mag",30],[],"bipod_01_F_khk"],[],[],["U_B_T_Soldier_F",[["30Rnd_65x39_caseless_mag",30,3]]],["V_PlateCarrier1_tna_F",[]],["B_AssaultPack_tna_F",[]],"H_HelmetB_Enh_tna_F","G_Tactical_Black",[],["","","","","",""]], [12195.6, 8214.73, 51.2905], [0.761731, -0.647894, 0], [0, 0, 1]],
        ["Exile_Trader_Equipment", ["AmovPsitMstpSrasWrflDnon_WeaponCheck1","AmovPsitMstpSrasWrflDnon_WeaponCheck2","AmovPsitMstpSrasWrflDnon_Smoking"], "Exile_Trader_Equipment", "WhiteHead_07", [["Exile_Weapon_LeeEnfield","","","",["Exile_Magazine_10Rnd_303",10],[],""],[],[],["U_I_C_Soldier_Para_2_F",[["Exile_Magazine_10Rnd_303",10,3]]],["V_BandollierB_rgr",[]],[],"","G_Aviator",[],["","","","","",""]], [11655.5, 4123.17, 164.612], [0.818345, -0.574728, 0], [0, 0, 1]],
        ["Exile_Trader_Office", ["HubSittingChairUB_idle1","HubSittingChairUB_idle2","HubSittingChairUB_idle3","HubSittingChairUB_move1"], "Exile_Trader_Office", "WhiteHead_15", [[],[],[],["U_I_C_Soldier_Camo_F",[]],[],[],"H_Hat_tan","",[],["","","","","",""]], [11666, 4097.06, 165.242], [0.875696, -0.482863, 0], [0, 0, 1]],
        ["Exile_Trader_Armory", ["HubSittingChairC_idle1","HubSittingChairC_idle2","HubSittingChairC_idle3","HubSittingChairC_move1"], "Exile_Trader_Armory", "WhiteHead_19", [["arifle_AK12_GL_F","","","optic_MRCO",["30Rnd_762x39_Mag_F",30],[],""],[],[],["U_I_C_Soldier_Para_1_F",[["30Rnd_762x39_Mag_F",30,1]]],["V_Rangemaster_belt",[["30Rnd_762x39_Mag_F",30,2]]],[],"H_MilCap_gry","G_Shades_Black",[],["","","","","",""]], [11660.8, 4116.49, 164.629], [-0.679335, 0.733828, 0], [0, 0, 1]],
        ["Exile_Trader_Hardware", ["HubSittingHighB_idle1","HubSittingHighB_idle2","HubSittingHighB_idle3"], "Exile_Trader_Hardware", "WhiteHead_06", [["arifle_AKM_F","","","",["30Rnd_762x39_Mag_F",30],[],""],[],[],["U_I_C_Soldier_Para_4_F",[["30Rnd_762x39_Mag_F",30,3]]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"H_Booniehat_khk_hs","",[],["","","","","",""]], [11659.7, 4085.5, 164.747], [0.928693, 0.370849, 0], [0, 0, 1]],
        ["Exile_Trader_Food", ["InBaseMoves_table1"], "Exile_Trader_Food", "WhiteHead_12", [[],[],[],["U_I_C_Soldier_Para_3_F",[]],[],[],"H_Cap_blk","G_Aviator",[],["","","","","",""]], [11666.9, 4078.86, 165.219], [-0.9966, -0.0823912, 0], [0, 0, 1]],
        ["Exile_Trader_Vehicle", ["HubFixingVehicleProne_idle1"], "Exile_Trader_Vehicle", "AfricanHead_02", [[],[],[],["U_I_C_Soldier_Para_5_F",[]],[],[],"H_Bandanna_gry","G_Squares",[],["","","","","",""]], [11646.1, 4117.23, 164.377], [-0.960024, 0.232079, 0.156504], [0.160897, 0, 0.986971]],
        ["Exile_Trader_VehicleCustoms", ["InBaseMoves_assemblingVehicleErc"], "Exile_Trader_VehicleCustoms", "WhiteHead_04", [[],[],[],["U_I_C_Soldier_Bandit_5_F",[]],[],[],"H_StrawHat_dark","",[],["","","","","",""]], [11648.7, 4116.3, 164.199], [-0.99983, -0.018412, 0], [0, 0, 1]],
        ["Exile_Trader_WasteDump", ["HubStandingUA_idle1","HubStandingUA_idle2","HubStandingUA_idle3","HubStandingUA_move1","HubStandingUA_move2"], "Exile_Trader_WasteDump", "GreekHead_A3_08", [[],[],[],["U_I_C_Soldier_Bandit_1_F",[]],[],[],"H_Booniehat_tan","",[],["","","","","",""]], [11652.1, 4094, 165.567], [-0.980591, -0.196066, 0], [0, 0, 1]],
        ["Exile_Guard_01", ["InBaseMoves_patrolling1"], "", "WhiteHead_10", [["arifle_AK12_F","","","",["30Rnd_762x39_Mag_F",30],[],""],[],[],["U_I_C_Soldier_Para_1_F",[["30Rnd_762x39_Mag_F",30,3]]],["V_TacChestrig_grn_F",[]],["B_Kitbag_rgr",[]],"H_Bandanna_cbr","G_Squares_Tinted",[],["","","","","",""]], [11646.5, 4074.6, 166.088], [-0.278379, -0.960471, 0], [0, 0, 1]],
        ["Exile_Guard_02", ["InBaseMoves_patrolling2"], "", "WhiteHead_17", [["arifle_AKM_F","","","",["30Rnd_762x39_Mag_F",30],[],""],[],[],["U_I_C_Soldier_Camo_F",[["30Rnd_762x39_Mag_F",30,2]]],["V_TacChestrig_grn_F",[["30Rnd_762x39_Mag_F",30,1]]],[],"H_HelmetCrew_I","G_Bandanna_sport",[],["","","","","",""]], [11683.7, 4108.18, 162.002], [0.991671, 0.128795, 0], [0, 0, 1]],
        ["Exile_Guard_03", ["InBaseMoves_patrolling2"], "", "WhiteHead_03", [["srifle_GM6_ghex_F","","","optic_LRPS_ghex_F",["5Rnd_127x108_Mag",5],[],""],[],[],["U_O_V_Soldier_Viper_F",[]],[],["B_ViperLightHarness_ghex_F",[]],"H_HelmetO_ViperSP_ghex_F","G_Squares_Tinted",[],["","","","","",""]], [8906.68, 8519.94, 228.91], [-0.567758, 0.823196, 0], [0, 0, 1]],
        ["Exile_Trader_SpecialOperations", ["Acts_InjuredLookingRifle01","Acts_InjuredLookingRifle02","Acts_InjuredLookingRifle03","Acts_InjuredLookingRifle04","Acts_InjuredLookingRifle05"], "Exile_Trader_SpecialOperations", "WhiteHead_08", [["srifle_DMR_07_ghex_F","","","optic_DMS_ghex_F",["20Rnd_650x39_Cased_Mag_F",20],[],""],[],[],["U_O_T_Soldier_F",[["20Rnd_650x39_Cased_Mag_F",20,3]]],["V_HarnessO_ghex_F",[]],["B_FieldPack_ghex_F",[]],"","",[],["","","","","",""]], [8916.56, 8519.21, 229.426], [-0.788744, -0.614722, 0], [0, 0, 1]],
        ["Exile_Trader_Boat", ["HubSittingChairUB_idle1","HubSittingChairUB_idle2","HubSittingChairUB_idle3","HubSittingChairUB_move1"], "Exile_Trader_Boat", "WhiteHead_15", [[],[],[],["U_C_man_sport_2_F",[]],[],[],"H_Cap_red","",[],["","","","","",""]], [8939.25, 4777.67, 0.871102], [-0.884297, -0.466814, 0.0102042], [-0.0379412, 0.0936202, 0.994885]],
        ["Exile_Trader_Diving", ["AdvePercMstpSnonWrflDnon"], "Exile_Trader_Diving", "WhiteHead_11", [["arifle_SDAR_F","","","",[],[],""],[],[],["Exile_Uniform_Wetsuit_AAF",[]],["Exile_Vest_Rebreather_AAF",[]],[],"","Exile_Glasses_Diving_AAF",[],["","","","","",""]], [8923.01, 4786.47, -1.0074], [0.913176, -0.407566, 0], [0, 0, 1]],
        ["Exile_Trader_BoatCustoms", ["Acts_passenger_flatground_leanright"], "Exile_Trader_BoatCustoms", "WhiteHead_21", [[],[],[],["U_C_man_sport_1_F",[]],[],[],"H_Bandanna_surfer","G_Shades_Blue",[],["","","","","",""]], [8937.51, 4778.09, 0.420595], [0.453686, -0.881499, 0.130877], [-0.106065, 0.0924052, 0.990056]],
        ["Exile_Trader_Boat", ["c5efe_MichalLoop"], "Exile_Trader_Boat", "WhiteHead_19", [[],[],[],["U_C_man_sport_1_F",[]],[],[],"H_Bandanna_surfer","",[],["","","","","",""]], [5636.81, 5018.04, -0.0491986], [0.672607, 0.74, 0], [0, 0, 1]],
        ["Exile_Trader_BoatCustoms", ["HubSittingChairB_idle1","HubSittingChairB_idle2","HubSittingChairB_idle3","HubSittingChairB_move1"], "Exile_Trader_BoatCustoms", "WhiteHead_15", [["SMG_05_F","","","",["30Rnd_9x21_Mag_SMG_02",30],[],""],[],[],["U_I_C_Soldier_Bandit_1_F",[["30Rnd_9x21_Mag_SMG_02",30,2]]],[],[],"H_Cap_oli","G_Aviator",[],["","","","","",""]], [5635.67, 5015.97, -0.0169603], [0.60185, 0.798609, 0], [0, 0, 1]],
        ["Exile_Trader_Boat", ["HubSittingChairUB_idle1","HubSittingChairUB_idle2","HubSittingChairUB_idle3","HubSittingChairUB_move1"], "Exile_Trader_Boat", "WhiteHead_18", [[],[],[],["U_C_Man_casual_4_F",[]],[],[],"H_Cap_surfer","G_Shades_Blue",[],["","","","","",""]], [5407.33, 10940.9, 0.493368], [0.67103, 0.741317, 0.0129384], [-0.0192778, 0, 0.999814]],
        ["Exile_Trader_BoatCustoms", ["InBaseMoves_SittingRifle1","InBaseMoves_SittingRifle2"], "Exile_Trader_BoatCustoms", "WhiteHead_14", [["hgun_PDW2000_F","","","",["30Rnd_9x21_Mag",30],[],""],[],[],["U_C_man_sport_2_F",[["30Rnd_9x21_Mag",30,1]]],[],[],"","G_Sport_Blackred",[],["","","","","",""]], [5411.12, 10940.2, 0.937074], [-0.435074, 0.900395, 0], [0, 0, 1]],
        ["Exile_Trader_Boat", ["UnaErcPoslechVelitele1","UnaErcPoslechVelitele2","UnaErcPoslechVelitele3","UnaErcPoslechVelitele4"], "Exile_Trader_Boat", "GreekHead_A3_06", [[],[],[],["U_I_C_Soldier_Bandit_5_F",[]],[],[],"H_Booniehat_khk","",[],["","","","","",""]], [11050.7, 13373.2, 1.35528], [0.835724, -0.549149, 0], [0, 0, 1]],
        ["Exile_Trader_Boat", ["c5efe_MichalLoop"], "Exile_Trader_Boat", "WhiteHead_11", [[],[],[],["U_C_Man_casual_5_F",[]],[],[],"H_Hat_blue","G_Sport_Blackred",[],["","","","","",""]], [12300, 6565.68, 0.64466], [-0.645101, -0.764098, 0], [0, 0, 1]],
        ["Exile_Trader_BoatCustoms", ["InBaseMoves_Lean1"], "Exile_Trader_BoatCustoms", "GreekHead_A3_07", [["hgun_PDW2000_F","","","",["30Rnd_9x21_Mag",30],[],""],[],[],["U_C_Poloshirt_redwhite",[["30Rnd_9x21_Mag",30,1]]],[],[],"","",[],["","","","","",""]], [12298.8, 6567.54, 0.639293], [0.861109, 0.508421, 0], [0, 0, 1]],
        ["Exile_Trader_Boat", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Boat", "WhiteHead_19", [["arifle_AKM_F","","","",["30Rnd_762x39_Mag_F",30],[],""],[],[],["U_C_Man_casual_6_F",[["30Rnd_762x39_Mag_F",30,2]]],[],[],"H_Hat_grey","G_Aviator",[],["","","","","",""]], [5401.26, 7569.42, 1.07069], [0.992494, 0.122289, 0], [0, 0, 1]],
        ["Exile_Trader_BoatCustoms", ["UnconsciousReviveDefault_A","UnconsciousReviveDefault_B","UnconsciousReviveDefault_C"], "Exile_Trader_BoatCustoms", "WhiteHead_04", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"H_Hat_blue","",[],["","","","","",""]], [5403.5, 7571.38, 1.08175], [-0.922454, 0.386107, 0], [0, 0, 1]],
        ["Exile_Trader_Hardware", ["InBaseMoves_Lean1"], "Exile_Trader_Hardware", "WhiteHead_17", [["arifle_MX_Black_F","","","",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",16],[],""],["U_C_WorkerCoveralls",[["16Rnd_9x21_Mag",16,3]]],[],[],"Exile_Headgear_SafetyHelmet","",[],["","","","","",""]], [12182.8, 8187.64, 51.37], [0.625202, -0.780463, 0], [0, 0, 1]],
        ["Exile_Trader_Aircraft", ["LHD_krajPaluby"], "Exile_Trader_Aircraft", "WhiteHead_05", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"H_PilotHelmetHeli_O","",[],["","","","","",""]], [11701.1, 3035.83, 4.69144], [0.789223, 0.614106, 0], [0, 0, 1]],
        ["Exile_Trader_AircraftCustoms", ["HubStandingUA_idle1","HubStandingUA_idle2","HubStandingUA_idle3","HubStandingUA_move1","HubStandingUA_move2"], "Exile_Trader_AircraftCustoms", "WhiteHead_11", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"H_PilotHelmetFighter_B","",[],["","","","","",""]], [11710.5, 3027.81, 4.69147], [0.628238, 0.778021, 0], [0, 0, 1]],
        ["Exile_Trader_Aircraft", ["LHD_krajPaluby"], "Exile_Trader_Aircraft", "WhiteHead_20", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"H_PilotHelmetHeli_O","G_Tactical_Clear",[],["","","","","",""]], [7195.78, 6956.66, 2.65007], [0.942591, 0.333951, 0], [0, 0, 1]],
        ["Exile_Trader_AircraftCustoms", ["HubStandingUA_idle1","HubStandingUA_idle2","HubStandingUA_idle3","HubStandingUA_move1","HubStandingUA_move2"], "Exile_Trader_AircraftCustoms", "WhiteHead_17", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"H_PilotHelmetFighter_B","G_Tactical_Clear",[],["","","","","",""]], [7192.69, 6965.03, 2.6614], [0.947454, 0.319891, 0], [0, 0, 1]],
        ["Exile_Trader_Aircraft", ["LHD_krajPaluby"], "Exile_Trader_Aircraft", "AfricanHead_02", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"H_PilotHelmetHeli_O","",[],["","","","","",""]], [11561.1, 13158.9, 6.95143], [0.477393, 0.87869, 0], [0, 0, 1]],
        ["Exile_Trader_AircraftCustoms", ["HubStandingUA_idle1","HubStandingUA_idle2","HubStandingUA_idle3","HubStandingUA_move1","HubStandingUA_move2"], "Exile_Trader_AircraftCustoms", "AfricanHead_01", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"H_PilotHelmetFighter_B","",[],["","","","","",""]], [11554.3, 13160.2, 6.95143], [0.564486, 0.825443, 0], [0, 0, 1]],
        ["Exile_Guard_01", ["InBaseMoves_patrolling1"], "", "WhiteHead_14", [["arifle_AK12_F","","","",["30Rnd_762x39_Mag_F",30],[],""],[],[],["U_I_C_Soldier_Para_1_F",[["30Rnd_762x39_Mag_F",30,3]]],["V_TacChestrig_grn_F",[]],["B_Kitbag_rgr",[]],"H_Bandanna_cbr","G_Squares_Tinted",[],["","","","","",""]], [2297.99, 8613.18, 1.29399], [-0.260873, 0.965373, 0], [0, 0, 1]],
        ["Exile_Guard_02", ["InBaseMoves_patrolling2"], "", "AfricanHead_03", [["arifle_AKM_F","","","",["30Rnd_762x39_Mag_F",30],[],""],[],[],["U_I_C_Soldier_Camo_F",[["30Rnd_762x39_Mag_F",30,2]]],["V_TacChestrig_grn_F",[["30Rnd_762x39_Mag_F",30,1]]],[],"H_HelmetCrew_I","G_Bandanna_sport",[],["","","","","",""]], [2258.9, 8588.05, 1.34072], [0.612935, -0.788651, 0.0483741], [0, 0.0612227, 0.998124]],
        ["Exile_Guard_01", ["AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisekneeBendA","AmovPercMstpSnonWnonDnon_exercisekneeBendA","AmovPercMstpSnonWnonDnon_exercisekneeBendB"], "", "WhiteHead_18", [[],[],[],["U_B_T_Soldier_AR_F",[]],[],[],"","",[],["","","","","",""]], [12211.5, 8190.11, 51.9022], [-0.63663, -0.771169, 0], [0, 0, 1]],
        ["Exile_Trader_Vehicle", ["Acts_carFixingWheel"], "Exile_Trader_Vehicle", "WhiteHead_12", [[],[],[],["U_B_T_Soldier_AR_F",[]],[],[],"H_Bandanna_gry","G_Squares",[],["","","","","",""]], [12172.9, 8182.72, 51.0935], [-0.982938, 0.183938, 0], [0, 0, 1]],
        ["Exile_Trader_VehicleCustoms", ["HubSittingChairUB_idle1","HubSittingChairUB_idle2","HubSittingChairUB_idle3","HubSittingChairUB_move1"], "Exile_Trader_VehicleCustoms", "AfricanHead_01", [[],[],[],["U_B_T_Soldier_F",[]],[],[],"H_Booniehat_tna_F","",[],["","","","","",""]], [12177.5, 8183.23, 51.1069], [-0.258837, -0.965921, 0], [0, 0, 1]],
        ["Exile_Trader_Office", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_Office", "WhiteHead_14", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","",[],["","","","","",""]], [7976.57, 12422.5, 123.01], [0.538646, 0.842533, 0], [0, 0, 1]],
        ["Exile_Trader_Armory", ["sitTableRfl_listening"], "Exile_Trader_Armory", "WhiteHead_19", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_I_C_Soldier_Bandit_3_F",[]],["V_Rangemaster_belt",[]],[],"H_Cap_headphones","",[],["","","","","",""]], [8016.64, 12411.7, 125.162], [0.972369, -0.232096, 0.0250835], [0, 0.107448, 0.994211]],
        ["Exile_Trader_Equipment", ["InBaseMoves_table1"], "Exile_Trader_Equipment", "Default", [["arifle_RPK74","","","",["45Rnd_Green_Tracer_545x39_RPK",45],[],""],[],[],["U_I_C_Soldier_Bandit_2_F",[]],["V_I_G_resistanceLeader_F",[["45Rnd_Green_Tracer_545x39_RPK",45,3]]],[],"","G_Bandanna_oli",[],["","","","","",""]], [8005.56, 12429.2, 124.027], [-0.897935, 0.440127, 0], [0, 0, 1]],
        ["Exile_Trader_Food", ["InBaseMoves_SittingRifle1","InBaseMoves_SittingRifle2"], "Exile_Trader_Food", "WhiteHead_15", [["srifle_CZ550_base","","","",["5x_22_LR_17_HMR_M",5],[],""],[],[],["U_I_C_Soldier_Bandit_5_F",[["5x_22_LR_17_HMR_M",5,3]]],[],[],"H_Cap_tan","",[],["","","","","",""]], [7994.21, 12439.8, 123.897], [-0.085695, -0.996321, 0], [0, 0, 1]],
        ["Exile_Trader_Hardware", ["HubSittingChairUC_idle1","HubSittingChairUC_idle2","HubSittingChairUC_idle3","HubSittingChairUC_move1"], "Exile_Trader_Hardware", "AfricanHead_02", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],[],"","G_Aviator",[],["","","","","",""]], [7988.36, 12440.8, 123.877], [0.48661, -0.873619, 0], [0, 0, 1]],
        ["Exile_Trader_WasteDump", ["Acts_CivilListening_2"], "Exile_Trader_WasteDump", "AfricanHead_01", [[],[],[],["U_I_C_Soldier_Para_4_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","G_Aviator",[],["","","","","",""]], [8007.16, 12388.3, 125.844], [0.137963, 0.990437, 0], [0, 0, 1]],
        ["Exile_Trader_Vehicle", ["HubFixingVehicleProne_idle1"], "Exile_Trader_Vehicle", "AfricanHead_02", [[],[],[],["U_I_C_Soldier_Bandit_1_F",[]],[],[],"H_Cap_red","",[],["","","","","",""]], [8010.04, 12423.3, 124.233], [-0.996794, 0.0676586, -0.0427131], [-0.0458379, -0.0453257, 0.99792]],
        ["Exile_Trader_VehicleCustoms", ["Acts_carFixingWheel"], "Exile_Trader_VehicleCustoms", "AfricanHead_03", [[],[],[],["U_I_C_Soldier_Bandit_4_F",[]],[],[],"","G_Aviator",[],["","","","","",""]], [8011.74, 12420.7, 124.424], [-0.752088, 0.659063, 0], [0, 0, 1]],
        ["Exile_Trader_Diving", ["c5efe_MichalLoop"], "Exile_Trader_Diving", "WhiteHead_21", [[],[],[],["Exile_Uniform_Wetsuit_NATO",[]],["Exile_Vest_Rebreather_NATO",[]],[],"","Exile_Glasses_Diving_NATO",[],["","","","","",""]], [5639.26, 5019.8, 1.13171], [0.127639, 0.991821, 0], [0, 0, 1]],
        ["Exile_Trader_Diving", ["AmovPsitMstpSrasWrflDnon_WeaponCheck1","AmovPsitMstpSrasWrflDnon_WeaponCheck2"], "Exile_Trader_Diving", "WhiteHead_15", [["arifle_SDAR_F","","","",["20Rnd_556x45_UW_mag",20],[],""],[],[],["Exile_Uniform_Wetsuit_CSAT",[["20Rnd_556x45_UW_mag",20,3]]],["V_RebreatherIR",[]],[],"","Exile_Glasses_Diving_CSAT",[],["","","","","",""]], [5409.85, 7559.8, 0.0954094], [0.296426, 0.955056, 0], [0, 0, 1]],
        ["Exile_Trader_Diving", ["HubSittingHighB_move1"], "Exile_Trader_Diving", "WhiteHead_20", [["arifle_SDAR_F","","","",["20Rnd_556x45_UW_mag",20],[],""],[],[],["Exile_Uniform_Wetsuit_AAF",[["20Rnd_556x45_UW_mag",20,3]]],["V_RebreatherIR",[]],[],"","Exile_Glasses_Diving_CSAT",[],["","","","","",""]], [12297.3, 6569.02, -0.218481], [-0.771331, 0.636435, 0], [0, 0, 1]],
        ["Exile_Trader_Diving", ["HubSittingHighB_move1"], "Exile_Trader_Diving", "WhiteHead_06", [["arifle_SDAR_F","","","",["20Rnd_556x45_UW_mag",20],[],""],[],[],["Exile_Uniform_Wetsuit_NATO",[["20Rnd_556x45_UW_mag",20,3]]],["Exile_Vest_Rebreather_NATO",[]],[],"","Exile_Glasses_Diving_NATO",[],["","","","","",""]], [5402.99, 10942.3, -0.0793096], [-0.982904, 0.184118, 0], [0, 0, 1]],
        ["Exile_Trader_Diving", ["AdvePercMstpSnonWrflDnon"], "Exile_Trader_Diving", "WhiteHead_20", [["arifle_SDAR_F","","","",["20Rnd_556x45_UW_mag",20],[],""],[],[],["Exile_Uniform_Wetsuit_NATO",[["20Rnd_556x45_UW_mag",20,3]]],["Exile_Vest_Rebreather_NATO",[]],[],"","Exile_Glasses_Diving_NATO",[],["","","","","",""]], [2267.78, 8616.37, -1.15847], [-0.857565, -0.514375, 0], [0, 0, 1]],
        ["Exile_Trader_Diving", ["AdvePercMstpSnonWrflDnon"], "Exile_Trader_Diving", "WhiteHead_09", [["arifle_SDAR_F","","","",["20Rnd_556x45_UW_mag",20],[],""],[],[],["Exile_Uniform_Wetsuit_NATO",[["20Rnd_556x45_UW_mag",20,3]]],["Exile_Vest_Rebreather_NATO",[]],[],"","Exile_Glasses_Diving_NATO",[],["","","","","",""]], [11061.8, 13373, -1.12118], [-0.890015, -0.455931, 0], [0, 0, 1]],
        ["Exile_Guard_01", ["Acts_TreatingWounded01","Acts_TreatingWounded02","Acts_TreatingWounded03","Acts_TreatingWounded04","Acts_TreatingWounded05","Acts_TreatingWounded06"], "", "WhiteHead_16", [[],[],[],["U_I_C_Soldier_Para_1_F",[]],[],[],"H_Cap_tan","",[],["","","","","",""]], [7980.3, 12419.1, 122.93], [-0.195554, -0.980272, 0.0287372], [0, 0.029303, 0.999571]],
        ["Exile_Guard_02", ["Acts_LyingWounded_loop1","Acts_LyingWounded_loop2","Acts_LyingWounded_loop3"], "", "WhiteHead_16", [[],[],[],["U_I_C_Soldier_Bandit_3_F",[]],[],[],"","",[],["","","","","",""]], [7979.94, 12418.6, 122.979], [-0.965939, 0.258769, 0], [0, 0, 1]],
        ["Exile_Guard_02", ["InBaseMoves_SittingRifle1","InBaseMoves_SittingRifle2"], "", "GreekHead_A3_09", [["arifle_AKM_F","","","",["30Rnd_762x39_Mag_F",30],[],""],[],[],["U_I_C_Soldier_Para_5_F",[["30Rnd_762x39_Mag_F",30,3]]],[],[],"H_StrawHat_dark","",[],["","","","","",""]], [7994.25, 12416.7, 123.691], [0.368708, 0.929545, 0], [0, 0, 1]],
        ["Exile_Trader_BoatCustoms", ["HubSittingChairB_idle1","HubSittingChairB_idle2","HubSittingChairB_idle3","HubSittingChairB_move1"], "Exile_Trader_BoatCustoms", "WhiteHead_06", [["arifle_CTAR_blk_F","","","",["30Rnd_580x42_Mag_F",30],[],""],[],[],["U_C_Poloshirt_salmon",[["30Rnd_580x42_Mag_F",30,1]]],[],[],"","",[],["","","","","",""]], [11058.1, 13384.3, 0.884787], [-0.881628, 0.471944, 0], [0, 0, 1]]
        ];

        {
            private _logic = "Logic" createVehicleLocal [0, 0, 0];
            private _trader = (_x select 0) createVehicleLocal [0, 0, 0];
            private _animations = _x select 1;
        
            _logic setPosWorld (_x select 5);
            _logic setVectorDirAndUp [_x select 6, _x select 7];
        
            _trader setVariable ["BIS_enableRandomization", false];
            _trader setVariable ["BIS_fnc_animalBehaviour_disable", true];
            _trader setVariable ["ExileAnimations", _animations];
            _trader setVariable ["ExileTraderType", _x select 2];
            _trader disableAI "ANIM";
            _trader disableAI "MOVE";
            _trader disableAI "FSM";
            _trader disableAI "AUTOTARGET";
            _trader disableAI "TARGET";
            _trader disableAI "CHECKVISIBLE";
            _trader allowDamage false;
            _trader setFace (_x select 3);
            _trader setUnitLoadOut (_x select 4);
            _trader setPosWorld (_x select 5);
            _trader setVectorDirAndUp [_x select 6, _x select 7];
            _trader reveal _logic;
            _trader attachTo [_logic, [0, 0, 0]];
            _trader switchMove (_animations select 0);
            _trader addEventHandler ["AnimDone", {_this call ExileClient_object_trader_event_onAnimationDone}];
        }
        forEach _npcs;
    }; 
    case "namalsk":
    {

        ///////////////////////////////////////////////////////////////////////////
        // Hardware Trader
        ///////////////////////////////////////////////////////////////////////////
        _workBench = "Land_Workbench_01_F" createVehicleLocal [0,0,0];
        _workBench setDir 343;
        _workBench setPosATL [4975.24,8055.24,0.1301];

        _trader = 
        [
            "Exile_Trader_Hardware",
            "Exile_Trader_Hardware",
            "WhiteHead_17",
            ["InBaseMoves_sitHighUp1"],
            [0, 0, -0.5],
            170,
            _workBench
        ]
        call ExileClient_object_trader_create;

        ///////////////////////////////////////////////////////////////////////////
        // Fast Food Trader
        ///////////////////////////////////////////////////////////////////////////
        _cashDesk = "Land_CashDesk_F" createVehicleLocal [0,0,0];
        _cashDesk setDir 96.2614;
        _cashDesk setPosATL [4970.25,8049.81,4.67093];

        _microwave = "Land_Microwave_01_F" createVehicleLocal [0,0,0];
        _cashDesk disableCollisionWith _microwave;         
        _microwave disableCollisionWith _cashDesk; 
        _microwave attachTo [_cashDesk, [-0.6, 0.2, 1.1]];

        _ketchup = "Land_Ketchup_01_F" createVehicleLocal [0,0,0];
        _cashDesk disableCollisionWith _ketchup;         
        _ketchup disableCollisionWith _cashDesk; 
        _ketchup attachTo [_cashDesk, [-0.6, 0, 1.1]];

        _mustard = "Land_Mustard_01_F" createVehicleLocal [0,0,0];
        _cashDesk disableCollisionWith _mustard;         
        _mustard disableCollisionWith _cashDesk; 
        _mustard attachTo [_cashDesk, [-0.5, -0.05, 1.1]];

        _trader = 
        [
            "Exile_Trader_Food",
            "Exile_Trader_Food",
            "GreekHead_A3_01",
            ["InBaseMoves_table1"],
            [0.1, 0.5, 0.2],
            170,
            _cashDesk
        ]
        call ExileClient_object_trader_create;

        ///////////////////////////////////////////////////////////////////////////
        // Armory Trader
        ///////////////////////////////////////////////////////////////////////////
        _chair = "Land_CampingChair_V2_F" createVehicleLocal [0,0,0];
        _chair setDir 73.6836;
        _chair setPosATL [4971.41,8045.28,4.69395];

        _trader = 
        [
            "Exile_Trader_Armory",
            "Exile_Trader_Armory",
            "PersianHead_A3_02",
            ["InBaseMoves_SittingRifle1"],
            [0, -0.15, -0.45],
            180,
            _chair
        ]  call ExileClient_object_trader_create;

        ///////////////////////////////////////////////////////////////////////////
        // Equipment Trader
        ///////////////////////////////////////////////////////////////////////////
        _trader = 
        [
            "Exile_Trader_Equipment",
            "Exile_Trader_Equipment",
            "WhiteHead_19",
            ["InBaseMoves_Lean1"],
            [4965.38,8041.59,0.629353],
            60
        ]
        call ExileClient_object_trader_create;

        ///////////////////////////////////////////////////////////////////////////
        // Specops Trader
        ///////////////////////////////////////////////////////////////////////////
        _trader = 
        [
            "Exile_Trader_SpecialOperations",
            "Exile_Trader_SpecialOperations",
            "AfricanHead_02",
            ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
            [4967.27,8039.79,4.7932],
            354.031
        ]
        call ExileClient_object_trader_create;

        ///////////////////////////////////////////////////////////////////////////
        // Office Trader
        ///////////////////////////////////////////////////////////////////////////
        _trader = 
        [
            "Exile_Trader_Office",
            "Exile_Trader_Office",
            "GreekHead_A3_04",
            ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
            [5011.55,8011.94,4.1263],
            93.5793
        ]
        call ExileClient_object_trader_create;

        ///////////////////////////////////////////////////////////////////////////
        // Waste Dump Trader
        ///////////////////////////////////////////////////////////////////////////
        _trader = 
        [
            "Exile_Trader_WasteDump",
            "Exile_Trader_WasteDump",
            "GreekHead_A3_01",
            ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
            [5003.98,8063.51,0.00143814],
            268.706
        ]
        call ExileClient_object_trader_create;

        ///////////////////////////////////////////////////////////////////////////
        // Aircraft Trader
        ///////////////////////////////////////////////////////////////////////////
        _trader = 
        [
            "Exile_Trader_Aircraft",
            "Exile_Trader_Aircraft",
            "WhiteHead_17",
            ["LHD_krajPaluby"],
            [4991.53,8007.63,0.00143814],
            183.307
        ]
        call ExileClient_object_trader_create;

        ///////////////////////////////////////////////////////////////////////////
        // Aircraft Customs Trader
        ///////////////////////////////////////////////////////////////////////////
        _trader = 
        [
            "Exile_Trader_AircraftCustoms",
            "Exile_Trader_AircraftCustoms",
            "GreekHead_A3_07",
            ["HubStandingUC_idle1", "HubStandingUC_idle2", "HubStandingUC_idle3", "HubStandingUC_move1", "HubStandingUC_move2"],
            [4988.44,8007.02,0.00143814],
            181.523
        ]
        call ExileClient_object_trader_create;

        ///////////////////////////////////////////////////////////////////////////
        // Vehicle Trader
        ///////////////////////////////////////////////////////////////////////////

        _trader =
        [
            "Exile_Trader_Vehicle",
            "Exile_Trader_Vehicle",
            "WhiteHead_11",
            ["InBaseMoves_repairVehicleKnl", "InBaseMoves_repairVehiclePne"],
            [4991.31,8031.08,0.00144196],
            172.814
        ]
        call ExileClient_object_trader_create;

        _carWreck = "Land_Wreck_CarDismantled_F" createVehicleLocal [0,0,0];
        _carWreck setDir 84.3864;    
        _carWreck setPosATL [4991.31,8029.61,0.00143814];

        ///////////////////////////////////////////////////////////////////////////
        // Vehicle Customs Trader
        ///////////////////////////////////////////////////////////////////////////
        _trader = 
        [
            "Exile_Trader_VehicleCustoms",
            "Exile_Trader_VehicleCustoms",
            "WhiteHead_11",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [4981.44,8029.47,0.00143814],
            46.622
        ]
        call ExileClient_object_trader_create;

        ///////////////////////////////////////////////////////////////////////////
        // Guard 01
        ///////////////////////////////////////////////////////////////////////////
        _trader = 
        [
            "Exile_Guard_01",
            "",
            "WhiteHead_17",
            ["InBaseMoves_patrolling1"],
            [5008.11,8016.52,10.2064],
            343
        ]
        call ExileClient_object_trader_create;

        ///////////////////////////////////////////////////////////////////////////
        // Guard 02
        ///////////////////////////////////////////////////////////////////////////
        _trader = 
        [
            "Exile_Guard_02",
            "",
            "WhiteHead_03",
            ["InBaseMoves_patrolling2"],
            [5014.7,8020.76,12.9847],
            326
        ]
        call ExileClient_object_trader_create;

        ///////////////////////////////////////////////////////////////////////////
        // Guard 03
        ///////////////////////////////////////////////////////////////////////////
        _trader = 
        [
            "Exile_Guard_03",
            "",
            "AfricanHead_03",
            ["InBaseMoves_patrolling1"],
            [5017.31,8022.67,0.00143814],
            294.28
        ]
        call ExileClient_object_trader_create;

        ///////////////////////////////////////////////////////////////////////////
        // Northern Boat Trader
        ///////////////////////////////////////////////////////////////////////////

        _trader = 
        [
            "Exile_Trader_Boat",
            "Exile_Trader_Boat",
            "WhiteHead_17",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [9120.65,10076.6,6.80059],
            20
        ]
        call ExileClient_object_trader_create;

        ///////////////////////////////////////////////////////////////////////////
        // Southern Boat Trader
        ///////////////////////////////////////////////////////////////////////////

        _trader = 
        [
            "Exile_Trader_Boat",
            "Exile_Trader_Boat",
            "WhiteHead_17",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [4357.36,4724.03,3.95238],
            0
        ]
        call ExileClient_object_trader_create;
    };
};

[] execVM "Client_scriptsAndFunctions\initClient.sqf";
_bul = [] execVM "addons\blowout\module\blowout_client.sqf";