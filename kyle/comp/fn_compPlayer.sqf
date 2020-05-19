#include "vars.h"

params ["_cash_amount", "_player"];

[format ["life_atmcash = life_atmcash + %1", _cash_amount]] remoteExec ["Luke_Core_RunCode", _player];
[format ["hint 'You recieved %1 dollars in compensation!'", _cash_amount]] remoteExec ["Luke_Core_RunCode", _player];

systemChat (format ["Successfully compensated user %1!", (name _player)]);
