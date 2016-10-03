private ["_target"];

_zombie = _this select 0;
_positionEnd = _zombie getVariable ["ExileReborn_hoardEnd",-1];

if (_positionEnd isEqualTo -1) then
{
	_positionEnd = [] call JohnO_fnc_findSafeTownPosition;
};	

_group = group _zombie;
_group setCombatMode "BLUE";
_group allowFleeing 0;
_group enableAttack false;

_x = 0.5 + random 1;
sleep _x;
if !(isnil "ryanzombiesglow") then {_zombie setface format ["%1_glowing",face _zombie];};

if (isnil "Ryanzombieslimit") then {Ryanzombieslimit = 10000};
if (isnil "Ryanzombieshealth") then {Ryanzombieshealth = 0.7};
if !(isnil "Ryanzombiesinvincible") then {_zombie allowdammage false};
if !(isnil "ryanzombiesdeletion") then {[_zombie] execVM "\ryanzombies\delzombies.sqf"};


if ((!isServer) and hasInterface) exitwith {};
_zombie setdammage Ryanzombieshealth;

if (isnil "Ryanzombiesdisableexplodingheads") then {_zombie addEventHandler ["HandleDamage",{_this call RZ_fnc_ZombieKilled; nil}];};
if (isnil "ryanzombiesdisablebleeding") then {_zombie addMPEventHandler ["MPHit", "(_this select 0) setBleedingRemaining 1"];};

_AttackArray = ["ryanzombies\sounds\attack1.ogg", "ryanzombies\sounds\attack2.ogg", "ryanzombies\sounds\attack3.ogg", "ryanzombies\sounds\attack4.ogg", "ryanzombies\sounds\attack5.ogg"];
_JumpArray = ["ryanzombies\sounds\jump1.ogg", "ryanzombies\sounds\jump2.ogg", "ryanzombies\sounds\jump3.ogg", "ryanzombies\sounds\jump4.ogg", "ryanzombies\sounds\jump5.ogg", "ryanzombies\sounds\jump6.ogg"];
_CrawlerHitArray = ["ryanzombies\sounds\crawler_hit1.ogg", "ryanzombies\sounds\crawler_hit2.ogg"];
_EatingArray = ["ryanzombies\sounds\eat1.ogg", "ryanzombies\sounds\eat2.ogg", "ryanzombies\sounds\eat3.ogg", "ryanzombies\sounds\eat4.ogg", "ryanzombies\sounds\eat5.ogg"];

_ThrowArray = ["ryanzombies\sounds\vehicle_throw1.ogg", "ryanzombies\sounds\vehicle_throw2.ogg"];
_VehicleHitArray = ["ryanzombies\sounds\vehicle_hit1.ogg", "ryanzombies\sounds\vehicle_hit2.ogg", "ryanzombies\sounds\vehicle_hit3.ogg", "ryanzombies\sounds\vehicle_hit4.ogg"];
_ScreamArray = ["ryanzombiesscream1", "ryanzombiesscream2", "ryanzombiesscream3", "ryanzombiesscream4", "ryanzombiesscream5", "ryanzombiesscream6", "ryanzombiesscream7", "ryanzombiesscream8", "ryanzombiesscream9"];

