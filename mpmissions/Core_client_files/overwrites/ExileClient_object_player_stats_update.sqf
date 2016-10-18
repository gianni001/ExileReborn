/**
 * ExileClient_object_player_stats_update
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_timeElapsed","_hungerFactor","_thirstFactor","_bloodAlcohol","_effectAttribute","_effectValue","_effectDuration","_effectStartTime","_effectValueRemaining","_endEffect","_effectToApply","_hunger","_thirst"];
if (isNil "ExileLastStatUpdate") then 
{ 
	ExileLastStatUpdate = diag_tickTime; 
};
_timeElapsed = diag_tickTime - ExileLastStatUpdate;
if (diag_tickTime - ExileClientLastTemperatureUpdateAt >= 5) then
{
	(diag_tickTime - ExileClientLastTemperatureUpdateAt) call ExileClient_object_player_stats_updateTemperature;
	ExileClientLastTemperatureUpdateAt = diag_tickTime;
};
ExileClientPlayerLoad = loadAbs player;
ExileClientPlayerOxygen = getOxygenRemaining player * 100;
ExileClientPlayerAttributes set [0, (1 - damage player) * 100];
ExileClientPlayerAttributes set [1, (1 - getFatigue player) * 100];
ExileClientPlayerIsAbleToBreathe = isAbleToBreathe player;
ExileClientPlayerIsInfantry = (vehicle player) isEqualTo player;
ExileClientPlayerVelocity = player call BIS_fnc_absSpeed;
ExileClientPlayerIsBleeding = isBleeding player;
ExileClientPlayerIsBurning = isBurning player;
ExileClientPlayerIsOverburdened = ExileClientPlayerLoad > 900; 
ExileClientPlayerIsDrowning = ExileClientPlayerOxygen < 50;
ExileClientPlayerIsInjured = (ExileClientPlayerAttributes select 0) < 50;
ExileClientPlayerIsHungry = (ExileClientPlayerAttributes select 2) < 25;
ExileClientPlayerIsThirsty = (ExileClientPlayerAttributes select 3) < 25;
ExileClientPlayerIsExhausted = (ExileClientPlayerAttributes select 1) < 40;
ExileClientPlayerIsHungry call ExileClient_gui_hud_toggleHungerIcon;
ExileClientPlayerIsThirsty call ExileClient_gui_hud_toggleThirstIcon;
if (ExileClientIsAutoRunning) then
{
	call ExileClient_system_autoRun_update;
};
if (ExileClientPlayerIsInCombat) then
{
	if( diag_tickTime - ExileClientPlayerLastCombatAt >= 30 ) then
	{
		ExileClientPlayerIsInCombat = false;
		false call ExileClient_gui_hud_toggleCombatIcon;
		call ExileClient_system_rating_balance;		
	};
};
_hungerFactor = 1;
_thirstFactor = 1;
if (ExileClientPlayerIsInfantry) then 
{
	ExileClientPlayerVelocity = ExileClientPlayerVelocity min 24;
	if (ExileClientPlayerVelocity > 0) then 
	{
		_hungerFactor = 1 + ExileClientPlayerVelocity / 64 * _timeElapsed; 
		_thirstFactor = 1 + ExileClientPlayerVelocity / 48 * _timeElapsed; 
	};
}
else 
{
	if (ExileClientIsInBush) then 
	{
		call ExileClient_object_bush_detach;
	};
	if (ExileClientPlayerIsBambi) then 
	{
		if !((typeOf (vehicle player)) isEqualTo "Steerable_Parachute_F") then
		{
			call ExileClient_object_player_bambiStateEnd;
		};
	};
};
ExileClientPlayerAttributes set [2, ((((ExileClientPlayerAttributes select 2) - (100 / ExileClientHungerDecay * _hungerFactor * _timeElapsed)) min 100) max 0)];
ExileClientPlayerAttributes set [3, ((((ExileClientPlayerAttributes select 3) - (100 / ExileClientThirstDecay * _thirstFactor * _timeElapsed)) min 100) max 0)];
if ((ExileClientPlayerAttributes select 2) == 0 || (ExileClientPlayerAttributes select 3) == 0 || ExileClientPlayerIsBleeding) then
{
	ExileClientPlayerAttributes set [0, ((((ExileClientPlayerAttributes select 0) - ExileClientHealthDecay * _timeElapsed) min 100) max 0)];
};
_bloodAlcohol = (ExileClientPlayerAttributes select 4);
if (_bloodAlcohol > 0) then
{
	ExileClientPlayerAttributes set [1, linearConversion [0, 3, _bloodAlcohol, 100, 0, true]];
};
{
	_effectAttribute = _x select 0;
	_effectValue = _x select 1;
	_effectDuration = _x select 2;
	_effectStartTime = _x select 3;
	_effectValueRemaining = _x select 4;
	_endEffect = time - _effectStartTime >= _effectDuration; 
	if( _effectValue > 0 ) then 
	{
		if (_effectDuration == 0) then 
		{
			_effectToApply = _effectValue;
		}
		else 
		{
			_effectToApply = (_effectValue / _effectDuration * _timeElapsed) min _effectValueRemaining;
		};
		_x set [4, _effectValueRemaining - _effectToApply];
		ExileClientPlayerAttributes set [_effectAttribute, ((((ExileClientPlayerAttributes select _effectAttribute) + _effectToApply) min 100) max 0)];
	}
	else 
	{
		if (_effectDuration == 0) then 
		{
			_effectToApply = abs _effectValue;
		}
		else 
		{
			_effectToApply = ((abs _effectValue) / _effectDuration * _timeElapsed) max _effectValueRemaining;
		};
		_x set [4, _effectValueRemaining + _effectToApply];
		ExileClientPlayerAttributes set [_effectAttribute, (((ExileClientPlayerAttributes select _effectAttribute) - (abs _effectToApply) min 100) max 0)];
	};
	if( (ExileClientPlayerAttributes select _effectAttribute) == 0 || (ExileClientPlayerAttributes select _effectAttribute) == 100 ) then
	{
		_endEffect = true;
	};
	if( _endEffect ) then
	{
		ExileClientPlayerEffects deleteAt _forEachIndex;
	};
}
 foreach ExileClientPlayerEffects;
player setDamage (1 - (ExileClientPlayerAttributes select 0) / 100);
_hunger = ExileClientPlayerAttributes select 2;
_thirst = ExileClientPlayerAttributes select 3;
if (diag_tickTime - ExileClientPlayerLastHpRegenerationAt >= 60) then
{
	if (_hunger >= ExileClientHungerRegen) then
	{
		if (_thirst >= ExileClientThirstRegen) then
		{
			if (!(ExileClientPlayerIsInCombat) && !(ExileReborn_playerIsInfected)) then
			{
				_level = [ExileClientPlayerScore] call JohnO_fnc_getRespectTier;
				_level = _level / 100;
				player setDamage (((damage player) - ExileClientRecoveryAmmount - _level) max 0);
				if ((damage player > 0) && (alive player)) then
				{	
					["<t color='#00cc44' font='PuristaBold' size ='.6'>My wounds are healing</t>",(safezoneX + safezoneW) - 520 * pixelW - 60 * pixelW,(safezoneY + safezoneH) - 128 * pixelH - 60 * pixelH,5,1,0,789] spawn BIS_fnc_dynamicText;
				};	
				ExileClientPlayerLastHpRegenerationAt = diag_tickTime;
			};	
		};	
	};
};
if ("Exile_Headgear_GasMask" in (assignedItems player)) then 
{
	if !(ExileClientGasMaskVisible) then 
	{
		true call ExileClient_gui_gasMask_toggle;
	};
	if (alive player) then 
	{
		if (diag_tickTime >= ExileGasMaskNextSoundAt) then 
		{
			playSound format ["Exile_Sound_GasMaskBreathing0%1", 1 + (floor (random 2))];
			ExileGasMaskNextSoundAt = diag_tickTime + (2.2 + (random 1));
		};
	};
}
else 
{
	if (ExileClientGasMaskVisible) then 
	{
		false call ExileClient_gui_gasMask_toggle;
	};
};
_stopBleeding = player getVariable ["ExileReborn_clientBandaged",false];
if (_stopBleeding) then
{
	player setBleedingRemaining 0;
	player setVariable ["ExileReborn_clientBandaged",false];
};
_adjustBleeding = player getVariable ["ExileReborn_adjustBleedingTrue",false];
_amountToAdjust = player getVariable ["ExileReborn_adjustBleeding",0];

if (_adjustBleeding) then
{
	player setBleedingRemaining _amountToAdjust;
	player setVariable ["ExileReborn_adjustBleedingTrue",false];
};
ExileLastStatUpdate = diag_tickTime;
true