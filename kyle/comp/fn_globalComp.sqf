#include "vars.h"

_players = call BIS_fnc_listPlayers;
params ["_cash_amount"];

for [{_i = 0}, {_i < count _players}, {_i = _i + 1}] do
{
    _player = _players select _i;
    [format ["life_atmcash = life_atmcash + %1", _cash_amount]] remoteExec ["Luke_Core_RunCode", _player];
    [format ["hint 'You recieved %1 dollars in global compensation!'", _cash_amount]] remoteExec ["Luke_Core_RunCode", _player];
};

systemChat (format ["Successfully compensated (%1) users!", (count _players)]);
