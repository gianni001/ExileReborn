/*
**  BLOWOUT MODULE - Nightstalkers: Shadow of Namalsk
*   ..created by Sumrak, ©2010
*   http://www.nightstalkers.cz
*   sumrak<at>nightstalkers.cz
*   PBO edition
*   SERVER-SIDE script 
*/
private["_emp_tg_namalsk"];
"BLOWOUT SERVER - Loaded" call ExileServer_util_log;
// init
while {true} do 
{
  if (isNil("ns_blowout")) then { ns_blowout = true; }; 
  if (isNil("ns_blow_delaymod")) then { ns_blow_delaymod = 1; };
  if (isNil("ns_blow_prep")) then { ns_blow_prep = false; };

  private["_prodleva"];
  _prodleva = random (6000 * ns_blow_delaymod);

  while { _prodleva < (3000 * ns_blow_delaymod) } do 
  {
    _prodleva = random (6000 * ns_blow_delaymod);
  };

  _chanceOfStorm = random 1;

  sleep _prodleva;

  _time = serverTime / 60;

  _timeToRestart = 240 - _time;

  if (_chanceOfStorm > 0.6) then {format ["NAC: EVR Will procede chance greater then 0.6"] call ExileServer_util_log;} else {format ["NAC: EVR Will not occur chance less than 0.6"]call ExileServer_util_log;}; 

  if ((_chanceOfStorm > 0.6) && (_timeToRestart > 10)) then
  {  

    if(!ns_blowout) then 
    {
      format["[NAC BLOWOUT SERVER] :: Blowout module is temporarily OFF ns_blowout (ns_blowout = %1)", ns_blowout] call ExileServer_util_log;
    } 
    else 
    {
      format["[NAC BLOWOUT SERVER] :: Blowout module is ON ns_blowout (ns_blowout = %1)", ns_blowout] call ExileServer_util_log;
    };

    // Stop variable check
    waitUntil {ns_blowout};

    // Preparations before blowout - APSI / players running to take a cover
    ns_blow_prep = true;
    publicVariable "ns_blow_prep";
   
    
    format ["[NAC BLOWOUT SERVER] :: Preparations are under way (ns_blow_prep = %1)", ns_blow_prep] call ExileServer_util_log;
    
    sleep 290;
    ns_blow_prep = false;
    publicVariable "ns_blow_prep";
    
    
    format ["[NAC BLOWOUT SERVER] :: Preparations are finished (ns_blow_prep = %1)", ns_blow_prep] call ExileServer_util_log;
   

    // main blowout variable - 1 == blowout in progress, 0 == no current blowout
    ns_blow_status = true;
    publicVariable "ns_blow_status";
   
   
    format ["[NAC BLOWOUT SERVER] :: Blowout in progress (ns_blow_status = %1)", ns_blow_status] call ExileServer_util_log;
    
    sleep 2;
    if (ns_blow_status) then 
    {
      ns_blow_action = true;
      publicVariable "ns_blow_action";
    
      format ["[NAC BLOWOUT SERVER] :: Blowout actions in progress (ns_blow_action = %1)", ns_blow_action] call ExileServer_util_log;
      
      sleep 10;

      _zombieArray =

      [
        "RyanZombieC_man_1slow","RyanZombieC_man_polo_1_Fslow","RyanZombieC_man_polo_2_Fslow","RyanZombieC_man_polo_4_Fslow","RyanZombieC_man_polo_5_Fslow","RyanZombieC_man_polo_6_Fslow","RyanZombieC_man_p_fugitive_Fslow","RyanZombieC_man_w_worker_Fslow","RyanZombieC_man_hunter_1_Fslow",
        "RyanZombieC_man_1medium","RyanZombieC_man_polo_1_Fmedium","RyanZombieC_man_polo_2_Fmedium","RyanZombieC_man_polo_4_Fmedium","RyanZombieC_man_polo_5_Fmedium","RyanZombieC_man_polo_6_Fmedium","RyanZombieC_man_p_fugitive_Fmedium","RyanZombieC_man_w_worker_Fmedium","RyanZombieC_man_hunter_1_Fmedium",
        "RyanZombieC_man_1","RyanZombieC_man_polo_1_F","RyanZombieC_man_polo_2_F","RyanZombieC_man_polo_4_F","RyanZombieC_man_polo_5_F","RyanZombieC_man_polo_6_F","RyanZombieC_man_p_fugitive_F","RyanZombieC_man_w_worker_F","RyanZombieC_man_hunter_1_F","RyanZombieC_man_pilot_F","RyanZombieC_journalist_F","RyanZombieC_Orestes","RyanZombieC_Nikos",
        "RyanZombieSpider1","RyanZombieSpider2","RyanZombieSpider3","RyanZombieSpider4","RyanZombieSpider5","RyanZombieSpider6",
        "RyanZombieB_Soldier_02_fslow","RyanZombieB_Soldier_02_f_1slow","RyanZombieB_Soldier_02_f_1_1slow","RyanZombieB_Soldier_03_fslow","RyanZombieB_Soldier_03_f_1slow","RyanZombieB_Soldier_03_f_1_1slow","RyanZombieB_Soldier_04_fslow","RyanZombieB_Soldier_04_f_1slow","RyanZombieB_Soldier_04_f_1_1slow","RyanZombieB_Soldier_lite_Fslow","RyanZombieB_Soldier_lite_F_1slow",
        "RyanZombieB_Soldier_02_fmedium","RyanZombieB_Soldier_02_f_1medium","RyanZombieB_Soldier_02_f_1_1medium","RyanZombieB_Soldier_03_fmedium","RyanZombieB_Soldier_03_f_1medium","RyanZombieB_Soldier_03_f_1_1medium","RyanZombieB_Soldier_04_fmedium","RyanZombieB_Soldier_04_f_1medium","RyanZombieB_Soldier_04_f_1_1medium","RyanZombieB_Soldier_lite_Fmedium","RyanZombieB_Soldier_lite_F_1medium",
        "RyanZombieB_Soldier_02_f", "RyanZombieB_Soldier_02_f_1", "RyanZombieB_Soldier_02_f_1_1", "RyanZombieB_Soldier_03_f", "RyanZombieB_Soldier_03_f_1", "RyanZombieB_Soldier_03_f_1_1", "RyanZombieB_Soldier_04_f", "RyanZombieB_Soldier_04_f_1", "RyanZombieB_Soldier_04_f_1_1", "RyanZombieB_Soldier_lite_F", "RyanZombieB_Soldier_lite_F_1",
        "RyanZombieCrawler1", "RyanZombieCrawler2", "RyanZombieCrawler3", "RyanZombieCrawler4", "RyanZombieCrawler5", "RyanZombieCrawler6", "RyanZombieCrawler7", "RyanZombieCrawler8", "RyanZombieCrawler9", "RyanZombieCrawler10", "RyanZombieCrawler11", "RyanZombieCrawler12", "RyanZombieCrawler13", "RyanZombieCrawler14", "RyanZombieCrawler1Opfor", "RyanZombieCrawler2Opfor", "RyanZombieCrawler3Opfor", "RyanZombieCrawler4Opfor", "RyanZombieCrawler5Opfor", "RyanZombieCrawler6Opfor", "RyanZombieCrawler7Opfor", "RyanZombieCrawler8Opfor", "RyanZombieCrawler9Opfor", "RyanZombieCrawler10Opfor", "RyanZombieCrawler11Opfor", "RyanZombieCrawler12Opfor", "RyanZombieCrawler13Opfor", "RyanZombieCrawler14Opfor",
        "RyanZombieC_man_1walker","RyanZombieC_man_polo_1_Fwalker","RyanZombieC_man_polo_2_Fwalker","RyanZombieC_man_polo_4_Fwalker","RyanZombieC_man_polo_5_Fwalker","RyanZombieC_man_polo_6_Fwalker","RyanZombieC_man_p_fugitive_Fwalker","RyanZombieC_man_w_worker_Fwalker","RyanZombieC_scientist_Fwalker","RyanZombieC_man_hunter_1_Fwalker","RyanZombieC_man_pilot_Fwalker","RyanZombieC_journalist_Fwalker","RyanZombieC_Oresteswalker","RyanZombieC_Nikoswalker",
        "O_G_Soldier_F"
      ];

      {
        _zombies = typeOf _x; // return class name of all units selection
        if (_zombies in _zombieArray) then // check if class name is in the zombie array
        {
          _x setDamage 1; // kill the selection
        };  

      }  forEach AllUnits; // selection criteria
      
      ns_blow_action = false;
      publicVariable "ns_blow_action";
    };
    sleep 10;
    ns_blow_status = false; 
    publicVariable "ns_blow_status";
  }
  else
  {
    "Blowout will occur too close to restart - Cancelling event" call ExileServer_util_log;
  };  
};