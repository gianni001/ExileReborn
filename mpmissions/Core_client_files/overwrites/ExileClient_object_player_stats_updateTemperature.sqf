/**
 * ExileClient_object_player_stats_updateTemperature
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_timeElapsed","_forcedBodyTemperatureChangePerMinute","_wetnessChangePerMinute","_altitude","_isSwimming","_bodyTemperature","_bodyWetness","_temperatureConfig","_fromDayTimeTemperature","_toDayTimeTemperature","_environmentTemperature","_playerIsInVehicle","_playerVehicle","_isFireNearby","_startPosition","_endPosition","_intersections","_isBelowRoof","_clothingColdProtection","_movementInfluence","_regulation","_environmentInfluence","_season"];
_timeElapsed = _this;
_forcedBodyTemperatureChangePerMinute = 0;
_wetnessChangePerMinute = -0.1;
_altitude = ((getPosASL player) select 2) max 0;
_isSwimming = (_altitude < 0.1) || (underwater player);
_bodyTemperature = ExileClientPlayerAttributes select 5;
_bodyWetness = ExileClientPlayerAttributes select 6;
_temperatureConfig = missionConfigFile >> "CfgExileEnvironment" >> worldName >> "Temperature";
_fromDayTimeTemperature = (getArray (_temperatureConfig >> "daytimeTemperature")) select (date select 3);
_toDayTimeTemperature = (getArray (_temperatureConfig >> "daytimeTemperature")) select ((date select 3) + 1);

// Custom
_season = [(date select 1)] call JohnO_fnc_getCurrentSeason;

_fromDayTimeTemperature = _fromDayTimeTemperature + (_season select 0);
_toDayTimeTemperature = _fromDayTimeTemperature + 1;
// Custom

_environmentTemperature = [_fromDayTimeTemperature, _toDayTimeTemperature, (date select 4) / 60] call ExileClient_util_math_lerp;
_environmentTemperature = _environmentTemperature + overcast * (getNumber (_temperatureConfig >> "overcast"));
_environmentTemperature = _environmentTemperature + rain * (getNumber (_temperatureConfig >> "rain"));
_environmentTemperature = _environmentTemperature + windStr * (getNumber (_temperatureConfig >> "wind"));
_environmentTemperature = _environmentTemperature + _altitude / 100 * (getNumber (_temperatureConfig >> "altitude"));
if (_isSwimming) then 
{
	_environmentTemperature = _environmentTemperature + (getNumber (_temperatureConfig >> "water"));
};
ExileClientEnvironmentTemperature = _environmentTemperature;
_playerIsInVehicle = false;
_playerVehicle = vehicle player;
if !(_playerVehicle isEqualTo player) then 
{
	try 
	{
		if (_playerVehicle isKindOf "Exile_Bike_QuadBike_Abstract") throw false;
		if (_playerVehicle isKindOf "Exile_Bike_OldBike") throw false;
		if (_playerVehicle isKindOf "Exile_Bike_MountainBike") throw false;
		throw true;
	}
	catch
	{
		_playerIsInVehicle = _exception;
	};
};
if (_playerIsInVehicle) then 
{
	if (isEngineOn _playerVehicle) then 
	{
		_forcedBodyTemperatureChangePerMinute = 0.02; 
		_wetnessChangePerMinute = -0.5; 
	}
	else 
	{
		_forcedBodyTemperatureChangePerMinute = 0.01; 
		_wetnessChangePerMinute = -0.2; 
	};
}
else 
{
	if (_isSwimming) then 
	{
		_wetnessChangePerMinute = 99999; 
	}
	else 
	{
		_isFireNearby = [ASLtoAGL (getPosASL player), 5] call ExileClient_util_world_isFireInRange;
		if (_isFireNearby) then 
		{
			_forcedBodyTemperatureChangePerMinute = 0.4;
			_wetnessChangePerMinute = -0.5; 
		}
		else 
		{
			if (rain > 0.1) then 
			{
				_startPosition = getPosASL player;
				_endPosition = [_startPosition select 0, _startPosition select 1, (_startPosition select 2 ) + 10];
				_intersections = lineIntersectsSurfaces [_startPosition, _endPosition, player, objNull, false, 1, "GEOM", "VIEW"];
				_isBelowRoof = !(_intersections isEqualTo []);
				if !(_isBelowRoof) then 
				{
					_wetnessChangePerMinute = rain; 
				};
			};
		};
	};
};
_bodyWetness = ((_bodyWetness + _wetnessChangePerMinute / 60 * _timeElapsed) max 0) min 1;
if (ExileClientEnvironmentTemperature > 25) then 
{
	_forcedBodyTemperatureChangePerMinute = 0.5; 
};
if (_forcedBodyTemperatureChangePerMinute > 0) then 
{
	_bodyTemperature = _bodyTemperature + _forcedBodyTemperatureChangePerMinute / 60 *_timeElapsed;
}
else 
{
	_clothingColdProtection = 0;
	if !((uniform player) isEqualTo "") then 
	{
		_clothingColdProtection = _clothingColdProtection + 0.25;
	};
	if !((headgear player) isEqualTo "") then 
	{
		_clothingColdProtection = _clothingColdProtection + 0.05;
	};
	if !((vest player) isEqualTo "") then 
	{
		_clothingColdProtection = _clothingColdProtection + 0.10;
	};
	_clothingColdProtection = ((_clothingColdProtection * (1 - (_bodyWetness * 0.5))) max 0) min 1;
	_movementInfluence = 0;
	if ((getPos player) select 2 < 0.1) then 
	{
		_movementInfluence = (37 - _bodyTemperature) * (1 - (_bodyWetness * 0.5)) * 0.075 * (vectorMagnitude (velocity player))/6.4;
	};
	if (_bodyTemperature < 37) then 
	{
		_regulation = 0.1;
	}
	else 
	{
		_regulation = -0.1; 
	};
	_environmentInfluence = (1 - _clothingColdProtection) * (-0.2 + 0.008 * ExileClientEnvironmentTemperature);
	_bodyTemperature = _bodyTemperature + (_regulation + _movementInfluence + _environmentInfluence) / 60 *_timeElapsed;
};
_bodyTemperature = _bodyTemperature min 37;
if (_bodyTemperature < 35) then 
{
	player setDamage ((damage player) + 0.1/60*_timeElapsed); 
};
ExileClientPlayerAttributes set [6, _bodyWetness];
ExileClientPlayerAttributes set [5, _bodyTemperature];
