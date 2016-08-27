/**
 * ExileServer_system_event_abandonedSafe_start
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_config","_markerTime","_abandonedSafes","_randomNumber","_safe","_position","_marker"];
_config = configFile >> "CfgSettings" >> "Events" >> "AbandonedSafe";
_markerTime = getNumber (_config >> "markerTime");
_abandonedSafes = ExileAbandondedSafes;
if (_abandonedSafes isEqualTo []) exitWith
{
	"There are no abandoned safes. Skipping abandoned safe event." call ExileServer_util_log;
};
_randomNumber = (floor (random (count _abandonedSafes)));
_safe = _abandonedSafes select _randomNumber;
_position = getPosATL _safe;
["toastRequest", ["InfoTitleAndText", ["Abandoned safe located!", "PIN has been changed to 0000. Check your map for the location."]]] call ExileServer_system_network_send_broadcast;
_marker = createMarker [ format["ExileAbandonedSafe%1", diag_tickTime], _position];
_marker setMarkerType "ExileSafe";
_marker setMarkerText "Abandoned Safe - Code '0000'";
uiSleep (60 * _markerTime);
deleteMarker _marker;