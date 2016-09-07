_extinguish = _this select 2;
_chemlight = _this select 3;

player removeAction _extinguish;

player playActionNow "Medic";

sleep 10;

deleteVehicle _chemlight;