#include "vars.h"

params ["_missionName", "_position"];

// generate unique ID
_missionId = nil;
_isUnique = false;

while {!_isUnique} do {
    _isUnique = true;
    _missionId = random [10000000, 5555555, 9999999];
    // Check its unique
    for "_i" from 0 to (count GLOBAL_EVENTS -1) do {
        _event = GLOBAL_EVENTS select _i;
        if ((_event select 0) == _missionId) then {
            _isUnique = false;
        };
    };

};


// store in global array with isComplete bool
_missionComplete = false;
_vecs = []; // array for storing vehicles to cleanup on mission end
_cleanUp = false;
_difficulty = 100; // default - ammo it takes to put out

GLOBAL_EVENTS pushBack [_missionId, _missionComplete, _missionName, _position, _vecs, _cleanUp, _difficulty];

// fire off mission with vars
[_missionId] execVM ("kyle\ems_missions\missions\fn_" + _missionName + ".sqf");


// have completion loop
_littleObject = "Land_ClutterCutter_small_F" createVehicle _position;
_littleObject setVariable ['missionId', _missionId, true];

_littleObject addEventHandler ["FiredNear", {
	params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];

    _missionId = _unit getVariable 'missionId';

    if (_distance < 4 && _weapon == "A3L_Extinguisher") then {

        _points_left = [_missionId, EVENT_VAR_DIFFICULTY] call KyleEmsMissions_fnc_getEventVar;

        systemChat (str _points_left);

        if (_points_left != 0) then {
            [_missionId, EVENT_VAR_DIFFICULTY, _points_left - 1] call KyleEmsMissions_fnc_setEventVar;
        } else {
            [_missionId, EVENT_VAR_IS_COMPLETE, true] call KyleEmsMissions_fnc_setEventVar;
            _unit removeEventHandler ["FiredNear", 0];
        };
    };
}];

// garbage collection
[_missionId, _littleObject] spawn {
    params ["_missionId", "_littleObject"];

    while {true} do {
        _cleanUp = [_missionId, EVENT_VAR_CLEAN_UP] call KyleEmsMissions_fnc_getEventVar;

        if (_cleanUp) exitWith {
            for "_i" from 0 to (count GLOBAL_EVENTS -1) do {
                _event = GLOBAL_EVENTS select _i;
                if ((_event select 0) == _missionId) exitWith {
                    GLOBAL_EVENTS deleteAt _i;
                };
            };

        };
    };
};