_AggressiveArray = ["ryanzombies\sounds\aggressive1.ogg", "ryanzombies\sounds\aggressive2.ogg", "ryanzombies\sounds\aggressive3.ogg", "ryanzombies\sounds\aggressive4.ogg", "ryanzombies\sounds\aggressive5.ogg", "ryanzombies\sounds\aggressive6.ogg", "ryanzombies\sounds\aggressive7.ogg", "ryanzombies\sounds\aggressive8.ogg", "ryanzombies\sounds\aggressive9.ogg", "ryanzombies\sounds\aggressive10.ogg", "ryanzombies\sounds\aggressive11.ogg", "ryanzombies\sounds\aggressive12.ogg", "ryanzombies\sounds\aggressive13.ogg", "ryanzombies\sounds\aggressive14.ogg", "ryanzombies\sounds\aggressive15.ogg", "ryanzombies\sounds\aggressive16.ogg", "ryanzombies\sounds\aggressive17.ogg", "ryanzombies\sounds\aggressive18.ogg", "ryanzombies\sounds\aggressive19.ogg", "ryanzombies\sounds\aggressive20.ogg", "ryanzombies\sounds\aggressive21.ogg", "ryanzombies\sounds\aggressive22.ogg", "ryanzombies\sounds\aggressive23.ogg", "ryanzombies\sounds\aggressive24.ogg", "ryanzombies\sounds\aggressive25.ogg", "ryanzombies\sounds\aggressive26.ogg", "ryanzombies\sounds\aggressive27.ogg", "ryanzombies\sounds\aggressive28.ogg", "ryanzombies\sounds\aggressive29.ogg", "ryanzombies\sounds\aggressive30.ogg", "ryanzombies\sounds\aggressive31.ogg", "ryanzombies\sounds\aggressive32.ogg", "ryanzombies\sounds\aggressive33.ogg", "ryanzombies\sounds\aggressive34.ogg", "ryanzombies\sounds\aggressive35.ogg", "ryanzombies\sounds\aggressive36.ogg", "ryanzombies\sounds\aggressive37.ogg", "ryanzombies\sounds\aggressive38.ogg", "ryanzombies\sounds\aggressive39.ogg", "ryanzombies\sounds\aggressive40.ogg", "ryanzombies\sounds\aggressive41.ogg", "ryanzombies\sounds\aggressive42.ogg", "ryanzombies\sounds\aggressive43.ogg", "ryanzombies\sounds\aggressive44.ogg", "ryanzombies\sounds\aggressive45.ogg", "ryanzombies\sounds\aggressive46.ogg", "ryanzombies\sounds\aggressive47.ogg", "ryanzombies\sounds\aggressive48.ogg", "ryanzombies\sounds\aggressive49.ogg", "ryanzombies\sounds\aggressive50.ogg", "ryanzombies\sounds\aggressive51.ogg", "ryanzombies\sounds\aggressive52.ogg", "ryanzombies\sounds\aggressive53.ogg", "ryanzombies\sounds\aggressive54.ogg", "ryanzombies\sounds\aggressive55.ogg", "ryanzombies\sounds\aggressive56.ogg", "ryanzombies\sounds\aggressive57.ogg", "ryanzombies\sounds\aggressive58.ogg", "ryanzombies\sounds\aggressive59.ogg", "ryanzombies\sounds\aggressive60.ogg", "ryanzombies\sounds\aggressive61.ogg", "ryanzombies\sounds\aggressive62.ogg", "ryanzombies\sounds\aggressive63.ogg", "ryanzombies\sounds\aggressive64.ogg", "ryanzombies\sounds\aggressive65.ogg", "ryanzombies\sounds\aggressive66.ogg", "ryanzombies\sounds\aggressive67.ogg", "ryanzombies\sounds\aggressive68.ogg", "ryanzombies\sounds\aggressive69.ogg", "ryanzombies\sounds\aggressive70.ogg", "ryanzombies\sounds\aggressive71.ogg", "ryanzombies\sounds\aggressive72.ogg", "ryanzombies\sounds\aggressive73.ogg", "ryanzombies\sounds\aggressive74.ogg", "ryanzombies\sounds\aggressive75.ogg", "ryanzombies\sounds\aggressive76.ogg", "ryanzombies\sounds\aggressive77.ogg", "ryanzombies\sounds\aggressive78.ogg", "ryanzombies\sounds\aggressive79.ogg", "ryanzombies\sounds\aggressive80.ogg"];
_MoanArray = ["ryanzombiesmoan1","ryanzombiesmoan2","ryanzombiesmoan3","ryanzombiesmoan4","ryanzombiesmoan5","ryanzombiesmoan6","ryanzombiesmoan7"];

_sound = random 5;
_soundpitch = 0.925 + random 0.15;

