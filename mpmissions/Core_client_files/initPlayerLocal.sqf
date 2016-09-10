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
            ["Exile_Trader_Office", ["HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think","HubBriefing_lookAround1","HubBriefing_lookAround2"], "Exile_Trader_Office", "GreekHead_A3_09", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","G_Shades_Green",[],["","","","","",""]], [7580.13, 4538.82, 117.071], [0.171723, -0.985145, 0], [0, 0, 1]],
            ["Exile_Trader_Boat", [], "Exile_Trader_Boat", "AfricanHead_03", [[],[],[],["U_OrestesBody",[]],[],[],"H_Cap_surfer","G_Tactical_Clear",[],["","","","","",""]], [5736.68, 5447.53, 1.24214], [-0.680515, -0.732734, 0], [0, 0, 1]],
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
        //Todo
    };
};

/**/

[] execVM "Client_scriptsAndFunctions\initClient.sqf";
_bul = [] execVM "addons\blowout\module\blowout_client.sqf";