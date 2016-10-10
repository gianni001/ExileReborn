private ["_group","_unit","_buildingPos","_buildings","_buildingPositions","_randomWaypoint","_nearPlayers","_unitLastPosChange","_unitPosChangeCoolDown","_nearHolders"];

_group = _this select 0;
_unit = (units _group) select 0;

_unit setVariable ["ExileReborn_survivor_hasWaypoint",-1];
_unit setVariable ["ExileReborn_survivor_lastLootTime",time];
_unit setVariable ["ExileReborn_survivor_antiStick",time];
_unit setVariable ["ExileReborn_survivor_positionFiveMinsAgo", [(getPos _unit),time]];

_unitLastPosChange = time;
_unitPosChangeCoolDown = 180;

// Function to remove all waypoints on the AI

JohnO_fnc_survivorDoLoot =
{
	private ["_unit","_holder","_items","_item","_nearHolders"];

	_unit = _this select 0;

	_nearHolders = position _unit nearObjects ["GroundWeaponHolder", 2];

    if (count _nearHolders > 0) then
    {
    	_holder = _nearHolders select 0;
    	_items = _holder call ExileClient_util_containerCargo_list;

    	_item = selectRandom _items;

    	_itemType = _item call ExileClient_util_cargo_getType;

    	_currentPrimary = primaryWeapon _unit;
    	
    	if !(isNil "_currentPrimary") then
    	{
    		if (_itemType isEqualTo 2) then
    		{
    			[_unit,_item,2 + floor (random 4)] call BIS_fnc_addWeapon;
    			_unit setVariable ["ExileReborn_survivor_isBambi",1,true];
    		}
    		else
    		{
		    	if ((_itemType isEqualTo 1) || (_itemType isEqualTo 4)) then
		    	{
			    	if ([_unit,_item] call ExileClient_util_playerCargo_canAdd) then
			    	{
			    		_unit playActionNow "PutDown";
			    		_unit addItem _item;
			    	};
			    };
			};
		};
    };
};

JohnO_fnc_deleteAIWaypoints =
{
	private ["_group","_unit","_lastLoot","_nearHolders"];
	_group = _this select 0;
	_unit = (units _group) select 0;

	while {(count (waypoints _group)) > 0} do
	{
	    deleteWaypoint ((waypoints _group) select 0);
	    if !(alive _unit) exitWith {};
	};

	_lastLoot = _unit getVariable ["ExileReborn_survivor_lastLootTime",0];

	_nearHolders = position _unit nearObjects ["GroundWeaponHolder",2];
	if ((count _nearHolders) > 0) then
	{
		if (time - ExileReborn_survivor_lootCoolDown >= _lastLoot) then
		{
			[_unit] call JohnO_fnc_survivorDoLoot;
			_unit setVariable ["ExileReborn_survivor_lastLootTime",time];
		};	
		sleep 2;
	};

	_unit setVariable ["ExileReborn_survivor_hasWaypoint",-1];
};

JohnO_fnc_survivorUnstuck =
{
	private ["_unit"];

	_unit = _this select 0;

	_lastPositionData = _unit getVariable ["ExileReborn_survivor_positionFiveMinsAgo",0];
	_lastPos = _lastPositionData select 0;

	_currentPos = position _unit;

	if (_currentPos distance _lastPos < 2) then
	{
		_resetPos = [getPos _unit,10] call ExileClient_util_math_getRandomPositionInCircle;
		_unit setPosATL _resetPos;
	};
};

// If the survivor is not following a player, give him a random waypoint

