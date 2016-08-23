/**
 * ExileServer_system_simulationMonitor_initialize
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
ExileSimulationMonitoredVehicles = [];
[20, ExileServer_system_simulationMonitor_thread_toggleSimulation, [], true] call ExileServer_system_thread_addTask;
true