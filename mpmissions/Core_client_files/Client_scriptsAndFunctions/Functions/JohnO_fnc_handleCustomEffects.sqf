private ["_coughArray","_hunger","_thirst","_currentBodyTemperature","_idealTemp","_difference","_adjustment"];

_coughArray = ["cough1","cough2","cough3","cough4","cough5","cough6"];
_hunger = ExileClientPlayerAttributes select 2;
_thirst = ExileClientPlayerAttributes select 3;
_currentBodyTemperature = ExileClientPlayerAttributes select 5;

/** Adjust chance for infection if your core temp is lower than ideal **/

_idealTemp = 36.7;
_difference = 0;
_adjustment = 0;
if (_currentBodyTemperature < _idealTemp) then
{	
	_difference = _idealTemp - _currentBodyTemperature;
	_adjustment = (_difference * 10) + 10;
};

// To do.. adjust infection rate if your hungry / thirsy

if !(alive player) then
{
	ExileReborn_playerIsWounded = false;
	ExileReborn_woundWasTreated = false;	
	ExileReborn_infectionAmount = 0;
	ExileReborn_playerIsInfected = false;
	profileNamespace setVariable ["ExileReborn_playerIsWounded",ExileReborn_playerIsWounded];
	profileNamespace setVariable ["ExileReborn_woundWasTreated",ExileReborn_woundWasTreated];
	profileNamespace setVariable ["ExileReborn_infectionAmount",ExileReborn_infectionAmount];
	profileNamespace setVariable ["ExileReborn_playerIsInfected",ExileReborn_playerIsInfected];
	player enableStamina false;
	player allowSprint true;
	// EVR
	profileNamespace setVariable ["ExileReborn_resistanceToEVR",0];
	//Custom sound var 
	ExileRebornClient_soundIsPlaying = false;
};	

if (time - ExileReborn_woundCheckInterval >= ExileReborn_lastWoundUpdate) then
{	
	profileNamespace setVariable ["ExileReborn_playerIsWounded",ExileReborn_playerIsWounded];
	if (((ExileReborn_chanceForInfection + _adjustment) >= random 100) && !(ExileReborn_playerIsInfected) && (ExileReborn_playerIsWounded)) then
	{
		ExileReborn_playerIsInfected = true;
		profileNamespace setVariable ["ExileReborn_playerIsInfected",ExileReborn_playerIsInfected];
	};
	if (!(ExileReborn_playerIsInfected) && (ExileReborn_playerIsWounded)) then
	{
		systemChat "I am wounded.. I should clean my wounds..";
	};
	if (ExileReborn_playerIsInfected) then
	{	
		if (ExileReborn_woundWasTreated) then 																				
		{
			ExileReborn_infectionAmount = ExileReborn_infectionAmount - 1;
			profileNamespace setVariable ["ExileReborn_infectionAmount",ExileReborn_infectionAmount];
			profileNamespace setVariable ["ExileReborn_woundWasTreated",ExileReborn_woundWasTreated];

			systemChat "My infection will feel better soon.. my wounds are clean..";

			if (ExileReborn_infectionAmount <= 0) then
			{
				ExileReborn_playerIsWounded = false;
				ExileReborn_playerIsInfected = false;
				ExileReborn_woundWasTreated = false;
				profileNamespace setVariable ["ExileReborn_playerIsWounded",ExileReborn_playerIsWounded];
				profileNamespace setVariable ["ExileReborn_playerIsInfected",ExileReborn_playerIsInfected];
				profileNamespace setVariable ["ExileReborn_woundWasTreated",ExileReborn_woundWasTreated];
				systemChat "My wounds are healed";
				player enableStamina false;
				player allowSprint true;
			};	
		}
		else
		{
			ExileReborn_infectionAmount = ExileReborn_infectionAmount + 1;
			profileNamespace setVariable ["ExileReborn_infectionAmount",ExileReborn_infectionAmount];			
		};	
	};
		
	if ((ExileReborn_infectionAmount >= ExileReborn_stageOneInfection) && (ExileReborn_infectionAmount < ExileReborn_stageTwoInfection)) then
	{
		playSound (selectRandom _coughArray);
		player setDamage (damage player) + 0.01;
		if !(ExileReborn_woundWasTreated) then
		{
			systemChat "My wounds looking slightly infected..";
		};	
	};
	if ((ExileReborn_infectionAmount >= ExileReborn_stageTwoInfection) && (ExileReborn_infectionAmount < ExileReborn_stageThreeInfection)) then
	{
		playSound (selectRandom _coughArray);
		player setDamage (damage player) + 0.01;
		if !(ExileReborn_woundWasTreated) then
		{
			systemChat "My wounds are infected.. I need treatment..";
		};	
		enableCamShake true;
		addCamShake [5, 2, 30];
	};
	if (ExileReborn_infectionAmount >= ExileReborn_stageThreeInfection) then
	{
		playSound (selectRandom _coughArray);
		player setDamage (damage player) + 0.01;
		if !(ExileReborn_woundWasTreated) then
		{	
			systemChat "My wounds are badly infected..";
		};	
		enableCamShake true;
		addCamShake [5, 2, 30];
		[60] call BIS_fnc_bloodEffect;
		player enableStamina true;
		player allowSprint false;
	};

	ExileReborn_lastWoundUpdate = time;
};

// Heartbeat when low health

if (((damage player) >= 0.85) && (time - ExileReborn_heartBeatInterval >= ExileReborn_lastHeartBeat) && (alive player)) then
{
	playSound ["SndExileHeartbeatFast", true]; 
	ExileReborn_lastHeartBeat = time;
};	

if (time - ExileReborn_ProfileSaveInterval >= ExileReborn_lastWoundUpdate) then
{	
	saveProfileNamespace;
};