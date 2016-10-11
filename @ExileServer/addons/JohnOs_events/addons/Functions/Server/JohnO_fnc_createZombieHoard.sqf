private ["_positionStart","_positionEnd","_group"];

_civSlow = ["RyanZombieC_man_1slow","RyanZombieC_man_polo_1_Fslow","RyanZombieC_man_polo_2_Fslow","RyanZombieC_man_polo_4_Fslow","RyanZombieC_man_polo_5_Fslow","RyanZombieC_man_polo_6_Fslow","RyanZombieC_man_p_fugitive_Fslow","RyanZombieC_man_w_worker_Fslow","RyanZombieC_man_hunter_1_Fslow"];


ryanzombiesdisablescript = true;

_endPosition = [] call JohnO_fnc_findSafeTownPosition;

_positionArray = [];
_validObjects = ["land_fs_feed_f","Land_FuelStation_Feed_F"];
_validPlayerArray = [];
{
	_buildings = nearestObjects [_x,_validObjects, 75];

	if !(_buildings isEqualTo []) then
	{
		_validPlayerArray pushBack _x;
	};	
} forEach AllPlayers;	
if !(_validPlayerArray isEqualTo []) then
{	
	Event_zombieHoard_lastActivated = time;

	_selectedPlayer = selectRandom _validPlayerArray;

	format["[EVENT:: Zombie Hoard] -- Found valid player to spawn zombie hoard near -- %1",_selectedPlayer] call ExileServer_util_log;

	_endPoint = [position _selectedPlayer, 20] call ExileClient_util_math_getRandomPositionInCircle;
	_dirAdjustment = [0,90,180,270];
		
	{	
		_dir = (direction _selectedPlayer) + _x;
		_pos = getPos _selectedPlayer;  
		_dist = 120; 
		 
		_pos = (_pos getPos [_dist, _dir] select [0, 2]) + ([[],[_pos select 2]] select (count _pos > 2)); 

		_positionArray pushBack [(_pos select 0),(_pos select 1),0];
	} forEach _dirAdjustment;	

	_group = createGroup WEST;
	_group setFormation "STAG COLUMN";
	{
		for "_i" from 0 to 7 do
		{
			_unitType = selectRandom _civSlow;
			_unit = _group createUnit [_unitType,_x,[],0,"NONE"];
			_unit setVariable ["JohnO_RoaminAI",time + 600];
			_unit setVariable ["ExileReborn_hoardMember",1];
			_unit setVariable ["ExileReborn_hoardEnd",_endPosition];
			_unit setVariable ["ExileReborn_AI_isZombie",true];

			_unit setdammage 0.7;
			_unit setspeaker "NoVoice";
			_unit enableFatigue false;
			_unit setbehaviour "CARELESS";
			_unit setunitpos "UP";
			_unit setmimic "safe";

			_facearray = ["RyanZombieFace1", "RyanZombieFace2", "RyanZombieFace3", "RyanZombieFace4", "RyanZombieFace5", "RyanZombieFace6"];
			_face = selectRandom _facearray;
			_unit setface _face;
			removegoggles _unit;

			Event_IdleZombieArray pushBack _unit;
			_unit addMPEventHandler 
			["MPKilled",
				{
					private ["_killer","_currentRespect","_amountEarned","_newRespect","_killSummary"];
					_killed = _this select 0;
					_killer = _this select 1;

					_killingPlayer = _killer call ExileServer_util_getFragKiller;
					Event_IdleZombieArray = Event_IdleZombieArray - [_killed]; 
					_currentRespect = _killingPlayer getVariable ["ExileScore", 0];
					_amountEarned = 2;
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

			if !(local _unit) then {[_unit, _endPoint] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"]} else {_unit domove _endPoint};

			sleep 0.2;	
		};		
	} forEach _positionArray;
};