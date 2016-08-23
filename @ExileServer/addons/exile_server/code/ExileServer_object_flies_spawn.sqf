/**
 * ExileServer_object_flies_spawn
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_deadEntity","_fliesSound","_fliesParticles"];
_deadEntity = _this;
_fliesSound = createSoundSource ["Exile_Sound_Flies", getPos _deadEntity, [], 0];
_fliesSound attachTo [_deadEntity, [0, 0, 0]];
_fliesParticles = createVehicle ["Exile_Effect_Flies", getPos _deadEntity, [], 0, "CAN_COLLIDE"];
_fliesParticles attachTo [_deadEntity, [0, 0, 0]];
_deadEntity setVariable ["ExileFliesSound", _fliesSound];
_deadEntity setVariable ["ExileFliesParticles", _fliesParticles];