/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

if (!hasInterface || isServer) exitWith {};

setTerrainGrid 3.125;
setViewDistance 1500;

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

/**/

[] execVM "Client_scriptsAndFunctions\initClient.sqf";