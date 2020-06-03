params ["_missionId", "_varIndex", "_value"];

_mission = [];

for "_i" from 0 to (count GLOBAL_EVENTS -1) do {
    _event = GLOBAL_EVENTS select _i;
    if ((_event select 0) == _missionId) then {
        _mission = _event;
    };
};

if ((count _mission) != 0) then {
    _mission set [_varIndex, _value];
};

_mission;
