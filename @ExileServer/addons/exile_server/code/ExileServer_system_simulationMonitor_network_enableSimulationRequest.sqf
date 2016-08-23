/**
 * ExileServer_system_simulationMonitor_network_enableSimulationRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_parameters","_netId","_object"];
_parameters = _this select 1;
_netId = _parameters select 0;
_object = objectFromNetId _netId;
if (isNull _object) then
{
	"Cannot enable simulation for unknown network ID!" call ExileServer_util_log;
}
else 
{
	if !(simulationEnabled _object) then 
	{
		_object enableSimulationGlobal true;
	};
};
true