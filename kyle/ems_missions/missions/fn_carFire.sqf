
systemChat "Car Fire!";

params ["_position"];

_vec = "Land_Wreck_Car2_F" createVehicle _position;

_fireSize = ["FIRE_MEDIUM", "FIRE_BIG"];

[_position, selectRandom _fireSize] call KyleHelpers_fnc_createFireEffect;
