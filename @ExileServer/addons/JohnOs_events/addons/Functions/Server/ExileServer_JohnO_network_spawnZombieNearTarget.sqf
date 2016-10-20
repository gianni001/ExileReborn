private ["_target","_position","_civSlow","_civMed","_walker","_position","_positions","_maxSpawn","_count","_activeScripts","_bags","_gear","_item","_currentZombieCount"]; //[_id[_thing,_stuff]]

_target = (_this select 0) call ExileServer_system_session_getPlayerObject;
_positions = (_this select 1 select 0);

_civSlow = ["RyanZombieC_man_1slow","RyanZombieC_man_polo_1_Fslow","RyanZombieC_man_polo_2_Fslow","RyanZombieC_man_polo_4_Fslow","RyanZombieC_man_polo_5_Fslow","RyanZombieC_man_polo_6_Fslow","RyanZombieC_man_p_fugitive_Fslow","RyanZombieC_man_w_worker_Fslow","RyanZombieC_man_hunter_1_Fslow"];
_civMed = ["RyanZombieC_man_1medium","RyanZombieC_man_polo_1_Fmedium","RyanZombieC_man_polo_2_Fmedium","RyanZombieC_man_polo_4_Fmedium","RyanZombieC_man_polo_5_Fmedium","RyanZombieC_man_polo_6_Fmedium","RyanZombieC_man_p_fugitive_Fmedium","RyanZombieC_man_w_worker_Fmedium","RyanZombieC_man_hunter_1_Fmedium"];
_walker = ["RyanZombieC_man_1walker","RyanZombieC_man_polo_1_Fwalker","RyanZombieC_man_polo_2_Fwalker","RyanZombieC_man_polo_4_Fwalker","RyanZombieC_man_polo_5_Fwalker","RyanZombieC_man_polo_6_Fwalker","RyanZombieC_man_p_fugitive_Fwalker","RyanZombieC_man_w_worker_Fwalker","RyanZombieC_scientist_Fwalker","RyanZombieC_man_hunter_1_Fwalker","RyanZombieC_man_pilot_Fwalker","RyanZombieC_journalist_Fwalker","RyanZombieC_Oresteswalker","RyanZombieC_Nikoswalker"];


_bags = ["B_AssaultPack_khk","B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_mcamo","B_AssaultPack_ocamo"];

if (isNull _target) exitWith 
{
	"Zombie spawn near target failed, null object - Exiting call" call ExileServer_util_log;
};

ryanzombiesdisablescript = true;
Ryanzombieslogicroam = true;
Ryanzombieshealth = 0.9;

if ((daytime > 17) && (daytime < 6)) then
{
	Ryanzombieslimit = 100;
}
else
{
	Ryanzombieslimit = 200;
};	

_activeScripts = count diag_activeSQFScripts;
_currentZombieCount = count Event_IdleZombieArray;
		
_group = createGroup WEST;

{		
	if ((random 1 > 0.98) && (_activeScripts < 130) && (_currentZombieCount < 150)) then
	{	

		if (_x distance Event_DEBUG_Location < 600) exitWith {};

		_slectionArray = [_civMed,_civSlow,_walker];
		_selection = selectRandom _slectionArray;
		_unitType = selectRandom _selection;

		_money = 10 + floor (random 30);

		_unit = _group createUnit [_unitType,_x,[],0,"NONE"];

		if (random 1 > 0.7) then
		{
			_unit addBackpack (selectRandom _bags);
			for "_i" from 0 to 1 + floor (random 2) do
			{	
				_gear = [] call JohnO_fnc_AIgear;
				_item = _gear select 5;
				_unit addItem _item;
			};
		};	

		_unit setdammage 0.7;
		_unit setspeaker "NoVoice";
		_unit enableFatigue false;
		_unit setbehaviour "CARELESS";
		_unit setunitpos "UP";
		_unit setmimic "safe";
		_unit addRating -20000;

		_facearray = ["RyanZombieFace1", "RyanZombieFace2", "RyanZombieFace3", "RyanZombieFace4", "RyanZombieFace5", "RyanZombieFace6"];
		_face = selectRandom _facearray;
		_unit setface _face;
		removegoggles _unit;
		
		_unit setVariable ["JohnO_RoaminAI",time + 600];
		_unit setVariable ["ExileMoney",_money,true];
		_unit setVariable ["ExileReborn_zombie_originalPos",_x];
		_unit setVariable ["ExileReborn_AI_isZombie",true];
		Event_ALLAI_SimulatedUnits pushBack _unit;
		
		_unit addMPEventHandler 
		["MPKilled",
			{

				private ["_killer","_currentRespect","_amountEarned","_newRespect","_killSummary"];

				_killed = _this select 0;
				_killer = _this select 1;

				_killingPlayer = _killer call ExileServer_util_getFragKiller;

				Event_ALLAI_SimulatedUnits = Event_ALLAI_SimulatedUnits - [_killed]; 
				Event_IdleZombieArray = Event_IdleZombieArray - [_killed]; 

				_currentRespect = _killingPlayer getVariable ["ExileScore", 0];
				_amountEarned = 25;
				_newRespect = _currentRespect + _amountEarned;

				_killingPlayer setVariable ["ExileScore", _newRespect];
				_killSummary = [];
				_killSummary pushBack ["ZOMBIE KILLED", _amountEarned];
				[_killingPlayer, "showFragRequest", [_killSummary]] call ExileServer_system_network_send_to;

				format["setAccountScore:%1:%2", _newRespect, getPlayerUID _killingPlayer] call ExileServer_system_database_query_fireAndForget;
				_killingPlayer call ExileServer_object_player_sendStatsUpdate;	
			}
		];
		_unit addEventHandler
		["FiredNear",
			{
				_this spawn JohnO_zombie_eventOnFiredNear;
			}
		];
		//[_unit] spawn JohnO_fnc_zombieIdleBehaviour;
		Event_IdleZombieArray pushBack _unit;
	};
} forEach _positions;