while {true} do
{
	if (!(alive _unit) || (isNull _unit)) exitWith {};

	if ((_unit getVariable ["ExileReborn_survivor_switchHostile",-1]) isEqualTo 1) exitWith
	{
		_unit enableAI "MOVE";
		_unit setUnitPos "AUTO";
		[group _unit] spawn JohnO_fnc_deleteAIWaypoints;
		_randPos = [position _unit,200] call ExileClient_util_math_getRandomPositionInCircle;
		_unit doMove _randPos;

		sleep 30;

		_unit setVariable ["ExileReborn_survivor_switchHostile",2];
		_unit setVariable ["ExileReborn_survivor",false,true];

		_newGroup = createGroup east;
		[_unit] joinSilent _newGroup;

		[_newGroup,getPos _unit,500] call JohnO_fnc_taskPatrol;

		deleteGroup _group;
	};

	_nearPlayers = getPos _unit nearEntities [['Exile_Unit_Player'],5];

	if ((count _nearPlayers > 0) && ((_unit getVariable ["ExileReborn_survivor_isFollowing",-1]) isEqualTo -1)) then
	{
		uiSleep 0.1;
		_unit disableAI "MOVE";
		_objectToLookAt = selectRandom _nearPlayers;

		_direction = (getDir _objectToLookAt) - 180;

		_unit setDir _direction;
	}
	else
	{
		_unit enableAI "MOVE";
		if (time - _unitPosChangeCoolDown >= _unitLastPosChange) then
		{
			_stances = ["UP","MIDDLE","AUTO"];
			_unit setUnitPos (selectRandom _stances);
			_unitLastPosChange = time;
		};
	};

	if ((_unit getVariable ["ExileReborn_survivor_isFollowing",-1]) isEqualTo -1) then
	{
		if ((_unit getVariable ["ExileReborn_survivor_hasWaypoint",-1]) isEqualTo -1) then
		{

			_buildingPos = [];

			_buildings = _unit nearObjects ["House", 300];
			{
				if !(_buildings isEqualTo []) then
				{
					_buildingPositions = _x buildingPos -1;
					{
						_buildingPos pushBack _x;
					} forEach _buildingPositions;
				};
			} forEach _buildings;

			if ((count _buildingPos) > 0) then
			{
				_randomWaypoint = selectRandom _buildingPos;
			}
			else
			{
				_positionOfUnit = position _unit;
				_randomWaypoint = [_positionOfUnit,1000] call ExileClient_util_math_getRandomPositionInCircle;
			};

			_wp = _group addWaypoint [_randomWaypoint,0];
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "AWARE";
			_wp setWaypointStatements ["true","[group this] spawn JohnO_fnc_deleteAIWaypoints"];

			_unit setVariable ["ExileReborn_survivor_hasWaypoint",1];
		};
	}
	else
	{
		//_playerToFollow = _unit getVariable ["ExileReborn_survivor_isFollowing",-1];
		_playerObject = _unit getVariable ["ExileReborn_survivor_isFollowing",-1];

		_playerToFollow = objectFromNetId _playerObject;

		if ((isPlayer _playerToFollow) && !(isNull _playerToFollow)) then
		{

			if !(alive _playerToFollow) then
			{
				_unit setVariable ["ExileReborn_survivor_isFollowing",-1,true];
			};

			if ((_unit getVariable ["ExileReborn_survivor_hasWaypoint",-1]) isEqualTo -1) then
			{

				_playerPos = position _playerToFollow;

				_wp = _group addWaypoint [_playerPos,10];
				_wp setWaypointType "MOVE";
				_wp setWaypointBehaviour "AWARE";
				_wp setWaypointStatements ["true","[group this] spawn JohnO_fnc_deleteAIWaypoints"];

				_unit setVariable ["ExileReborn_survivor_hasWaypoint",1];
			};

			_nearPlayers = getPos _unit nearEntities [['Exile_Unit_Player'],5];

			if (count _nearPlayers > 0) then
			{
				_unit setUnitPos "MIDDLE";
				_unit disableAI "MOVE";

				_objectToLookAt = selectRandom _nearPlayers;

				_direction = (getDir _objectToLookAt);

				_unit setDir _direction;
			}
			else
			{
				_unit setUnitPos "AUTO";
				_unit enableAI "MOVE";
			};
		};
	};
	// Anti stick
	_positionFiveMinutesAgo = (_unit getVariable ["ExileReborn_survivor_positionFiveMinsAgo",0]) select 1;
	if (time - ExileReborn_survivor_antiStick_check >= _positionFiveMinutesAgo) then
	{
		[_unit] call JohnO_fnc_survivorUnstuck;

		sleep 2;

		_unit setVariable ["ExileReborn_survivor_positionFiveMinsAgo", [(getPos _unit),time]];
	};
	uiSleep 1;
};













