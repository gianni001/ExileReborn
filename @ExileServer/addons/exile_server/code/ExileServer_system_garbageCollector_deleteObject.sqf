/**
 * ExileServer_system_garbageCollector_deleteObject
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_object","_fliesSound","_fliesParticles"];
_object = _this;
if (_object getVariable ["ExileIsSimulationMonitored", false]) then
{
	_object call ExileServer_system_simulationMonitor_removeVehicle;
};
_object removeAllEventHandlers "MPKilled";
_object removeAllEventHandlers "Damaged";
_object removeAllEventHandlers "GetIn";
_object removeAllEventHandlers "GetOut";
removeAllActions _object;
clearBackpackCargoGlobal _object;
clearWeaponCargoGlobal _object;
clearItemCargoGlobal _object;
clearMagazineCargoGlobal _object;
removeAllContainers _object;
if !(isNull (attachedTo _object)) then 
{
	detach _object;
};
_fliesSound = _object getVariable ["ExileFliesSound", objNull];
if !(isNull _fliesSound) then 
{
	deleteVehicle _fliesSound;
};
_fliesParticles = _object getVariable ["ExileFliesParticles", objNull];
if !(isNull _fliesParticles) then 
{
	_fliesParticles setDamage 999; 
};
{
	_x call ExileServer_system_garbageCollector_deleteObject;
}
forEach (attachedObjects _object);
deleteVehicle _object;