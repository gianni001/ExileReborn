private ["_strikeCenter"];

"STORM CYCLE BEGUN" call ExileServer_util_log;

if ((overcast > 0.5) && ((count allPlayers) > 0) && (rain > 0.6)) then
{
	for "_n" from 1 to 25 do
	{	
		/*
		_spawnCenter = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
		_min = 1;
		_max = 30000;
		_mindist = 2;
		_water = 0;
		_shoremode = 0;

		_strikeCenter = [_spawnCenter,_min,_max,_mindist,_water,1,_shoremode] call BIS_fnc_findSafePos;
		*/
		_player = selectRandom allPlayers;
		_strikeCenter = getPos _player;
		_amount = 1 + floor (random 10);
		for "_i" from 1 to _amount do
		{
			_pos = [(_strikeCenter select 0) + floor (random 1000) - floor (random 1000), (_strikeCenter select 1) +floor (random 1000)- floor (random 1000), 0];
			_nearPlayers = _pos nearEntities ["Exile_Unit_player",20];

			if (count _nearPlayers > 0) then 
			{
				"STORMS - Position of strike is within 10m of a player.. he has 10 seconds to move or .. Thor..." call ExileServer_util_log;

				uiSleep 10;
			};	

			_dir =random 360;

			_bolt = createvehicle ["LightningBolt",_pos,[],0,"can collide"];
			_bolt setposatl _pos;
			_bolt setdamage 1;

			_light = "#lightpoint" createvehicle _pos;
			_light setposatl [_pos select 0,_pos select 1,(_pos select 2) + 10];
			_light setLightDayLight true;
			_light setLightBrightness 300;
			_light setLightAmbient [0.05, 0.05, 0.1];
			_light setlightcolor [1, 1, 2];

			_light setLightBrightness 0;


			_class = ["lightning1_F","lightning2_F"] call bis_Fnc_selectrandom;
			_lightning = _class createvehicle [100,100,100];
			_lightning setdir _dir;
			_lightning setpos _pos;

			_duration = random 2;
			for "_i" from 0 to _duration do
			{
				_time = time + 0.1;
				_light setLightBrightness (100 + random 100);
				waituntil {time > _time};
			};
			deletevehicle _lightning;
			deletevehicle _light;
			uiSleep 0.5 + floor (random 2);
		};
	};	
};

Event_lightningSpawnInterval = (Event_lightningSpawnInterval + floor (random 500)) - floor (random 500);

format ["[STORM CYCLE COMPLETE] -- Next storm in - %1",Event_lightningSpawnInterval] call ExileServer_util_log;