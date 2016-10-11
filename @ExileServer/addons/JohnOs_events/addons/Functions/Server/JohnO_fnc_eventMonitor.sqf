private ["_unitCount"];

diag_log format 
[
	"Event Monitor:: Amount of events since server start -- HELICRASH [%1] -- SUPPLYDROP [%2] -- CONVOY [%3] -- AIRPATROL [%4]",
	Event_HeliCrash_monitorCount,
	Event_SupplyDrop_monitorCount,
	Event_Convoy_monitorCount,
	Event_AirPatrol_monitorCount
];

if ((diag_tickTime - Event_HeliCrash_MarkerDuration >= Event_HeliCrash_timeStamp) && (Event_HeliCrash_Count > 0)) then
{
	Event_HeliCrash_Count = Event_HeliCrash_Count - 1;

	Event_HeliCrash_timeStamp = diag_tickTime;
};

_unitCount = [] call JohnO_fnc_countAIunits;

format["Alive AI on the server :: AI -- %1 || Zombies -- %2", _unitCount, count Event_IdleZombieArray] call ExileServer_util_log;
format["Event Monitor:: Amount of events since server start -- HELICRASH [%1] -- SUPPLYDROP [%2] -- CONVOY [%3] -- AIRPATROL [%4]",Event_HeliCrash_monitorCount,Event_SupplyDrop_monitorCount,Event_Convoy_monitorCount,Event_AirPatrol_monitorCount] call ExileServer_util_log;
