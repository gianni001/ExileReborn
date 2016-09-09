/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

ExileRouletteChairs = [];
ExileRouletteChairPositions = [];

switch (toLower worldName) do
{
    case "altis":
    {

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
    }; 
    case "esseker":
    {
        // 2 Vehicles
        private _vehicles = [
        ["Exile_Locker", [8079.33, 6425.85, 116.207], [0.990296, 0.138968, 0.00138659], [-0.00129187, -0.000771824, 0.999999], true], //Equipment
        ["Exile_Locker", [2729.93, 11279.2, 134.855], [0.40943, -0.910571, 0.056808], [-0.0591438, 0.0356448, 0.997613], true], //Armory
        ["Exile_Locker", [11167.6, 9103.77, 65.2057], [0, 1, 0], [0, 0, 1], true], //Waste Dump
        ["Exile_Locker", [6639.36, 3712.12, 238.694], [0, 1, 0], [0.00182698, 0, 0.999998], true], //Spec Ops
        ["Exile_Locker", [3978.02, 9290.03, 150.585], [0.61273, 0.790292, -0.000518203], [0.000845728, 0, 1], true], //Hardware
        ["Exile_Locker", [3109.28, 4492.94, 113.815], [0.12027, 0.992741, -0.000740717], [0.00212837, 0.00048828, 0.999998], true], //Vehicles
        ["Exile_Locker", [10046.7, 4844.48, 17.0556], [0.999429, -0.0337743, -0.00119505], [0.00119573, 0, 0.999999], true], //Aircraft
        ["Exile_ConcreteMixer", [7371.42, 5318.19, 42.5831], [0, 0.99998, -0.0063944], [0.012415, 0.00639391, 0.999902], true],
        ["Exile_ConcreteMixer", [9000.82, 7925.87, 168.994], [0, 1, 0], [0.00195312, 0, 0.999998], true],
        ["Exile_ConcreteMixer", [3106.34, 5991.98, 122.227], [0, 1, -0.000488281], [-0.00234171, 0.00048828, 0.999997], true]
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
 
        // 50 Simple Objects
        private _invisibleSelections = ["zasleh", "zasleh2", "box_nato_grenades_sign_f", "box_nato_ammoord_sign_f", "box_nato_support_sign_f"];
        private _simpleObjects = [
        //Equipment Trader
        ["ca\buildings\furniture\ammobednax.p3d", [8080.06, 6416.2, 116.2], [-0.993655, -0.11246, -0.00137047], [-0.00129187, -0.000771824, 0.999999]],
        ["ca\buildings\furniture\bedna_ammo2x.p3d", [8078.91, 6415.35, 116.623], [0, 1, 0], [0, 0, 1]],
        ["ca\signs2\signt\sign_badroadside.p3d", [7954.57, 6400.94, 114.411], [0, 0.995037, 0.0995048], [0.0945743, -0.0990588, 0.990577]],
        ["ca\misc\barbedwire.p3d", [8086.5, 6415.51, 117.012], [0, 0.999999, -0.00133721], [-0.0130287, 0.0013371, 0.999914]],
        ["ca\misc\barel6.p3d", [8081.35, 6418.35, 116.757], [0.862667, -0.505482, 0.0171156], [-0.0205067, -0.00114447, 0.999789]],
        ["ca\misc\barel1.p3d", [8082.03, 6418.11, 116.771], [0, 0.999999, 0.00109178], [-0.0154904, -0.00109165, 0.999879]],
        ["ca\misc\barel3.p3d", [8081.81, 6417.32, 116.766], [0, 0.999999, 0.00114471], [-0.0205067, -0.00114447, 0.999789]],
        ["ca\misc\barel1.p3d", [8082.41, 6417.31, 116.776], [0, 0.999999, 0.00109178], [-0.0154904, -0.00109165, 0.999879]],
        ["ca\misc\barel6.p3d", [8081.7, 6415.94, 116.762], [0, 0.999999, 0.00114471], [-0.0205067, -0.00114447, 0.999789]],
        ["ca\structures\furniture\decoration\box_c\box_c.p3d", [8077.01, 6413.97, 116.473], [0, 1, 0], [0, 0, 1]],
        ["ca\structures\furniture\decoration\box_c\box_c.p3d", [8078.05, 6414.27, 116.516], [0, 1, 0], [0, 0, 1]],
        ["ca\buildings2\misc_cargo\misc_cargo2e.p3d", [8074.51, 6429.67, 118.652], [-0.998444, -0.0526674, -0.0183128], [-0.0177159, -0.0117775, 0.999774]],
        ["ca\misc_e\misc_cargo2e_ep1.p3d", [8068.2, 6428.88, 118.581], [0.98664, 0.162853, 0.00445476], [-0.00393664, -0.00350407, 0.999986]],
        ["ca\misc3\cncblock.p3d", [8068.47, 6433.31, 116.463], [0, 0.999788, 0.020602], [-0.00395175, -0.0206019, 0.99978]],
        ["ca\structures\misc\misc_deerstand\misc_deerstand.p3d", [8091.48, 6433.71, 118.844], [0.121166, -0.991989, -0.0357305], [-0.0428367, -0.0411877, 0.998233]],
        ["ca\misc3\toilet.p3d", [8081.47, 6423.84, 117.406], [-0.998843, -0.0448226, -0.0174016], [-0.0174037, -0.000345003, 0.999848]],
        ["ca\structures_e\misc\misc_garbage\misc_garb_heap_ep1.p3d", [8080.89, 6425.64, 116.564], [0, 1, 0.000345055], [-0.0174037, -0.000345003, 0.999848]],
        ["ca\structures_e\misc\misc_garbage\misc_garb_heap_ep1.p3d", [8080.87, 6426.81, 116.573], [0, 0.999931, 0.0117793], [-0.0174037, -0.0117776, 0.999779]],
        ["ca\misc\popelnice.p3d", [8081.77, 6425.19, 116.684], [0, 1, 0.000345055], [-0.0174037, -0.000345003, 0.999848]],
        ["ca\misc\popelnice.p3d", [8080.48, 6424.92, 116.661], [0, 1, 0.000345055], [-0.0174037, -0.000345003, 0.999848]],
        ["ca\misc\heli_h_civil.p3d", [8051.67, 6457.1, 116.371], [0, 0.999133, -0.0416297], [0.0216599, 0.0416199, 0.998899]],
        ["cup\terrains\cup_terrains_cwa_misc\cwa_crates.p3d", [8074.53, 6414.38, 116.424], [0, 1, 0.000771824], [-0.00129187, -0.000771824, 0.999999]],
        ["cup\terrains\cup_terrains_cwa_misc\cwa_crates.p3d", [8073.72, 6414.34, 116.423], [-0.991661, 0.128866, -0.00118164], [-0.00129187, -0.000771824, 0.999999]],
        ["ca\buildings\misc\plot_provizorni.p3d", [8048.96, 6445.36, 116.946], [-0.0800344, 0.994898, 0.061421], [-0.0259136, -0.0636746, 0.997634]],
        ["ca\buildings\misc\plot_provizorni.p3d", [8057.36, 6446.58, 117.182], [-0.165007, 0.986244, 0.00971137], [-0.00836508, -0.0112454, 0.999902]],
        ["ca\buildings\misc\hrobecek.p3d", [8063.67, 6427.84, 116.124], [-0.141197, 0.989982, 0.000113683], [-0.00559927, -0.000913431, 0.999984]],
        ["ca\buildings\misc\hrobecek.p3d", [8062.35, 6427.72, 116.116], [-0.141197, 0.989982, 0.000113683], [-0.00559927, -0.000913431, 0.999984]],
        ["ca\buildings\misc\hrobecek.p3d", [8061.01, 6427.76, 116.108], [-0.141196, 0.989981, 0.00107556], [-0.00670383, -0.00204255, 0.999975]],
        ["ca\misc\m113t.p3d", [8067.87, 6436.75, 117.549], [0, 0.99933, 0.0366003], [-0.0199559, -0.0365931, 0.999131]],
        ["a3\structures_f\wrecks\wreck_skodovka_f.p3d", [8090.11, 6441.06, 117.375], [0.420828, 0.906965, 0.0178355], [-0.00904959, -0.0154629, 0.999839]],
        ["a3\structures_f\wrecks\wreck_skodovka_f.p3d", [8038.29, 6424.76, 116.313], [-0.9885, -0.150469, -0.015086], [-0.0155327, 0.00179384, 0.999878]],
        ["a3\structures_f\wrecks\wreck_truck_dropside_f.p3d", [8045.46, 6416.57, 117.33], [-0.998125, -0.061198, -0.00133668], [-0.00129187, -0.000771824, 0.999999]],
        ["a3\structures_f\civ\camping\sun_chair_green_f.p3d", [8071.64, 6414.55, 116.33], [0.0570301, -0.998372, -0.000696893], [-0.00129187, -0.000771824, 0.999999]],
        ["a3\structures_f_epa\civ\constructions\portablelight_double_f.p3d", [8090.99, 6417.55, 117.481], [0.68975, -0.724047, 0], [0, 0, 1]],
        ["a3\structures_f_epa\civ\constructions\portablelight_double_f.p3d", [8082.74, 6416.17, 117.289], [-0.400485, -0.916303, 0], [0, 0, 1]],
        ["a3\structures_f_epa\civ\constructions\portablelight_double_f.p3d", [8076.26, 6426.42, 117.287], [-0.258821, 0.965925, 0], [0, 0, 1]],
        ["a3\structures_f_exp\walls\slum\slumwall_01_s_4m_f.p3d", [8070.92, 6415.02, 116.566], [-0.997887, -0.0649709, 0], [0, 0, 1]],
        ["a3\structures_f_exp\walls\slum\slumwall_01_s_4m_f.p3d", [8072.81, 6417.27, 116.571], [-0.066519, 0.997785, 0], [0, 0, 1]],
        ["a3\structures_f\civ\camping\campingtable_small_f.p3d", [8071.85, 6416.42, 116.596], [0, 1, 0.000771824], [-0.00129187, -0.000771824, 0.999999]],
        //Armory Trader
        ["ca\weapons\ammoboxes\usbasicammo.p3d", [2751.05, 11263.2, 137.141], [0, 1, 0], [0, 0, 1]],
        ["ca\weapons\ammoboxes\usbasicammo.p3d", [2751.93, 11263.2, 137.141], [0.993018, 0.117962, 0], [0, 0, 1]],
        ["ca\misc3\camonet_nato_var1.p3d", [2751.35, 11265.2, 139.093], [0, 1, 0], [0, 0, 1]],
        ["ca\misc\misc_backpackheap.p3d", [2748.46, 11269.6, 136.744], [0, 0.999837, -0.018036], [-0.0100245, 0.018035, 0.999787]],
        ["a3\structures_f\civ\camping\tenta_f.p3d", [2748.14, 11267.7, 137.088], [0.999759, 0.0213737, 0.00506135], [-0.0053265, 0.0123667, 0.999909]],
        ["ca\misc_e\cluttercutter_small_ep1.p3d", [2746.43, 11268, 136.394], [0, 0.999939, -0.0110105], [0.00535993, 0.0110104, 0.999925]],
        ["ca\misc_e\cluttercutter_small_ep1.p3d", [2746.25, 11266.5, 136.4], [0, 0.999923, -0.0123717], [-0.0685358, 0.0123426, 0.997572]],
        ["a3\structures_f\system\cluttercutter_medium_f.p3d", [2748.89, 11265.8, 136.533], [0, 0.999924, -0.0123669], [-0.0053265, 0.0123667, 0.999909]],
        ["ca\weapons\ammoboxes\usspecialweapons.p3d", [2749.06, 11262.9, 137.93], [0.997377, 0.0722523, 0.00441941], [-0.0053265, 0.0123667, 0.999909]],
        ["ca\weapons\ammoboxes\usspecialweapons.p3d", [2748.77, 11264.7, 137.906], [-0.959487, 0.281621, -0.00859421], [-0.0053265, 0.0123667, 0.999909]],
        ["ca\misc\ural_wrecked.p3d", [2737.81, 11280.8, 136.467], [-0.441742, 0.895672, -0.051331], [-0.051676, 0.0317181, 0.99816]],
        //Hardware Trader
        ["a3\structures_f\civ\lamps\lampsolar_f.p3d", [3976.22, 9278.99, 154.336], [-0.781222, 0.624253, 0], [0, 0, 1]],
        ["a3\structures_f\civ\constructions\cinderblocks_f.p3d", [3968, 9288.34, 150.586], [-0.704579, 0.709626, 0.000595886], [0.000845734, 0, 1]],
        ["a3\structures_f\civ\camping\fieldtoilet_f.p3d", [3964.95, 9287.18, 151.647], [0.63655, 0.771227, -0.00356429], [0.00559929, 0, 0.999984]],
        ["a3\structures_f_heli\civ\constructions\gastank_02_f.p3d", [3976.52, 9283.94, 151.451], [0, 1, 0], [0.000845734, 0, 1]],
        ["a3\structures_f_heli\civ\constructions\gastank_02_f.p3d", [3976.21, 9283.71, 151.452], [0.586025, -0.810293, -0.000495621], [0.000845734, 0, 1]],
        ["a3\structures_f_heli\civ\constructions\weldingtrolley_01_f.p3d", [3975.52, 9283.2, 151.283], [0.734974, -0.678095, -0.000621593], [0.000845734, 0, 1]],
        ["a3\structures_f\civ\camping\sun_chair_green_f.p3d", [3972.76, 9288.06, 150.732], [0.606342, 0.795204, -0.000512805], [0.000845734, 0, 1]],
        ["a3\structures_f\civ\camping\campingtable_small_f.p3d", [3970.53, 9291.53, 150.998], [-0.711247, 0.702942, 0.000601526], [0.000845734, 0, 1]],
        ["sar_ru_architect\a_uaz_dovn.p3d", [3961.43, 9273.22, 151.085], [0, 1, 0], [0, 0, 1]],
        ["sar_ru_architect\zaporosez.p3d", [3964.11, 9269.33, 150.703], [0.239791, -0.970824, 0], [0, 0, 1]],
        ["a3\structures_f_exp\walls\tin\tinwall_01_m_4m_v1_f.p3d", [3968.04, 9285.29, 151.26], [0.650826, 0.759227, 0], [0, 0, 1]],
        ["a3\structures_f_exp\walls\tin\tinwall_01_m_4m_v1_f.p3d", [3967.97, 9285.27, 152.526], [0.650826, 0.759227, 0], [0, 0, 1]],
        ["a3\structures_f\furniture\chairplastic_f.p3d", [3974.59, 9282.36, 151.07], [-0.67405, -0.738685, 0.000570067], [0.000845734, 0, 1]],
        ["a3\structures_f\furniture\chairplastic_f.p3d", [3973.99, 9281.66, 151.071], [-0.67405, -0.738685, 0.000570067], [0.000845734, 0, 1]],
        //Spec Ops
        ["ca\weapons\ammoboxes\usspecialweapons.p3d", [6642.57, 3711.85, 240.048], [0, 1, 0], [0.00182659, 0, 0.999998]],
        ["ca\weapons\ammoboxes\usspecialweapons.p3d", [6642.55, 3710.51, 240.048], [0.236028, -0.971746, -0.000431127], [0.00182659, 0, 0.999998]],
        ["ca\weapons\ammoboxes\usspecialweapons.p3d", [6648.36, 3713.3, 240.158], [0, 1, 0], [0.00182659, 0, 0.999998]],
        ["ca\weapons\ammoboxes\usbasicweapons.p3d", [6642.71, 3709.36, 239.979], [0, 1, 0], [0.00182659, 0, 0.999998]],
        ["ca\weapons\ammoboxes\usbasicweapons.p3d", [6641.26, 3711.76, 239.982], [0, 1, 0], [0.00182659, 0, 0.999998]],
        ["ca\weapons\ammoboxes\usbasicweapons.p3d", [6647.5, 3713.42, 240.091], [0, 1, 0], [0.00182659, 0, 0.999998]],
        ["ca\misc3\antenna.p3d", [6639.97, 3709.78, 245.76], [0, 1, 0], [0, 0, 1]],
        ["a3\structures_f_epa\mil\scrapyard\paperbox_closed_f.p3d", [6638.15, 3703.78, 239.339], [0.0450621, 0.998984, -8.231e-005], [0.00182659, 0, 0.999998]],
        ["a3\structures_f_epa\mil\scrapyard\paperbox_closed_f.p3d", [6639.68, 3703.6, 239.336], [0.0450621, 0.998984, -8.231e-005], [0.00182659, 0, 0.999998]],
        ["a3\structures_f_epa\mil\scrapyard\paperbox_open_full_f.p3d", [6641.25, 3703.55, 239.298], [0, 1, 0], [0.00182659, 0, 0.999998]],
        ["ca\misc3\camonet_nato_var1.p3d", [6631.63, 3707.93, 239.751], [-0.999402, 0.0345743, 0], [0, 0, 1]],
        ["a3\structures_f\furniture\chairplastic_f.p3d", [6644.72, 3713.06, 239.283], [0.994709, 0.102715, -0.00181693], [0.00182659, 0, 0.999998]],
        ["a3\structures_f\furniture\chairplastic_f.p3d", [6646.05, 3713.09, 239.284], [0.954726, -0.297487, 0], [0, 0, 1]],
        ["ca\structures\furniture\chairs\vojenska_palanda\vojenska_palanda.p3d", [6648.83, 3708.94, 238.676], [0.0377245, 0.999288, -6.89072e-005], [0.00182659, 0, 0.999998]],
        //Waste Dump
        ["a3\structures_f\households\slum\cargo_house_slum_f.p3d", [11168, 9099.22, 65.5674], [0.998472, -0.0552545, 0], [0, 0, 1]],
        ["a3\structures_f\households\slum\cargo_addon01_v1_f.p3d", [11165.5, 9103.01, 65.6134], [0.999348, -0.036092, 0], [0, 0, 1]],
        ["a3\structures_f\households\slum\cargo_addon01_v1_f.p3d", [11165.4, 9099.11, 65.636], [0.997348, -0.0727815, 0], [0, 0, 1]],
        ["a3\structures_f\households\slum\slum_house02_f.p3d", [11177, 9097.9, 66.1275], [-0.996371, 0.0851153, 0], [0, 0, 1]],
        ["a3\structures_f\households\slum\cargo_addon02_v1_f.p3d", [11171.1, 9100.39, 65.7579], [-0.999132, 0.0416683, 0], [0, 0, 1]],
        ["a3\structures_f\wrecks\wreck_truck_dropside_f.p3d", [11171.6, 9100.94, 66.2656], [0, 1, 0], [-0.0155672, 0, 0.999879]],
        ["a3\structures_f\wrecks\wreck_t72_hull_f.p3d", [11149.1, 9103.95, 65.687], [-0.898287, -0.439189, 0.0138995], [0.00729155, 0.0167293, 0.999833]],
        ["a3\structures_f\wrecks\wreck_slammer_hull_f.p3d", [11142.2, 9107.52, 65.7072], [0.288531, -0.957285, 0.0188256], [-0.000345267, 0.0195578, 0.999809]],
        ["ca\wheeled\skodovka_wrecked.p3d", [11145.4, 9101.23, 65.6811], [0, 1, 0], [0, 0, 1]],
        ["ca\wheeled\skodovka_wrecked.p3d", [11142.1, 9100.55, 65.6803], [1, 0.000574068, 0], [0, 0, 1]],
        ["ca\wheeled\skodovka_wrecked.p3d", [11164.3, 9118.3, 65.5074], [0, 0.999996, -0.00265204], [-0.012482, 0.00265184, 0.999919]],
        ["ca\wheeled\skodovka_wrecked.p3d", [11166.4, 9111.24, 65.5445], [0.67988, -0.733294, 0.0065565], [-0.00927082, 0.000345252, 0.999957]],
        ["ca\wheeled\skodovka_wrecked.p3d", [11180.9, 9153.6, 67.2943], [0, 0.998989, 0.0449566], [0.26749, -0.0433184, 0.962586]],
        ["ca\wheeled\skodovka_wrecked.p3d", [11205, 9144.77, 65.8781], [-0.752188, -0.649451, 0.111475], [0.135419, 0.0132089, 0.9907]],
        ["a3\structures_f\wrecks\wreck_ural_f.p3d", [11201.7, 9128.8, 67.3647], [-0.950328, 0.296193, -0.095643], [-0.101152, -0.00329447, 0.994865]],
        ["a3\structures_f\wrecks\wreck_ural_f.p3d", [11180.9, 9122.71, 66.1648], [-0.459796, -0.887938, 0.0123594], [0, 0.0139178, 0.999903]],
        ["ca\misc\datsun01t.p3d", [11147.8, 9117.15, 65.5649], [0, 0.999969, -0.0078429], [-0.00150498, 0.00784289, 0.999968]],
        ["ca\misc\datsun01t.p3d", [11152.3, 9131.43, 65.4347], [-0.474694, -0.880138, -0.00471569], [-0.0343815, 0.0131891, 0.999322]],
        ["ca\misc\datsun02t.p3d", [11147.6, 9129.45, 65.5397], [0.953034, -0.302864, 0.000530291], [0.00656916, 0.0224219, 0.999727]],
        ["a3\structures_f\wrecks\wreck_offroad_f.p3d", [11145.2, 9121.91, 65.6671], [-0.931624, 0.36324, -0.0115548], [-0.00154408, 0.0278379, 0.999611]],
        ["a3\structures_f\wrecks\wreck_offroad_f.p3d", [11151.2, 9098.6, 66.0342], [0.923189, 0.384347, 0], [0, 0, 1]],
        ["ca\misc\hiluxt.p3d", [11181.7, 9099.74, 65.9297], [0, 1, -0.000488281], [-0.000345267, 0.000488281, 1]],
        ["ca\misc\hiluxt.p3d", [11181, 9103.27, 65.9109], [0.842872, 0.538068, -0.00708929], [-0.000345267, 0.0137151, 0.999906]],
        ["a3\structures_f\wrecks\wreck_hunter_f.p3d", [11144, 9094.6, 66.9698], [0, 1, 0], [0, 0, 1]],
        ["a3\structures_f\wrecks\wreck_hunter_f.p3d", [11141.9, 9116.56, 66.6832], [-0.844229, -0.535979, -0.00183608], [-0.00822135, 0.00952418, 0.999921]],
        ["a3\structures_f\wrecks\wreck_hunter_f.p3d", [11189.8, 9128.53, 66.8388], [0.97611, -0.217165, 0.006957], [-0.00689666, 0.00103578, 0.999976]],
        ["ca\wheeled\hmmwv_wrecked.p3d", [11190.4, 9132.2, 65.9192], [0, 0.999153, 0.0411488], [-0.106828, -0.0409133, 0.993435]],
        ["ca\wheeled\hmmwv_wrecked.p3d", [11184.4, 9126.81, 65.8359], [0.98835, -0.152007, 0.00756778], [-0.00760366, 0.000345257, 0.999971]],
        ["ca\wheeled\hmmwv_wrecked.p3d", [11148.9, 9094.3, 66.0064], [0.941989, 0.335642, 0], [0, 0, 1]],
        ["a3\structures_f\wrecks\wreck_car3_f.p3d", [11136.7, 9110.71, 65.614], [0, 0.999893, -0.0146195], [-0.0103636, 0.0146188, 0.999839]],
        ["a3\structures_f\wrecks\wreck_car3_f.p3d", [11175.4, 9155.81, 68.8429], [0.96277, -0.167739, -0.211985], [0.190002, -0.137903, 0.97205]],
        ["a3\structures_f\wrecks\wreck_car_f.p3d", [11171.8, 9089.6, 65.8804], [0, 0.999989, -0.00474662], [-0.0024657, 0.00474661, 0.999986]],
        ["a3\structures_f\wrecks\wreck_car2_f.p3d", [11154.5, 9086.58, 65.9439], [0.677218, -0.735782, 0.000487862], [-0.000345267, 0.000345267, 1]],
        ["a3\structures_f\wrecks\wreck_truck_f.p3d", [11153.5, 9094.62, 66.3739], [0, 1, 0], [0, 0, 1]],
        ["a3\structures_f\wrecks\wreck_truck_f.p3d", [11164.5, 9114.55, 66.2153], [0.984383, 0.175889, 0.00733784], [-0.00861777, 0.00651421, 0.999942]],
        ["a3\structures_f\wrecks\wreck_bmp2_f.p3d", [11192.5, 9079.46, 68.5437], [0, 0.979962, -0.199187], [0, 0.199187, 0.979962]],
        ["a3\props_f_exp\industrial\heavyequipment\bulldozer_01_wreck_f.p3d", [11131.6, 9099.65, 66.4782], [0.991174, 0.132554, -0.0016254], [-0.000488281, 0.0159118, 0.999873]],
        ["a3\structures_f\civ\camping\campingtable_f.p3d", [11165, 9102.74, 65.4066], [-0.98872, 0.149768, 0.00160256], [0.00310737, 0.00981417, 0.999947]],
        ["a3\structures_f\civ\camping\campingchair_v1_f.p3d", [11166.4, 9103, 65.511], [0.991434, -0.129578, 0.016403], [-0.0155672, 0.00746033, 0.999851]],
        ["a3\structures_f\civ\camping\campingchair_v1_folded_f.p3d", [11166, 9101.5, 110.075], [0.780819, -0.624651, 0.011516], [-0.0110477, 0.00462482, 0.999928]],
        ["a3\structures_f\civ\camping\campingchair_v1_folded_f.p3d", [11165.9, 9100.91, 65.0782], [0, 0.999989, -0.00463223], [0.00310737, 0.00463221, 0.999984]],
        ["a3\structures_f\civ\camping\sun_chair_green_f.p3d", [11174.8, 9100.81, 65.4706], [-0.98387, 0.178885, 0], [0, 0, 1]],
        ["a3\structures_f_epa\civ\constructions\portablelight_double_f.p3d", [11165, 9107.99, 66.0443], [0, 1, 0], [0, 0, 1]],
        ["a3\structures_f_epa\civ\constructions\portablelight_double_f.p3d", [11152.6, 9099.64, 66.8302], [-0.896986, -0.442059, 0], [0, 0, 1]],
        ["a3\structures_f_epa\civ\constructions\portablelight_double_f.p3d", [11167.3, 9118.81, 68.7109], [0.139961, -0.990157, 0], [0, 0, 1]],
        //Vehicles
        ["a3\structures_f\civ\camping\tentdome_f.p3d", [3107.19, 4496.12, 114.382], [0, 1, 0], [0, 0, 1]],
        ["a3\structures_f\civ\accessories\woodpile_f.p3d", [3106.42, 4490.59, 114.023], [0, 1, 0], [0, 0, 1]],
        ["a3\structures_f\civ\camping\campfire_f.p3d", [3102.45, 4494.31, 113.982], [0, 1, 0], [0, 0, 1]],
        ["a3\structures_f_epa\civ\constructions\portablelight_double_f.p3d", [3113.23, 4487.27, 115.101], [0.382124, -0.924111, 0], [0, 0, 1]],
        ["a3\structures_f_epa\civ\constructions\portablelight_double_f.p3d", [3128.74, 4488.47, 115.163], [0.996471, 0.0839377, 0], [0, 0, 1]],
        ["ca\structures\misc\misc_deerstand\misc_deerstand.p3d", [3132.58, 4471.73, 115.908], [0.89107, 0.453865, 0], [0, 0, 1]],
        ["ca\structures\misc\misc_deerstand\misc_deerstand.p3d", [3139.11, 4503.71, 115.909], [-0.140665, -0.990057, 0], [0, 0, 1]],
        //Aircraft
        ["a3\structures_f\civ\camping\sun_chair_green_f.p3d", [10042.2, 4840.25, 17.2036], [0, 1, 0], [0.00119573, 0, 0.999999]],
        ["ca\misc\mutt_vysilacka.p3d", [10046.4, 4843.06, 18.8479], [0, 1, 0], [0, 0, 1]],
        ["ca\weapons\ammoboxes\usbasicammo.p3d", [10041.2, 4845.1, 17.2839], [0, 1, 0], [0.00119604, 0, 0.999999]],
        //Office and Roulette
        ["ca\misc2\desk\desk.p3d", [7579.91, 4539.67, 117.476], [0.00137273, -0.999999, -6.70036e-007], [0.000488106, 0, 1]],
        ["ca\misc\pc.p3d", [7579.92, 4539.59, 118.071], [-0.998975, -0.0448217, -0.00637392], [-0.00606921, -0.00693095, 0.999958]],
        ["a3\structures_f_heli\furniture\officecabinet_01_f.p3d", [7581.26, 4539.89, 117.849], [0, 1, 0], [0.000488106, 0, 1]],
        ["ca\buildings\podesta_1_cube.p3d", [7583.35, 4545.3, 113.029], [0, 1, 0], [0, 0, 1]]
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
    };
    case "tanoa":
    {
        // Todo
    };
};

setTerrainGrid 3.125;
setViewDistance 1500;

_bul = [] execVM "addons\blowout\module\blowout_server.sqf";
diag_log "BLOWOUT SERVER - Loading";