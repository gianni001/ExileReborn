/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

ExileRouletteChairs = [];
ExileRouletteChairPositions = [];

// 1 Vehicles
private _vehicles = [
["MapBoard_altis_F", [20828.2, 7206.61, 30.0077], [0.282804, -0.958988, 0.0190597], [-0.0492724, 0.00532003, 0.998771], false],
["Exile_ConcreteMixer", [6238.31, 16255.2, 43], [0.646966, 0.762519, 0], [0, 0, 1], true],
["Exile_ConcreteMixer", [5876.87, 20104.1, 226.468], [-0.906617, -0.420461, -0.0354807], [-0.0532564, 0.0306079, 0.998112], true],
["Exile_Locker", [9239.97, 11481.5, 109.928], [0.160004, -0.986754, 0.0267378], [-0.00265204, 0.026657, 0.999641], true]
];

{
    private _vehicle = (_x select 0) createVehicle (_x select 1);
    _vehicle allowDamage false;
    _vehicle setPosWorld (_x select 1);
    _vehicle setVectorDirAndUp [_x select 2, _x select 3];
    _vehicle enableSimulationGlobal (_x select 4);
    _vehicle setVariable ["ExileIsLocked", -1, true];
    
    if (_vehicle isKindOf "Exile_RussianRouletteChair") then
    {
        ExileRouletteChairs pushBack _vehicle;
        ExileRouletteChairPositions pushBack [_x select 1, getDir _vehicle];
    };
}
forEach _vehicles;

_objectNew =
[
    ["Land_PierLadder_F",[15778.5,17457.7,16.5839],[[0.917394,-0.397981,0],[0,0,1]],false,false],
    ["MetalBarrel_burning_F",[15777.9,17452.5,19.3027],[[0,1,0],[0.000690534,0,1]],false,true],
    ["Land_HistoricalPlaneWreck_02_front_F",[15787.7,17448.7,14.2905],[[0.426341,-0.904557,-0.00330394],[-0.00350407,-0.00530404,0.99998]],false,false]
];

{
    private ["_objectNew"];

    _object = (_x select 0) createVehicle [0,0,0];
    _object setPosASL (_x select 1);
    _object setVectorDirAndUp (_x select 2);
    _object allowDamage (_x select 3);
    _object enableSimulationGlobal (_x select 4);
}
forEach _objectNew;

