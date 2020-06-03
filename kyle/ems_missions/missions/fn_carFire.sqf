#include "..\vars.h"

systemChat "Car Fire!";

params ["_missionId"];

_position = [_missionId, EVENT_VAR_POSITION] call KyleEmsMissions_fnc_getEventVar;

_vec = "Land_Wreck_Car2_F" createVehicle _position;

_fireSize = ["FIRE_MEDIUM", "FIRE_BIG"];

_fireVecs = [_position, selectRandom _fireSize] call KyleHelpers_fnc_createFireEffect;



while {true} do {
    _missionComplete = [_missionId, EVENT_VAR_IS_COMPLETE] call KyleEmsMissions_fnc_getEventVar;

    if (_missionComplete isEqualTo true) exitWith {
        // Cleanup
        deleteVehicle _vec;

        for "_vehicle" from 0 to (count _fireVecs - 1) do {
            deleteVehicle (_fireVecs select _vehicle);
        };

        [_missionId, EVENT_VAR_CLEAN_UP, true] call KyleEmsMissions_fnc_setEventVar;
    };
};
