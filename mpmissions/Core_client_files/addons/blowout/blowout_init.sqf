/*
 **  BLOWOUT MODULE - Nightstalkers: Shadow of Namalsk
 *   ..created by Sumrak, ©2010
 *   http://www.nightstalkers.cz
 *   sumrak<at>nightstalkers.cz
 *   PBO edition
 *   INIT script 
*/

if (isMultiplayer) then { 
	if (isServer) then {
		_bul = [] execVM "addons\blowout\module\blowout_server.sqf";
	};
	if (!isDedicated) then {
		_bul = [] execVM "addons\blowout\module\blowout_client.sqf";
	};
} else {
	_bul = [] execVM "addons\blowout\module\blowout_server.sqf";
	_bul = [] execVM "addons\blowout\module\blowout_client.sqf";
};