// 13 Simple Objects
private _invisibleSelections = ["zasleh", "zasleh2", "box_nato_grenades_sign_f", "box_nato_ammoord_sign_f", "box_nato_support_sign_f"];
private _simpleObjects = [
["a3\structures_f\items\electronics\survivalradio_f.p3d", [9242.66, 11478.3, 110.59], [0.699208, -0.714886, 0.00679661], [0.0198178, 0.0288846, 0.999386]],
["a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d", [9242.78, 11478.5, 110.608], [0, 0.999583, -0.0288903], [0.0198178, 0.0288846, 0.999386]],
["a3\structures_f\civ\camping\sunshade_f.p3d", [3137.89, 13087.8, 72.1171], [0, 0.997785, -0.0665182], [-0.109995, 0.0661146, 0.991731]],
["a3\props_f_exp\military\camps\satelliteantenna_01_f.p3d", [6230.58, 16253.6, 46.5416], [-0.761929, 0.64766, 0.000525949], [0.000690285, 0, 1]],
["a3\structures_f_heli\items\electronics\fridge_01_f.p3d", [6231.02, 16255.6, 43.5185], [0.0147415, -0.999891, 0], [0, 0, 1]],
["a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d", [6230.89, 16255.4, 44.1638], [0, 1, 0], [0, 0, 1]],
["a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d", [6230.95, 16255.6, 44.1638], [0, 1, 0], [0, 0, 1]],
["a3\structures_f_epa\items\food\bakedbeans_f.p3d", [6230.9, 16255.6, 43.5426], [0, 1, 0], [0, 0, 1]],
["exile_assets\model\exile_item_raisins.p3d", [6231.16, 16255.6, 44.028], [-0.267644, -0.963518, 0], [0, 0, 1]],
["exile_assets\model\exile_item_magazine02.p3d", [6232.93, 16256.6, 42.9993], [0.808607, -0.588349, 0], [0, 0, 1]],
["a3\structures_f\civ\camping\campingchair_v2_f.p3d", [13362.9, 14512.4, 2.26771], [-0.388152, 0.899576, 0.200253], [0.0876605, -0.180266, 0.979704]],
["a3\structures_f_heli\civ\garbage\wheeliebin_01_f.p3d", [5881.75, 20110.1, 226.749], [0.708861, -0.695653, 0.116547], [-0.0306514, 0.134697, 0.990413]],
["a3\props_f_exp\industrial\heavyequipment\combineharvester_01_wreck_f.p3d", [5889.66, 20113.5, 228.064], [-0.196683, 0.965957, -0.168059], [-0.061219, 0.158974, 0.985383]],
["a3\weapons_f\longrangerifles\ebr\ebr_f.p3d", [20676.9, 15629.2, 17.8918], [0.675858, 0.646648, 0.353641], [0.664069, -0.742424, 0.0884228]],
// Terminal
["a3\structures_f\wrecks\uwreck_mv22_f.p3d", [14346.9, 15906, 22.0832], [-0.988094, -0.15385, 0], [0, 0, 1]],
["a3\props_f_exp\military\oldplanewrecks\historicalplanedebris_04_f.p3d", [14368.2, 15908.9, 17.9942], [0, 1, 0], [0, 0, 1]],
["a3\props_f_exp\military\oldplanewrecks\historicalplanedebris_03_f.p3d", [14371.5, 15925.7, 18.1652], [-0.971447, 0.237255, 0], [0, 0, 1]],
["a3\props_f_exp\military\oldplanewrecks\historicalplanedebris_02_f.p3d", [14336.5, 15891.1, 18.1427], [0, 1, 0], [0, 0, 1]],
["a3\props_f_exp\military\oldplanewrecks\historicalplanewreck_02_wing_right_f.p3d", [14404.8, 15913.9, 19.0506], [0.0550127, -0.998485, -0.00126162], [-0.00133721, -0.00133721, 0.999998]],
["a3\props_f_exp\military\oldplanewrecks\historicalplanewreck_02_front_f.p3d", [14405, 15930.2, 19.3076], [-0.980089, -0.198555, -0.00126615], [-0.00129187, 0, 0.999999]],
["a3\props_f_exp\military\oldplanewrecks\historicalplanewreck_03_f.p3d", [14486.3, 15998.3, 20.5054], [-0.164934, -0.986305, 0.000213074], [0.00129187, 0, 0.999999]],
["a3\structures_f\wrecks\wreck_plane_transport_01_f.p3d", [14492.7, 16049.3, 17.8561], [-0.691723, -0.722157, -0.00280017], [-0.00265204, -0.00133721, 0.999996]],
["a3\props_f_exp\military\oldplanewrecks\historicalplanewreck_01_f.p3d", [14497, 16198.9, 19.2685], [0.990543, 0.137199, 0.000363859], [0, -0.00265204, 0.999996]],
//Termina roof / parking lot
["a3\structures_f\wrecks\wreck_heli_attack_02_f.p3d", [14596.6, 16778.3, 30.3368], [0, 0.955843, -0.293877], [0.293585, 0.280926, 0.913722]],
["a3\structures_f\wrecks\wreck_slammer_hull_f.p3d", [14610.4, 16840.1, 18.6279], [0.211366, -0.977407, 0], [0, 0, 1]],
["a3\structures_f\wrecks\wreck_slammer_f.p3d", [14524.3, 16792.3, 19.3295], [0.974344, -0.224761, 0.011693], [-0.012, 0, 0.999928]],
// Boat trader
["a3\props_f_exp\naval\boats\boat_06_wreck_f.p3d", [13416.1, 14524.4, 1.98085], [0, 1, 0], [0, 0, 1]],
["a3\props_f_exp\naval\boats\boat_05_wreck_f.p3d", [13396.1, 14524.5, 1.33762], [0.986879, -0.108266, -0.119782], [0.0968758, -0.196444, 0.975717]],
// PMC
["a3\structures_f\wrecks\wreck_t72_hull_f.p3d", [17473.2, 13163.6, 14.3539], [0.00843607, -0.999951, 0.00527006], [0.00666818, 0.00532638, 0.999964]],
["a3\structures_f\wrecks\wreck_ural_f.p3d", [17474.4, 13176.1, 14.7399], [0.959561, -0.281352, -0.00919887], [0.0146643, 0.0173263, 0.999742]],
["a3\structures_f\wrecks\wreck_hmmwv_f.p3d", [17495.2, 13185.6, 14.219], [-0.908711, -0.417379, 0.00630374], [0.00265204, 0.00932847, 0.999953]],
//Hardware
["a3\props_f_exp\industrial\heavyequipment\excavator_01_wreck_f.p3d", [6232.63, 16272, 46.1278], [0.765755, -0.643132, 0], [0, 0, 1]],
//servo telos
["a3\structures_f\wrecks\wreck_bmp2_f.p3d", [15800.2, 17425.7, 15.0996], [0.182675, -0.983162, -0.00474676], [-0.00625302, -0.0059897, 0.999963]],
["a3\structures_f\wrecks\wreck_brdm2_f.p3d", [15820.8, 17421.2, 14.898], [-0.894101, -0.447716, -0.0115518], [-0.00574636, -0.0143228, 0.999881]],
["a3\structures_f\wrecks\wreck_hmmwv_f.p3d", [15817.6, 17408.9, 15.036], [-0.11341, -0.993532, -0.00571027], [-0.00458047, -0.00522445, 0.999976]],
["a3\structures_f\wrecks\wreck_van_f.p3d", [15777.2, 17441.7, 15.2279], [-0.981974, 0.189002, -0.00216627], [-0.0031074, -0.00468328, 0.999984]],
["a3\structures_f\wrecks\wreck_offroad_f.p3d", [15772.6, 17446.4, 15.1628], [-0.807926, 0.589284, 0.0006283], [-0.0031074, -0.00532652, 0.999981]],
["a3\structures_f\wrecks\wreck_uaz_f.p3d", [15764.3, 17446, 15.0613], [-0.967067, 0.254517, 0.00135572], [0, -0.00532655, 0.999986]],
["a3\structures_f\wrecks\wreck_truck_dropside_f.p3d", [15780.3, 17436.8, 15.3801], [0.468468, -0.883478, -0.00214968], [-0.00461935, -0.00488257, 0.999977]],
["a3\structures_f\wrecks\wreck_car_f.p3d", [15756.6, 17452.2, 14.9762], [-0.822591, 0.568621, 0.00378669], [0, -0.00665928, 0.999978]],
["a3\structures_f\mil\bagfence\bagfence_corner_f.p3d", [15782.8, 17448.5, 19.7133], [0.896761, -0.442514, -0.000619021], [0.000690285, 0, 1]],
["a3\structures_f\mil\bagfence\bagfence_corner_f.p3d", [15776.6, 17451.4, 19.7237], [-0.452231, -0.891901, 0.000312169], [0.000690285, 0, 1]],
["a3\structures_f\mil\bagfence\bagfence_long_f.p3d", [15778.4, 17450.3, 19.7205], [0.437503, 0.899217, -0.000302002], [0.000690285, 0, 1]],
["a3\structures_f\mil\bagfence\bagfence_long_f.p3d", [15781, 17449, 19.7182], [0.442036, 0.896997, -0.000305131], [0.000690285, 0, 1]],
["a3\structures_f\mil\bagfence\bagfence_long_f.p3d", [15783.9, 17450.3, 19.7144], [-0.905752, 0.423807, 0.000625228], [0.000690285, 0, 1]],
["a3\structures_f\mil\bagfence\bagfence_long_f.p3d", [15777.1, 17453.2, 19.7131], [0.901498, -0.432782, -0.000622291], [0.000690285, 0, 1]],
["a3\structures_f\civ\constructions\pallets_f.p3d", [15784.5, 17454.5, 19.6121], [0, 1, 0], [0.000690285, 0, 1]],
["a3\structures_f_exp\civilian\accessories\plank_01_8m_f.p3d", [15787.8, 17457.3, 20.597], [0.528491, 0.77465, 0.347297], [-0.207692, -0.278683, 0.937657]],
["a3\structures_f\mil\bagfence\bagfence_long_f.p3d", [15796.4, 17466.1, 22.8643], [-0.551925, -0.833871, -0.00614829], [-0.211514, 0.132858, 0.968303]],
["a3\structures_f\mil\bagfence\bagfence_short_f.p3d", [15794.5, 17467.4, 22.3101], [-0.548142, -0.836371, -0.00497881], [-0.211514, 0.132858, 0.968303]],
["a3\structures_f\mil\bagfence\bagfence_long_f.p3d", [15799.2, 17464.4, 23.0217], [-0.534231, -0.845336, 0.00222462], [0.201271, -0.124642, 0.971573]],
["a3\structures_f\mil\bagfence\bagfence_short_f.p3d", [15801.1, 17463.3, 22.4916], [-0.538291, -0.842752, 0.00339725], [0.201271, -0.124642, 0.971573]],
["a3\structures_f\mil\bagfence\bagfence_short_f.p3d", [15801.9, 17462.8, 22.2766], [0.567953, 0.822972, -0.0120795], [0.201271, -0.124642, 0.971573]],
["a3\structures_f\mil\bagfence\bagfence_long_f.p3d", [15801.6, 17461, 22.0947], [-0.822153, 0.517708, 0.236733], [0.201271, -0.124642, 0.971573]],
["a3\structures_f\mil\bagfence\bagfence_long_f.p3d", [15800.1, 17458.6, 22.1008], [-0.809533, 0.537274, 0.236629], [0.201271, -0.124642, 0.971573]],
["a3\structures_f\mil\bagfence\bagfence_long_f.p3d", [15798.7, 17456.6, 22.1126], [-0.801615, 0.549072, 0.236502], [0.201271, -0.124642, 0.971573]],
["a3\structures_f\mil\bagfence\bagfence_long_f.p3d", [15796.6, 17456.3, 22.5036], [0.539715, 0.841839, -0.00380943], [0.201271, -0.124642, 0.971573]],
["a3\structures_f\mil\bagfence\bagfence_short_f.p3d", [15794.7, 17457.5, 23.0453], [0.540471, 0.841353, -0.00402837], [0.201271, -0.124642, 0.971573]],
["a3\structures_f\mil\bagfence\bagfence_long_f.p3d", [15792, 17459.4, 22.918], [0.549982, 0.835158, 0.00554722], [-0.211514, 0.132858, 0.968303]],
["a3\structures_f\mil\bagfence\bagfence_long_f.p3d", [15793.1, 17466.4, 22.1032], [0.81889, -0.516749, 0.249778], [-0.211514, 0.132858, 0.968303]],
["a3\structures_f\mil\bagfence\bagfence_long_f.p3d", [15791.5, 17463.9, 22.1248], [-0.803947, 0.539753, -0.249671], [-0.211514, 0.132858, 0.968303]]
];

{
    private _simpleObject = createSimpleObject [_x select 0, _x select 1];
    _simpleObject setVectorDirAndUp [_x select 2, _x select 3];
    
    {
        if ((toLower _x) in _invisibleSelections) then 
        {
            _simpleObject hideSelection [_x, true];
        };
    }
    forEach (selectionNames _simpleObject);
}
forEach _simpleObjects;

setTerrainGrid 3.125;
setViewDistance 1500;