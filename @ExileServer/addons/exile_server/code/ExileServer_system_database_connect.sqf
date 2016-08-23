/**
 * ExileServer_system_database_connect
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_isConnected","_error","_result"];
_isConnected = false;
_error_locked = false;
ExileServerDatabaseSessionId = "";
ExileServerRconSessionID = "";
try 
{
	_result = "extDB2" callExtension "9:VERSION";
	if (_result isEqualTo "") then
	{
		throw "Unable to locate extDB2 extension!";
	};
	if (parseNumber _result < 69) then
	{
		throw "Update extDB2 to version 69 or later";
	};
	format ["Installed extDB2 version: %1", _result] call ExileServer_util_log;
	_result = call compile ("extDB2" callExtension "9:LOCK_STATUS") select 0;
	if (_result isEqualTo 1) then
	{
		_error_locked = true;
		throw "Error extDB2 is already setup & locked !!!";
	};
	_result = call compile ("extDB2" callExtension "9:ADD_DATABASE:exile");
	if (_result select 0 isEqualTo 0) then
	{
		throw format ["Could not add database: %1", _result]; 
	};
	"Connected to database!" call ExileServer_util_log;
	ExileServerDatabaseSessionId = str(round(random(999999)));
	_result = call compile ("extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:exile:SQL_CUSTOM_V2:%1:exile", ExileServerDatabaseSessionId]);
	if ((_result select 0) isEqualTo 0) then
	{
		throw format ["Failed to initialize database protocol: %1", _result]; 
	};
	ExileServerStartTime = (call compile ("extDB2" callExtension "9:LOCAL_TIME")) select 1;
	"Database protocol initialized!" call ExileServer_util_log;
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:TRADING:Exile_TradingLog";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:DEATH:Exile_DeathLog";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:TERRITORY:Exile_TerritoryLog";
	"extDB2" callExtension "9:LOCK";
	_isConnected = true;
}
catch
{
	if (!_error_locked) then
	{
		"MySQL connection error!" call ExileServer_util_log;
		"Please have a look at @ExileServer/extDB/logs/ to find out what went wrong." call ExileServer_util_log;
		format ["MySQL Error: %1", _exception]  call ExileServer_util_log;
		"Server will shutdown now :(" call ExileServer_util_log;
		"extDB2" callExtension "9:SHUTDOWN";
	}
	else
	{
		format ["extDB2: %1", _exception] call ExileServer_util_log;
		"Check your server rpt for errors, your mission might be stuck a loop restarting" call ExileServer_util_log;
	};
};
_isConnected
