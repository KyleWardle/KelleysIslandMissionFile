params ["_missionId", "_varIndex"];

_mission = [];
_event = [];

_return = objNull;

for "_i" from 0 to (count GLOBAL_EVENTS -1) do {
    _event = GLOBAL_EVENTS select _i;

    if (!(isNil "_event")) then {
        if ((_event select 0) == _missionId) then {
            _mission = _event;
        };
    }
};

if ((count _mission) != 0) then {
    _return = _mission select _varIndex;
};

_return;
