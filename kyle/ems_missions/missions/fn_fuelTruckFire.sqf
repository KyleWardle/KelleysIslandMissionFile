#include "..\vars.h"

systemChat "Truck Fire!";

params ["_missionId"];

[_missionId, EVENT_VAR_DIFFICULTY, 150] call KyleEmsMissions_fnc_setEventVar;
_position = [_missionId, EVENT_VAR_POSITION] call KyleEmsMissions_fnc_getEventVar;

_vec = "Land_Wreck_Truck_F" createVehicle _position;


_firePos = [_position select 0, (_position select 1) + 1.2, (_position select 2) + 2];
_fireVecs = [_firePos, "FIRE_BIG"] call KyleHelpers_fnc_createFireEffect;

 // @todo: change last number to -2 when done


uiSleep 10; // Give the scrubs some time to gtfo

for "_i" from 0 to 1 step 0 do
{
    _missionComplete = [_missionId, EVENT_VAR_IS_COMPLETE] call KyleEmsMissions_fnc_getEventVar;

    if (_missionComplete isEqualTo true) exitWith {
        // Cleanup
        deleteVehicle _vec;

        for "_vehicle" from 0 to (count _fireVecs - 1) do {
            deleteVehicle (_fireVecs select _vehicle);
        };

        [_missionId, EVENT_VAR_CLEAN_UP, true] call KyleEmsMissions_fnc_setEventVar;
    };

    _random = round (random 5);
    if (_random isEqualTo 1) then {
        _possiblePositions = [
            [_position select 0, (_position select 1) + 2, _position select 2],
            [_position select 0, (_position select 1) - 1.5, _position select 2]
        ];

        _possibleExplosions = [
            "SatchelCharge_Remote_Ammo_Scripted",
            "DemoCharge_Remote_Ammo_Scripted",
            "ClaymoreDirectionalMine_Remote_Ammo_Scripted"
        ];

        _explosion = (selectRandom _possibleExplosions) createVehicle (selectRandom _possiblePositions);
        _explosion setDamage 1;
    };

    uiSleep 0.5;
};
