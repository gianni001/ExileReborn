scriptName "Zombie Brains";

_zombie = _this select 0;


_zombie setdammage 0.7;
_zombie setspeaker "NoVoice";
_zombie enableFatigue false;
_zombie setbehaviour "CARELESS";
_zombie setunitpos "UP";
_zombie setmimic "safe";

_facearray = ["RyanZombieFace1", "RyanZombieFace2", "RyanZombieFace3", "RyanZombieFace4", "RyanZombieFace5", "RyanZombieFace6"];
_face = selectRandom _facearray;
_zombie setface _face;
removegoggles _zombie;

_group = group _zombie;
_group setCombatMode "BLUE";
_group allowFleeing 0;
_group enableAttack false;

_x = 0.5 + random 1;
sleep _x;
if !(isnil "ryanzombiesglow") then {_zombie setface format ["%1_glowing",face _zombie];};

if !(isnil "ryanzombiesdisablescript") exitwith {};
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
_target = objnull;
_class = getText (configFile >> "CfgVehicles" >> (typeof _zombie) >> "vehicleClass");
if (_class == "Ryanzombiesspider") then {_AggressiveArray = ["ryanzombies\sounds\aggressive_spider1.ogg", "ryanzombies\sounds\aggressive_spider2.ogg", "ryanzombies\sounds\aggressive_spider3.ogg", "ryanzombies\sounds\aggressive_spider4.ogg", "ryanzombies\sounds\aggressive_spider5.ogg", "ryanzombies\sounds\aggressive_spider6.ogg", "ryanzombies\sounds\aggressive_spider7.ogg", "ryanzombies\sounds\aggressive_spider8.ogg", "ryanzombies\sounds\aggressive_spider9.ogg", "ryanzombies\sounds\aggressive_spider10.ogg", "ryanzombies\sounds\aggressive_spider11.ogg", "ryanzombies\sounds\aggressive_spider12.ogg", "ryanzombies\sounds\aggressive_spider13.ogg", "ryanzombies\sounds\aggressive_spider14.ogg", "ryanzombies\sounds\aggressive_spider15.ogg", "ryanzombies\sounds\aggressive_spider16.ogg", "ryanzombies\sounds\aggressive_spider17.ogg", "ryanzombies\sounds\aggressive_spider18.ogg", "ryanzombies\sounds\aggressive_spider19.ogg", "ryanzombies\sounds\aggressive_spider20.ogg", "ryanzombies\sounds\aggressive_spider21.ogg", "ryanzombies\sounds\aggressive_spider22.ogg", "ryanzombies\sounds\aggressive_spider23.ogg", "ryanzombies\sounds\aggressive_spider24.ogg", "ryanzombies\sounds\aggressive_spider25.ogg", "ryanzombies\sounds\aggressive_spider26.ogg", "ryanzombies\sounds\aggressive_spider27.ogg", "ryanzombies\sounds\aggressive_spider28.ogg", "ryanzombies\sounds\aggressive_spider29.ogg", "ryanzombies\sounds\aggressive_spider30.ogg", "ryanzombies\sounds\aggressive_spider31.ogg", "ryanzombies\sounds\aggressive_spider32.ogg", "ryanzombies\sounds\aggressive_spider33.ogg", "ryanzombies\sounds\aggressive_spider34.ogg", "ryanzombies\sounds\aggressive_spider35.ogg", "ryanzombies\sounds\aggressive_spider36.ogg", "ryanzombies\sounds\aggressive_spider37.ogg", "ryanzombies\sounds\aggressive_spider38.ogg", "ryanzombies\sounds\aggressive_spider39.ogg", "ryanzombies\sounds\aggressive_spider40.ogg"];};
if (_class == "Ryanzombiescrawler") then {_AggressiveArray = ["ryanzombies\sounds\aggressive_crawler1.ogg", "ryanzombies\sounds\aggressive_crawler2.ogg", "ryanzombies\sounds\aggressive_crawler3.ogg", "ryanzombies\sounds\aggressive_crawler4.ogg", "ryanzombies\sounds\aggressive_crawler5.ogg", "ryanzombies\sounds\aggressive_crawler6.ogg", "ryanzombies\sounds\aggressive_crawler7.ogg", "ryanzombies\sounds\aggressive_crawler8.ogg", "ryanzombies\sounds\aggressive_crawler9.ogg", "ryanzombies\sounds\aggressive_crawler10.ogg", "ryanzombies\sounds\aggressive_crawler11.ogg", "ryanzombies\sounds\aggressive_crawler12.ogg", "ryanzombies\sounds\aggressive_crawler13.ogg", "ryanzombies\sounds\aggressive_crawler14.ogg", "ryanzombies\sounds\aggressive_crawler15.ogg", "ryanzombies\sounds\aggressive_crawler16.ogg", "ryanzombies\sounds\aggressive_crawler17.ogg", "ryanzombies\sounds\aggressive_crawler18.ogg", "ryanzombies\sounds\aggressive_crawler19.ogg", "ryanzombies\sounds\aggressive_crawler20.ogg", "ryanzombies\sounds\aggressive_crawler21.ogg", "ryanzombies\sounds\aggressive_crawler22.ogg", "ryanzombies\sounds\aggressive_crawler23.ogg", "ryanzombies\sounds\aggressive_crawler24.ogg"]; _AttackArray = ["ryanzombies\sounds\attack_crawler1.ogg", "ryanzombies\sounds\attack_crawler2.ogg"]};

