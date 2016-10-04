private ["_timeToClearInfection","_healthPerTick","_sitting","_isSitting","_timer","_failSafe","_fireNearby","_sittingAnims"];

if (isNil "ExileReborn_playerIsResting") then
{
	ExileReborn_playerIsResting = false;
};	

_sittingAnims = ["amovpsitmstpslowwrfldnon","amovpsitmstpsnonwnondnon_ground","amovpsitmstpsnonwnondnon_ground"];

_timeToClearInfection = 30;
_healthPerTick = 0.01;

_sitting = false;
_isSitting = false;
_fireNearby = [player, 4] call ExileClient_util_world_isFireInRange;

_failSafe = 1000;
_timer = 0;

if (_fireNearby) then
{
	if ((stance player) isEqualTo "PRONE") then
	{	
		player switchMove "";
	};	
	player playActionNow "SitDown";
	waitUntil 
	{	
		if (animationState player in _sittingAnims)	then
		{
			_isSitting = true;
			_sitting = true;
		};
		_timer = _timer + 1;
		if (_timer > _failSafe) then
		{
			_isSitting = true;
		};	
		_isSitting	
	};

	if ((animationState player in _sittingAnims) && !(ExileReborn_playerIsResting)) then
	{	
		ExileReborn_playerIsResting = true;

		player setVariable ["ExileReborn_playerBegunResting",time];

		while {_sitting} do
		{
			if (ExileReborn_playerIsInfected) then
			{	
				_lastInfectionCheck = player getVariable ["ExileReborn_playerBegunResting",-1];

				if ((time - _timeToClearInfection >= _lastInfectionCheck) && (ExileReborn_infectionAmount > 0)) then
				{
					player setVariable ["ExileReborn_playerBegunResting",time];
					ExileReborn_infectionAmount = ExileReborn_infectionAmount - 1;

					systemChat "My infection is clearing up..";
				};
			};		

			player setDamage (damage player - _healthPerTick);

			if (animationState player in _sittingAnims) then
			{
				_sitting = true;
			}
			else
			{
				_sitting = false;
				ExileReborn_playerIsResting = false;
			};	
			uiSleep 2;

			if !(alive player) exitWith {ExileReborn_playerIsResting = false;};
		};
	}
	else
	{
		ExileReborn_playerIsResting = false;
		[
			"InfoTitleAndText", 
			["Already resting", "You are already resting"]
		] call ExileClient_gui_toaster_addTemplateToast;
	};
}
else
{
	ExileReborn_playerIsResting = false;
	[
		"InfoTitleAndText", 
		["You need fire!", "You require a lit fire nearby to do this"]
	] call ExileClient_gui_toaster_addTemplateToast;
};	