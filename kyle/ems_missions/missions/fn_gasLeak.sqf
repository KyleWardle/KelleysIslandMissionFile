
systemChat "Gas Leak!";

params ["_position"];


_missionComplete = false;

_gas = "SmokeShellYellow" createVehicle _position;
_littleObject = "Land_ClutterCutter_small_F" createVehicle _position;
[_littleObject,["Stop gas leak",{
        systemChat "Stopped gas leak!";
    },[],1,false,true,"","player distance _target < 5"]] remoteExec ["addAction", 0];


uiSleep 15;

while {!_missionComplete} do {
    _nearbyPlayers = nearestObjects [_position, ["Man"], 10];

    if (isNull _gas) then {
        _gas = "SmokeShellYellow" createVehicle _position;
    };

    for "_i" from 0 to (count _nearbyPlayers - 1) do
    {
        _player = _nearbyPlayers select _i;

        if (isPlayer _player) then {

            _playerWearingMask = (goggles _player) == 'US_FireFighter_ARI_Drager_Mask';
            _playerWearingScuba = (backpack _player) == 'B_SCBA_01_F';

            if (!_playerWearingMask || !_playerWearingScuba) then {
                _distance = _player distance _position;
                _damage = 0.05 / _distance; // will damage from 10 metres
                _playerDamage = ((getDammage _player) + _damage);

                [format ["player setDamage %1", _playerDamage]]
                remoteExec ["Luke_Core_RunCode", [_player]];

        };

    };
};