if ((_class == "Ryanzombiesslow") && !(isnil "ryanzombiesmovementspeedslow")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedslow;};
if ((_class == "Ryanzombiesmedium") && !(isnil "ryanzombiesmovementspeedmedium")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedmedium;};
if ((_class == "Ryanzombiesfast") && !(isnil "ryanzombiesmovementspeedfast")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedfast;};
if ((_class == "Ryanzombiesspider") && !(isnil "ryanzombiesmovementspeedspider")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedspider;};
if ((_class == "Ryanzombiescrawler") && !(isnil "ryanzombiesmovementspeedcrawler")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedcrawler;};
if ((_class == "Ryanzombieswalker") && !(isnil "ryanzombiesmovementspeedwalker")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedwalker;};


scopename "start";
while {true} do
{
	scopename "loop";
	if !(alive _zombie) exitwith
	{
		if (isnull _zombie) exitwith
		{
			remoteExecCall ["fnc_RyanZombies_RemoveGroups", owner _zombie];
		};
		_newgroup = creategroup civilian;
		[_zombie] join _newgroup;
		if !(isnull _target) then {if ((!(vehicle _target iskindof "man") && (speed _target > 20)) && (_zombie distance _target < 12.5)) then {_VehicleSplatArray = ["ryanzombies\sounds\vehicle_splat1.ogg", "ryanzombies\sounds\vehicle_splat2.ogg", "ryanzombies\sounds\vehicle_splat3.ogg"]; _VehicleSplat = selectRandom _VehicleSplatArray; playsound3d [format ["%1",_VehicleSplat], _zombie, false, getPosASL _zombie, 1, _soundpitch];};};
		_face = face _zombie;
		if (_face find "Glowing" != 0) then 
		{
			_ngface = (_face splitstring "_") select 0;
			[_zombie, _ngface] remoteExecCall ["setFace"];
		};
		if !(isnil "ryanzombiesAllLoot") then
		{
			if (_zombie iskindof "RyanZombieB_Soldier_base_F") then
			{
				_l = "GroundWeaponHolder" createvehicle getposATL _zombie;
				_l setposATL getposATL _zombie;
				if ((random 100 <= ryanzombiesitemschanceSoldier) && !(ryanzombiesitemsSoldier isEqualTo [])) then
				{
					_item = selectRandom ryanzombiesitemsSoldier;
					_itemAmount = (ryanzombiesitemsminSoldier + (round (random (ryanzombiesitemsmaxSoldier - ryanzombiesitemsminSoldier))));
					_l additemcargoglobal [_item,_itemAmount];
				};
				if ((random 100 <= ryanzombiesmagazineschanceSoldier) && !(ryanzombiesmagazinesSoldier isEqualTo [])) then
				{
					_magazine = selectRandom ryanzombiesmagazinesSoldier;
					_magazineAmount = (ryanzombiesmagazinesminSoldier + (round (random (ryanzombiesmagazinesmaxSoldier - ryanzombiesmagazinesminSoldier))));
					_l addmagazinecargoglobal [_magazine,_magazineAmount];
				};
				if ((random 100 <= ryanzombiesweaponschanceSoldier) && !(ryanzombiesweaponsSoldier isEqualTo [])) then
				{
					_weapon = selectRandom ryanzombiesweaponsSoldier;
					_weaponAmount = (ryanzombiesweaponsminSoldier + (round (random (ryanzombiesweaponsmaxSoldier - ryanzombiesweaponsminSoldier))));
					_l addweaponcargoglobal [_weapon,_weaponAmount];
				};
			}
			else
			{
				_l = "GroundWeaponHolder" createvehicle getposATL _zombie;
				_l setposATL getposATL _zombie;
				if ((random 100 <= ryanzombiesitemschance) && !(ryanzombiesitems isEqualTo [])) then
				{
					_item = selectRandom ryanzombiesitems;
					_itemAmount = (ryanzombiesitemsmin + (round (random (ryanzombiesitemsmax - ryanzombiesitemsmin))));
					_l additemcargoglobal [_item,_itemAmount];
				};
				if ((random 100 <= ryanzombiesmagazineschance) && !(ryanzombiesmagazines isEqualTo [])) then
				{
					_magazine = selectRandom ryanzombiesmagazines;
					_magazineAmount = (ryanzombiesmagazinesmin + (round (random (ryanzombiesmagazinesmax - ryanzombiesmagazinesmin))));
					_l addmagazinecargoglobal [_magazine,_magazineAmount];
				};
				if ((random 100 <= ryanzombiesweaponschance) && !(ryanzombiesweapons isEqualTo [])) then
				{
					_weapon = selectRandom ryanzombiesweapons;
					_weaponAmount = (ryanzombiesweaponsmin + (round (random (ryanzombiesweaponsmax - ryanzombiesweaponsmin))));
					_l addweaponcargoglobal [_weapon,_weaponAmount];
				};
			};
		};
		sleep 60;
		remoteExecCall ["fnc_RyanZombies_RemoveGroups", owner _zombie];
		if !(isnil "Ryanzombiesdelete") then {deletevehicle _zombie};
		if !(isnil "_l") then
		{
			sleep 3600;
			deletevehicle _l;
		};
	};

	_zombie setFormDir random 360;
	if (isnil "ryanzombiesdisablemoaning") then {_Moan = selectRandom _MoanArray; [_zombie, format ["%1",_Moan]] remoteExecCall ["say3d"];};
	if !(isnil "Ryanzombieslogicroam") then {if !(local _zombie) then {[_zombie, [(getposATL _zombie select 0) + random 15 - random 15, (getposATL _zombie select 1) + random 15 - random 15]] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"]} else {_zombie domove [(getposATL _zombie select 0) + random 15 - random 15, (getposATL _zombie select 1) + random 15 - random 15]};};
	if !(isnil "ryanzombieswaypoint") then {if !(local _zombie) then {[_zombie, [(getposATL ryanzombieslogicwaypoint select 0) + random 15 - random 15, (getposATL ryanzombieslogicwaypoint select 1) + random 15 - random 15]] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"]} else {_zombie domove [(getposATL ryanzombieslogicwaypoint select 0) + random 15 - random 15, (getposATL ryanzombieslogicwaypoint select 1) + random 15 - random 15]};};
	_a = 0;
	_b = 5 + random 3;

	while {true} do
	{
		scopename "findtarget";
		while {true} do
		{
			if !(alive _zombie) then {breakTo "loop"};
			if !(isnil "ryanzombiescivilianattacks") then {_civilian = nearestobjects [_zombie, ["CIVILIAN"], 100]; {if ((!(alive _x)) || _x getvariable ["ACE_isunconscious",false]) then {_civilian = _civilian - [_x]}} foreach _civilian};
			_target = (getPos _zombie nearEntities [['Exile_Unit_Player'],50]) select 0;
			if (count _civilian != 0) then
			{
				_civiliantarget = _civilian select 0;
				if (!(isnull _target) AND ((_target distance _zombie) < (_civiliantarget distance _zombie))) exitwith {};
				if (_zombie knowsabout _civiliantarget > 0.5) then {_target = _civiliantarget};
			};
			if !(_target isEqualTo []) then
			{
				if (((getPosATL _target select 2) > 20) AND (_target iskindof "AIR")) exitwith {sleep 2};
				if (animationState _zombie == "UNCONSCIOUS") exitwith {sleep 2};
				if (_zombie distance _target > Ryanzombieslimit) exitwith {sleep 2};
				if (!(vehicle _target iskindof "man") && (count crew _target == 0)) then
				{
					_grp = createGroup civilian;
					_unit = _grp createUnit ["C_Man_1", [0,0,0], [], 0, "CAN_COLLIDE"];
					_unit hideObjectGlobal true;
					_unit disableAI "ANIM";
					_unit moveindriver _target;
					sleep 0.5;
					deletevehicle _unit;
					deletegroup _grp;
				};

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

						if (isnil "ryanzombiesdisablebleeding") then {[_target, 10] remoteExecCall ["fnc_RyanZombies_Bleeding"];};
						if (isClass(configFile >> "CfgPatches" >> "ace_medical")) then {[_target,'manNormal'] execVM "\ryanzombies\acedamage.sqf"} else {_target setdamage (damage _target + Ryanzombiesdamage)};
						if (!(alive _target) && !(isnil "Ryanzombiesinfection")) then {[_target, side _group] execVM "\ryanzombies\infection.sqf"};
						if ((alive _target) && !(isnil "ryanzombiesinfectedchance") && (_target getvariable ["ryanzombiesinfected",0] == 0)) then {[_target, side _group] execVM "\ryanzombies\infected.sqf"};

						_Scream = selectRandom _ScreamArray;
						[_target, format ["%1",_Scream]] remoteExecCall ["say3d"];

						_vel = velocity _target;
						_dir = direction _zombie;
						[_target, [(_vel select 0) + (sin _dir * Ryanzombiesattackstrenth), (_vel select 1) + (cos _dir * Ryanzombiesattackstrenth), (_vel select 2) + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity"];
					};
					sleep Ryanzombiesattackspeed;
					if ((alive _target) OR (isnil "Ryanzombiesfeed")) then {breakTo "findtarget";};
				};

				if ((vehicle _target iskindof "car") && _zombie distance _target < 7) then
				{
					_zombie setdir (_zombie getDir _target);
					[_zombie, "AwopPercMstpSgthWnonDnon_throw"] remoteExecCall ["fnc_RyanZombies_SwitchMove"];

					_pos = getposATL _target;
					_dir = ((_pos select 0) - (getpos _zombie select 0)) atan2 ((_pos select 1) - (getpos _zombie select 1));
					if (speed _target < 5) then {_zombie setpos [(_pos select 0) - 4*sin _dir, (_pos select 1) - 4*cos _dir]};

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
					breakTo "findtarget";
				};

				if ((vehicle _target iskindof "tank") && _zombie distance _target < 8) then
				{
					_zombie setdir (_zombie getDir _target);
					[_zombie, "AwopPercMstpSgthWnonDnon_throw"] remoteExecCall ["fnc_RyanZombies_SwitchMove"];

					_pos = getposATL _target;
					_dir = ((_pos select 0) - (getpos _zombie select 0)) atan2 ((_pos select 1) - (getpos _zombie select 1));
					if (speed _target < 5) then {_zombie setpos [(_pos select 0) - 4*sin _dir, (_pos select 1) - 4*cos _dir]};

					_Attack = selectRandom _AttackArray;
					playsound3d [format ["%1",_Attack], _zombie, false, getPosASL _zombie, 1, _soundpitch];

					_target allowfleeing 1;
					sleep 0.3;
					if (_zombie distance _target < 8 && (alive _zombie)) then
					{
						_count = count (getAllHitPointsDamage _target select 0);
						_index = 0;
						_damage = random Ryanzombiesdamagetank;

						while {_count > _index} do
						{
							if ((getAllHitPointsDamage _target select 0) select _index != "HitHull") then {[_target, [_index,(_target getHitIndex _index)+_damage]] remoteExecCall ["fnc_RyanZombies_SetHitIndex"]};
							_index = _index + 1;
						};

						_VehicleHit = selectRandom _VehicleHitArray;
						playsound3d [format ["%1",_VehicleHit], _target, false, getPosASL _target, 1, _soundpitch];

						_vel = velocity _target;
						_dir = direction _zombie;
						[_target, [(_vel select 0) + (sin _dir * Ryanzombiesdamagetankstrenth), (_vel select 1) + (cos _dir * Ryanzombiesdamagetankstrenth), (_vel select 2) + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity"];
					};
					sleep Ryanzombiesattackspeed;
					breakTo "findtarget";
				};

				if ((vehicle _target iskindof "air") && (_zombie distance _target < 10) && ((getPosATL _target select 2) < 1.8)) then
				{
					_zombie setdir (_zombie getDir _target);
					[_zombie, "AwopPercMstpSgthWnonDnon_throw"] remoteExecCall ["fnc_RyanZombies_SwitchMove"];

					_pos = getposATL _target;
					_dir = ((_pos select 0) - (getpos _zombie select 0)) atan2 ((_pos select 1) - (getpos _zombie select 1));
					_zombie setpos [(_pos select 0) - 4*sin _dir, (_pos select 1) - 4*cos _dir];

					_Attack = selectRandom _AttackArray;
					playsound3d [format ["%1",_Attack], _zombie, false, getPosASL _zombie, 1, _soundpitch];
					sleep 0.3;
					if (_zombie distance _target < 10 && (alive _zombie)) then
					{
						_target setdamage (damage _target + Ryanzombiesdamageair);

						_VehicleHit = selectRandom _VehicleHitArray;
						playsound3d [format ["%1",_VehicleHit], _target, false, getPosASL _target, 1, _soundpitch];

						_vel = velocity _target;
						_dir = direction _zombie;
						[_target, [(_vel select 0) + (sin _dir * Ryanzombiesdamageairstrenth), (_vel select 1) + (cos _dir * Ryanzombiesdamageairstrenth), (_vel select 2) + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity"];
					};
					sleep Ryanzombiesattackspeed;
					breakTo "findtarget";
				};

				if ((vehicle _target iskindof "staticweapon" OR vehicle _target iskindof "ship") && _zombie distance _target < 4.5) then
				{
					_zombie setdir (_zombie getDir _target);
					[_zombie, "AwopPercMstpSgthWnonDnon_throw"] remoteExecCall ["fnc_RyanZombies_SwitchMove"];

					_pos = getposATL _target;
					_dir = ((_pos select 0) - (getpos _zombie select 0)) atan2 ((_pos select 1) - (getpos _zombie select 1));
					_zombie setpos [(_pos select 0) - 2*sin _dir, (_pos select 1) - 2*cos _dir];

					_Attack = selectRandom _AttackArray;
					playsound3d [format ["%1",_Attack], _zombie, false, getPosASL _zombie, 1, _soundpitch];
					sleep 0.3;
					if (_zombie distance _target < 4.5 && (alive _zombie)) then
					{
						if (vehicle _target iskindof "staticweapon") then {_target setdamage (damage _target + Ryanzombiesdamage/2)};
						if (vehicle _target iskindof "ship") then {_target setdamage (damage _target + Ryanzombiesdamagecar)};

						playsound3d ["ryanzombies\sounds\zombie_bite.ogg", _target, false, getPosASL _target, 1, _soundpitch];

						_vel = velocity _target;
						_dir = direction _zombie;
						[_target, [(_vel select 0) + (sin _dir * Ryanzombiesattackstrenth), (_vel select 1) + (cos _dir * Ryanzombiesattackstrenth), (_vel select 2) + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity"];
					};
					sleep Ryanzombiesattackspeed;
					breakTo "findtarget";
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

				_x = (0.5 + ((_zombie distance _target)/50)) min 4;
				sleep _x;

				if (!(alive _target) && !(isnil "Ryanzombiesfeed") && (vehicle _target iskindof "man")) then
				{
					_c = 0;
					_d = 25 + random 25;
					if !(isnil "ryanzombiesinfectiontimer") then {_d = ryanzombiesinfectiontimer - 3};
					_e = 0;
					while {(_zombie distance _target < 80) && (alive _zombie)} do
					{
						_newtarget = (getPos _zombie nearEntities [['Exile_Unit_Player'],50]) select 0;
						if ((!(isnull _newtarget) && (_zombie distance _newtarget < _zombie distance _target)) OR (_zombie distance _newtarget < 20) OR (_c > _d)) then {breakTo "findtarget"};
						if !(isnil "ryanzombiesinfectiontimer") then {_c = _c + 1};
						if ((_e == 0) OR (_e == 5) OR (_e == 10) OR (_e == 15) OR (_e == 20) OR (_e == 25)) then {if !(local _zombie) then {[_zombie, getposATL _target] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"]} else {_zombie domove getposATL _target};};
						sleep 1;

						_e = _e + 1;
						if (_e > 30) then {breakTo "findtarget"};
						_damage = damage _zombie;
						if ((_zombie distance _target < 3) && (_c < _d)) then
						{
							_zombie disableAI "ANIM";
							_zombie setdir (_zombie getDir _target);
							[_zombie, "AinvPercMstpSnonWnonDnon"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"];
							sleep 1;
							while {alive _zombie} do
							{
								if (random 2 < 1) then {_Eating = selectRandom _EatingArray; playsound3d [format ["%1",_Eating], _zombie, false, getPosASL _zombie, 1, _soundpitch];};
								_target = (getPos _zombie nearEntities [['Exile_Unit_Player'],50]) select 0;
								sleep 1;
								_c = _c + 1;
								if ((_c > _d) OR (!(isnull _target) && (_zombie distance _target < 20)) OR (_damage != damage _zombie)) exitwith
								{
									_zombie enableAI "ANIM";
									[_zombie, "AinvPercMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"];
									breakTo "findtarget";
								};
							};
						};
					};
				};

				if (!(isnil "Ryanzombiescanthrow") && (alive _zombie)) then
				{
					_objectcar = nearestObject [_zombie, "car"]; 
					if ((_objectcar iskindof "car") && (random 7 < 1)) then
					{
						while {(_objectcar distance _target < Ryanzombiescanthrowdistance) && (_zombie distance _objectcar < _zombie distance _target) && (_objectcar distance _target < _zombie distance _target)} do
						{
							if !(alive _zombie) then {breakTo "loop"};
							_target = (getPos _zombie nearEntities [['Exile_Unit_Player'],50]) select 0;
							if (isnull _target) then {breakTo "findtarget";};

							if (_zombie distance _objectcar < 7) then
							{
								[_zombie, "AwopPercMstpSgthWnonDnon_throw"] remoteExecCall ["fnc_RyanZombies_SwitchMove"];
								_zombie setdir (_zombie getDir _objectcar);

								_pos = getposATL _objectcar;
								_dir = ((_pos select 0) - (getpos _zombie select 0)) atan2 ((_pos select 1) - (getpos _zombie select 1));
								_zombie setpos [(_pos select 0) - 4*sin _dir, (_pos select 1) - 4*cos _dir];

								_Attack = selectRandom _AttackArray;
								playsound3d [format ["%1",_Attack], _zombie, false, getPosASL _zombie, 1, _soundpitch];
								sleep 0.3;
								if !(alive _zombie) then {breakTo "loop"};
								_speed = 20 + random 25;
								_dir = ((getpos _target select 0) - (getpos _objectcar select 0)) atan2 ((getpos _target select 1) - (getpos _objectcar select 1));
								_range = _objectcar distance _target;

								if (isnil "Ryanzombiescanthrowstrength") then
								{
									[_objectcar, [_speed * (sin _dir), _speed * (cos _dir), 5 * (_range / _speed)]] remoteExecCall ["fnc_RyanZombies_Velocity"];
								} else
								{
									if (Ryanzombiescanthrowstrength == 1) exitwith {[_objectcar, [(_speed * (sin _dir))/1.5, (_speed * (cos _dir))/1.5, 3.5 * (_range / _speed)]] remoteExecCall ["fnc_RyanZombies_Velocity"];};
									if (Ryanzombiescanthrowstrength == 2) exitwith {[_objectcar, [(_speed * (sin _dir))/2, (_speed * (cos _dir))/2, 2.5 * (_range / _speed)]] remoteExecCall ["fnc_RyanZombies_Velocity"];};
									if (Ryanzombiescanthrowstrength == 3) exitwith {[_objectcar, [(_speed * (sin _dir))/2.5, (_speed * (cos _dir))/2.5, 1.5 * (_range / _speed)]] remoteExecCall ["fnc_RyanZombies_Velocity"];};
									if (Ryanzombiescanthrowstrength == 4) exitwith {[_objectcar, [(_speed * (sin _dir))*5, (_speed * (cos _dir))*5, (_range / _speed)]] remoteExecCall ["fnc_RyanZombies_Velocity"];};
								};

								_Throw = selectRandom _ThrowArray;
								playsound3d [format ["%1",_Throw], _objectcar, false, getPosASL _objectcar, 1, _soundpitch];

								_objectcar setfuel 0;
								[_objectcar] execVM "\ryanzombies\carland.sqf";
								sleep Ryanzombiesattackspeed;
								breakTo "findtarget";
							};
							if !(local _zombie) then {[_zombie, getposATL _objectcar] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"]} else {_zombie domove getposATL _objectcar};
							_x = (0.5 + ((_zombie distance _objectcar)/50)) min 4;
							sleep _x;
						};
					};
				};

				if (!(isnil "Ryanzombiescanthrowtank") && (alive _zombie)) then
				{
					_objecttank = nearestObject [_zombie, "tank"]; 
					if ((_objecttank iskindof "tank") && (random 7 < 1)) then
					{
						while {(_zombie distance _objecttank < _zombie distance _target) && (_objecttank distance _target < _zombie distance _target) && (_objecttank distance _target < Ryanzombiescanthrowtankdistance)} do
						{
							if !(alive _zombie) then {breakTo "loop"};
							_target = (getPos _zombie nearEntities [['Exile_Unit_Player'],50]) select 0;
							if (isnull _target) then {breakTo "findtarget";};

							if (_zombie distance _objecttank < 8) then
							{
								[_zombie, "AwopPercMstpSgthWnonDnon_throw"] remoteExecCall ["fnc_RyanZombies_SwitchMove"];
								_zombie setdir (_zombie getDir _objecttank);

								_pos = getposATL _objecttank;
								_dir = ((_pos select 0) - (getpos _zombie select 0)) atan2 ((_pos select 1) - (getpos _zombie select 1));
								_zombie setpos [(_pos select 0) - 4*sin _dir, (_pos select 1) - 4*cos _dir];

								_Attack = selectRandom _AttackArray;
								playsound3d [format ["%1",_Attack], _zombie, false, getPosASL _zombie, 1, _soundpitch];
								sleep 0.3;
								if !(alive _zombie) then {breakTo "loop"};
								_speed = 20 + random 25;
								_dir = ((getpos _target select 0) - (getpos _objecttank select 0)) atan2 ((getpos _target select 1) - (getpos _objecttank select 1));
								_range = _objecttank distance _target;

								if (isnil "Ryanzombiescanthrowtankstrength") then
								{
									[_objecttank, [_speed * (sin _dir), _speed * (cos _dir), 5 * (_range / _speed)]] remoteExecCall ["fnc_RyanZombies_Velocity"];
								} else
								{
									if (Ryanzombiescanthrowtankstrength == 1) exitwith {[_objecttank, [(_speed * (sin _dir))/1.5, (_speed * (cos _dir))/1.5, 3.5 * (_range / _speed)]] remoteExecCall ["fnc_RyanZombies_Velocity"];};
									if (Ryanzombiescanthrowtankstrength == 2) exitwith {[_objecttank, [(_speed * (sin _dir))/2, (_speed * (cos _dir))/2, 2.5 * (_range / _speed)]] remoteExecCall ["fnc_RyanZombies_Velocity"];};
									if (Ryanzombiescanthrowtankstrength == 3) exitwith {[_objecttank, [(_speed * (sin _dir))/2.5, (_speed * (cos _dir))/2.5, 1.5 * (_range / _speed)]] remoteExecCall ["fnc_RyanZombies_Velocity"];};
									if (Ryanzombiescanthrowtankstrength == 4) exitwith {[_objecttank, [(_speed * (sin _dir))*5, (_speed * (cos _dir))*5, (_range / _speed)]] remoteExecCall ["fnc_RyanZombies_Velocity"];};
								};

								_Throw = selectRandom _ThrowArray;
								playsound3d [format ["%1",_Throw], _objecttank, false, getPosASL _objecttank, 1, _soundpitch];

								[_objecttank] execVM "\ryanzombies\tankland.sqf";
								sleep Ryanzombiesattackspeed;
								breakTo "findtarget";
							};
							if !(local _zombie) then {[_zombie, getposATL _objecttank] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"]} else {_zombie domove getposATL _objecttank};
							_x = (0.5 + ((_zombie distance _objecttank)/50)) min 4;
							sleep _x;
						};
					};
				};

				if (!(isnil "Ryanzombiesjump") && (alive _zombie)) then
				{
					if ((_zombie distance _target > 45) && (alive _zombie) && (alive _target) && (!surfaceIsWater getposATL _zombie) && (random 15 < 1)) then
					{
						_heightzombie = getTerrainHeightASL (getposATL _zombie);
						_heighttarget = getTerrainHeightASL (getposATL _target);
						_highzombie = _heightzombie + 20;
						_hightarget = _heighttarget + 40;

						if (_highzombie < _heighttarget) then {breakTo "findtarget";};
						if (_hightarget < _heightzombie) then {breakTo "findtarget";};

						_zombie disableAI "MOVE";

						_basespeed = 8 + random 2;
						_extraspeed = (_zombie distance _target)/8 min 60;

						if (isnil "ryanzombiesdisablejumping") then
						{
							_Jump = selectRandom _JumpArray;
							playsound3d [format ["%1",_Jump], _zombie, false, getPosASL _zombie, 1, _soundpitch];
						};
						sleep 0.15;
						_zombie setdir (_zombie getDir _target);
						_dir = ((getpos _target select 0) - (getpos _zombie select 0)) atan2 ((getpos _target select 1) - (getpos _zombie select 1));

						if (isnil "Ryanzombiesjumpstrength") then
						{
							[_zombie, [(_basespeed + _extraspeed) * (sin _dir), (_basespeed + _extraspeed) * (cos _dir), 12 + random 6]] remoteExecCall ["fnc_RyanZombies_Velocity"];
							sleep 1;
						} else
						{
							if (Ryanzombiesjumpstrength == 1) exitwith {[_zombie, [((_basespeed + _extraspeed) * (sin _dir))/1.5, ((_basespeed + _extraspeed) * (cos _dir))/1.5, 10 + random 4]] remoteExecCall ["fnc_RyanZombies_Velocity"]; sleep 0.75;};
							if (Ryanzombiesjumpstrength == 2) exitwith {[_zombie, [((_basespeed + _extraspeed) * (sin _dir))/2, ((_basespeed + _extraspeed) * (cos _dir))/2, 7 + random 3]] remoteExecCall ["fnc_RyanZombies_Velocity"]; sleep 0.5;};
							if (Ryanzombiesjumpstrength == 3) exitwith {[_zombie, [((_basespeed + _extraspeed) * (sin _dir))/2.5, ((_basespeed + _extraspeed) * (cos _dir))/2.5, 5 + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity"]; sleep 0.25;};
						};

						_zombie allowdammage false;
						sleep 0.5;
						waituntil {(getpos _zombie select 2) < 1 OR (speed _zombie < 1)};

						_zombie enableAI "MOVE";
						sleep 0.5;
						if (isnil "Ryanzombiesinvincible") then {_zombie allowdammage true};
						breakTo "findtarget";
					};
				};
				breakTo "findtarget";
			};
			if (alive _zombie) then {_a = _a + 1; sleep 1;};
			if (_a > _b) then {breakTo "loop"};
		};
	};
};