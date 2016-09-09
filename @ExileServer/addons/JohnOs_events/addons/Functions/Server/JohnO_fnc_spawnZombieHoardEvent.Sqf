if (time - Event_zombieHoard_coolDown >= Event_zombieHoard_lastActivated) then
{
	[] spawn JohnO_fnc_createZombieHoard;
};	