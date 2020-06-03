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

systemChat (str _missionId);

GLOBAL_EVENTS pushBack [_missionId, _missionComplete, _missionName, _position, _vecs, _cleanUp];

// fire off mission with vars
[_missionId] execVM ("kyle\ems_missions\missions\fn_" + _missionName + ".sqf");

// have completion loop

uiSleep 10;

[_missionId, EVENT_VAR_IS_COMPLETE, true] call KyleEmsMissions_fnc_setEventVar;



// garbage collection
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
