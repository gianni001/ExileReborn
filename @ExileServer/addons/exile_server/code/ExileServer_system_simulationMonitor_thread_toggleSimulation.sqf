/**
 * ExileServer_system_simulationMonitor_thread_toggleSimulation
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicle","_simulationShouldBeEnabled","_position"];
{
	_vehicle = _x;
	_simulationShouldBeEnabled = false;
	if !(crew _vehicle isEqualTo []) then 
	{
		_simulationShouldBeEnabled = true;	
	}
	else 
	{
		_position = getPos _vehicle;
		if (_position select 2 > 20) then
		{
			_simulationShouldBeEnabled = true;
		}
		else 
		{
			if ([_position, 250] call ExileClient_util_world_isAlivePlayerInRange) then
			{
				_simulationShouldBeEnabled = true;
			};
		};
	};
	if (_simulationShouldBeEnabled) then
	{
		if !(simulationEnabled _vehicle) then
		{
			_vehicle enableSimulationGlobal true;
		};
	}
	else 
	{
		if (simulationEnabled _vehicle) then
		{
			_vehicle enableSimulationGlobal false;
		};
	};
}
forEach ExileSimulationMonitoredVehicles;
true