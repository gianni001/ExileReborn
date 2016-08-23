private ["_sessionID","_playerMoney","_amount","_newPlayerMoney","_playerScore","_increase"];

{

	_sessionID = _x getVariable ["ExileSessionID", ""];
	_player = _x call ExileServer_util_getFragKiller;

	if (alive _x) then
	{
		if !([getPos _x, 400] call ExileClient_util_world_isTraderZoneInRange) then
		{	

			_playerMoney = _x getVariable ["ExileMoney", 0];
			
			_playerScore = _x getVariable ["ExileScore",0];
			_increase = round (_playerScore * 0.002); 
			if (_increase < 1) then 
			{
				_increase = 0;
			};	
			_amount = Event_Wages_AmountEarned + _increase;
			
			//_amount = Event_Wages_AmountEarned;
			_newPlayerMoney = _playerMoney + _amount;
			_x setVariable ["ExileMoney", _newPlayerMoney, true];

			[_sessionID, "toastRequest", ["InfoTitleAndText", ["Wages!",format["You have earnt $%1 in prisoner wages", _amount]]]] call ExileServer_system_network_send_to;
			format["setPlayerMoney:%1:%2", _newPlayerMoney, _x getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
			_player call ExileServer_object_player_sendStatsUpdate;
		}
		else
		{
			[_sessionID, "toastRequest", ["ErrorTitleAndText", ["No pay","You do not get paid for being in the safezone!"]]] call ExileServer_system_network_send_to;
		};
	};		

} forEach allPlayers;