_civilian = [];
_target = [];
_class = getText (configFile >> "CfgVehicles" >> (typeof _zombie) >> "vehicleClass");
if (_class == "Ryanzombiesspider") then {_AggressiveArray = ["ryanzombies\sounds\aggressive_spider1.ogg", "ryanzombies\sounds\aggressive_spider2.ogg", "ryanzombies\sounds\aggressive_spider3.ogg", "ryanzombies\sounds\aggressive_spider4.ogg", "ryanzombies\sounds\aggressive_spider5.ogg", "ryanzombies\sounds\aggressive_spider6.ogg", "ryanzombies\sounds\aggressive_spider7.ogg", "ryanzombies\sounds\aggressive_spider8.ogg", "ryanzombies\sounds\aggressive_spider9.ogg", "ryanzombies\sounds\aggressive_spider10.ogg", "ryanzombies\sounds\aggressive_spider11.ogg", "ryanzombies\sounds\aggressive_spider12.ogg", "ryanzombies\sounds\aggressive_spider13.ogg", "ryanzombies\sounds\aggressive_spider14.ogg", "ryanzombies\sounds\aggressive_spider15.ogg", "ryanzombies\sounds\aggressive_spider16.ogg", "ryanzombies\sounds\aggressive_spider17.ogg", "ryanzombies\sounds\aggressive_spider18.ogg", "ryanzombies\sounds\aggressive_spider19.ogg", "ryanzombies\sounds\aggressive_spider20.ogg", "ryanzombies\sounds\aggressive_spider21.ogg", "ryanzombies\sounds\aggressive_spider22.ogg", "ryanzombies\sounds\aggressive_spider23.ogg", "ryanzombies\sounds\aggressive_spider24.ogg", "ryanzombies\sounds\aggressive_spider25.ogg", "ryanzombies\sounds\aggressive_spider26.ogg", "ryanzombies\sounds\aggressive_spider27.ogg", "ryanzombies\sounds\aggressive_spider28.ogg", "ryanzombies\sounds\aggressive_spider29.ogg", "ryanzombies\sounds\aggressive_spider30.ogg", "ryanzombies\sounds\aggressive_spider31.ogg", "ryanzombies\sounds\aggressive_spider32.ogg", "ryanzombies\sounds\aggressive_spider33.ogg", "ryanzombies\sounds\aggressive_spider34.ogg", "ryanzombies\sounds\aggressive_spider35.ogg", "ryanzombies\sounds\aggressive_spider36.ogg", "ryanzombies\sounds\aggressive_spider37.ogg", "ryanzombies\sounds\aggressive_spider38.ogg", "ryanzombies\sounds\aggressive_spider39.ogg", "ryanzombies\sounds\aggressive_spider40.ogg"];};
if (_class == "Ryanzombiescrawler") then {_AggressiveArray = ["ryanzombies\sounds\aggressive_crawler1.ogg", "ryanzombies\sounds\aggressive_crawler2.ogg", "ryanzombies\sounds\aggressive_crawler3.ogg", "ryanzombies\sounds\aggressive_crawler4.ogg", "ryanzombies\sounds\aggressive_crawler5.ogg", "ryanzombies\sounds\aggressive_crawler6.ogg", "ryanzombies\sounds\aggressive_crawler7.ogg", "ryanzombies\sounds\aggressive_crawler8.ogg", "ryanzombies\sounds\aggressive_crawler9.ogg", "ryanzombies\sounds\aggressive_crawler10.ogg", "ryanzombies\sounds\aggressive_crawler11.ogg", "ryanzombies\sounds\aggressive_crawler12.ogg", "ryanzombies\sounds\aggressive_crawler13.ogg", "ryanzombies\sounds\aggressive_crawler14.ogg", "ryanzombies\sounds\aggressive_crawler15.ogg", "ryanzombies\sounds\aggressive_crawler16.ogg", "ryanzombies\sounds\aggressive_crawler17.ogg", "ryanzombies\sounds\aggressive_crawler18.ogg", "ryanzombies\sounds\aggressive_crawler19.ogg", "ryanzombies\sounds\aggressive_crawler20.ogg", "ryanzombies\sounds\aggressive_crawler21.ogg", "ryanzombies\sounds\aggressive_crawler22.ogg", "ryanzombies\sounds\aggressive_crawler23.ogg", "ryanzombies\sounds\aggressive_crawler24.ogg"]; _AttackArray = ["ryanzombies\sounds\attack_crawler1.ogg", "ryanzombies\sounds\attack_crawler2.ogg"]};

if ((_class == "Ryanzombiesslow") && !(isnil "ryanzombiesmovementspeedslow")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedslow;};
if ((_class == "Ryanzombiesmedium") && !(isnil "ryanzombiesmovementspeedmedium")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedmedium;};
if ((_class == "Ryanzombiesfast") && !(isnil "ryanzombiesmovementspeedfast")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedfast;};
if ((_class == "Ryanzombiesspider") && !(isnil "ryanzombiesmovementspeedspider")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedspider;};
if ((_class == "Ryanzombiescrawler") && !(isnil "ryanzombiesmovementspeedcrawler")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedcrawler;};
if ((_class == "Ryanzombieswalker") && !(isnil "ryanzombiesmovementspeedwalker")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedwalker;};

_timeToDormant = 30;
_lastTargetCheck = time;
_zombieIsDormant = false;

scopename "start";
while {true} do
{
	scopename "loop";
	if !((_zombie getVariable ["ExileReborn_zombie_hardTarget",-1]) isEqualTo -1) exitWith {};
	if (_zombieIsDormant) exitWith 
	{
		if !(local _zombie) then {[_zombie, _positionEnd] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"]} else {_zombie domove _positionEnd};
		Event_IdleZombieArray pushBack _zombie;
	};	
	if !(alive _zombie) exitwith
	{
		/*
		if (isnull _zombie) exitwith
		{
			remoteExecCall ["fnc_RyanZombies_RemoveGroups", owner _zombie];
		};
		_newgroup = creategroup civilian;
		[_zombie] join _newgroup;
		
		_face = face _zombie;
		if (_face find "Glowing" != 0) then 
		{
			_ngface = (_face splitstring "_") select 0;
			[_zombie, _ngface] remoteExecCall ["setFace"];
		};
		*/
		sleep 60;
		//remoteExecCall ["fnc_RyanZombies_RemoveGroups", owner _zombie];
		
	};

	if (isnil "ryanzombiesdisablemoaning") then {_Moan = selectRandom _MoanArray; [_zombie, format ["%1",_Moan]] remoteExecCall ["say3d"];};

	if !(local _zombie) then {[_zombie, _positionEnd] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"]} else {_zombie domove _positionEnd};
	
	_a = 0;
	_b = 5 + random 3;
	while {true} do
	{
		scopename "findtarget";
		while {true} do
		{
			if !(alive _zombie) then {breakTo "loop"};	
			if !((_zombie getVariable ["ExileReborn_zombie_hardTarget",-1]) isEqualTo -1) then {breakTo "loop"};
			if (time - _timeToDormant >= _lastTargetCheck) then	{_zombieIsDormant = true; /*hint "Breaking to loop";*/ breakTo "loop";};
			_target = [_zombie] call JohnO_fnc_findZombieTarget; // New function not in use.
			if (isNil "_target") then
			{
				_target = [];
			};	
			if !(_target isEqualTo []) then
			{
				_lastTargetCheck = time;

				if (((getPosATL _target select 2) > 20) AND (_target iskindof "AIR")) exitwith {sleep 2};
				if (animationState _zombie == "UNCONSCIOUS") exitwith {sleep 2};
				if (_zombie distance _target > Ryanzombieslimit) exitwith {sleep 2};
				if !(local _zombie) then {[_zombie, getposATL _target] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"]} else {_zombie domove getposATL _target};
				if (surfaceIsWater getposATL _target) then {[_zombie, "AmovPercMwlkSnonWnonDf"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"]};
				_zombie dowatch _target;

				if ((vehicle _target iskindof "man") && _zombie distance _target < Ryanzombiesattackdistance) then
				{
					_zombie setdir (_zombie getDir _target);
					[_zombie, "AwopPercMstpSgthWnonDnon_throw"] remoteExecCall ["fnc_RyanZombies_SwitchMove"];

					_Attack = selectRandom _AttackArray;
					playsound3d [format ["%1",_Attack], _zombie, false, getPosASL _zombie, 1, _soundpitch];

					_target allowfleeing 1;
					sleep 0.3;
					if (_zombie distance _target < Ryanzombiesattackdistance && (alive _target) && (alive _zombie)) then
					{
						if (_class == "Ryanzombiescrawler") then {_CrawlerHit = selectRandom _CrawlerHitArray; playsound3d [format ["%1",_CrawlerHit], _target, false, getPosASL _target, 1, _soundpitch]} else {playsound3d ["ryanzombies\sounds\zombie_bite.ogg", _target, false, getPosASL _target, 1, _soundpitch]};
						if (random 1 > 0.6) then
						{	
							_target setVariable ["ExileReborn_playerIsInfected",true,true];
						};	
						if (isnil "ryanzombiesdisablebleeding") then {[_target, 10] remoteExecCall ["fnc_RyanZombies_Bleeding"];};
						_target setdamage (damage _target + Ryanzombiesdamage);

						_Scream = selectRandom _ScreamArray;
						[_target, format ["%1",_Scream]] remoteExecCall ["say3d"];

						_vel = velocity _target;
						_dir = direction _zombie;
						[_target, [(_vel select 0) + (sin _dir * Ryanzombiesattackstrenth), (_vel select 1) + (cos _dir * Ryanzombiesattackstrenth), (_vel select 2) + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity"];
					};
					sleep Ryanzombiesattackspeed;
					if ((alive _target) OR (isnil "Ryanzombiesfeed")) then {breakTo "findtarget";};
				};

				if (_class != "Ryanzombiescrawler") then
				{
					if ((_sound == 0) && (isnil "ryanzombiesdisableaggressive")) then {_Aggressive = selectRandom _AggressiveArray; playsound3d [format ["%1",_Aggressive], _zombie, false, getPosASL _zombie, 1, _soundpitch];};
					_sound = _sound + 1;
					if (_sound >= 5) then {_sound = 0};
				}
				else
				{
					if (speed _zombie != 0) then
					{
						if (_sound == 0) then {_Aggressive = selectRandom _AggressiveArray; playsound3d [format ["%1",_Aggressive], _zombie, false, getPosASL _zombie, 1, _soundpitch];};
						_sound = _sound + 1;
						if (_sound >= 2) then {_sound = 0};
					};
				};

				if ((_target iskindof "car") && _zombie distance _target < 7) then
				{
					_zombie setdir (_zombie getDir _target);
					[_zombie, "AwopPercMstpSgthWnonDnon_throw"] remoteExecCall ["fnc_RyanZombies_SwitchMove"];

					_pos = getposATL _target;
					_dir = ((_pos select 0) - (getpos _zombie select 0)) atan2 ((_pos select 1) - (getpos _zombie select 1));
					//if (speed _target < 5) then {_zombie setpos [(_pos select 0) - 4*sin _dir, (_pos select 1) - 4*cos _dir]};

					_Attack = selectRandom _AttackArray;
					playsound3d [format ["%1",_Attack], _zombie, false, getPosASL _zombie, 1, _soundpitch];

					_target allowfleeing 1;
					sleep 0.3;
					if (_zombie distance _target < 7 && (alive _zombie)) then
					{
						_count = count (getAllHitPointsDamage _target select 0);
						_index = 0;
						_damage = random Ryanzombiesdamagecar;

						while {_count > _index} do
						{
							if ((getAllHitPointsDamage _target select 0) select _index != "HitFuel") then {[_target, [_index,(_target getHitIndex _index)+_damage]] remoteExecCall ["fnc_RyanZombies_SetHitIndex"]};
							_index = _index + 1;
						};

						if ((getnumber (configfile >> "CfgVehicles" >> typeof _target >> "armor")) < 90) then {if !(canmove _target) then {{if (random 10 < 1) then {_Scream = selectRandom _ScreamArray; [_x, format ["%1",_Scream]] remoteExecCall ["say3d"]}} foreach crew _target; if (isClass(configFile >> "CfgPatches" >> "ace_medical")) then {{[_x,'vehNormal'] execVM "\ryanzombies\acedamage.sqf"} foreach crew _target} else {{_x setdamage (damage _x + Ryanzombiesdamage/25)} foreach crew _target};};};

						_VehicleHit = selectRandom _VehicleHitArray;
						playsound3d [format ["%1",_VehicleHit], _target, false, getPosASL _target, 1, _soundpitch];

						_vel = velocity _target;
						_dir = direction _zombie;
						[_target, [(_vel select 0) + (sin _dir * Ryanzombiesdamagecarstrenth), (_vel select 1) + (cos _dir * Ryanzombiesdamagecarstrenth), (_vel select 2) + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity"];
					};
					sleep Ryanzombiesattackspeed;
				};

				_x = (0.5 + ((_zombie distance _target)/50)) min 4;
				sleep _x;
				
				breakTo "findtarget";
			};

			if (alive _zombie) then {_a = _a + 1; sleep 1;};
			if (_a > _b) then {breakTo "loop"};
		};
	};
};