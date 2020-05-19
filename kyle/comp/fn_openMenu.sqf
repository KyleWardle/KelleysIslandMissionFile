#include "vars.h"

createDialog "compMenu";

_control = (findDisplay COMP_MENU_IDD) displayCtrl COMP_MENU_LISTBOX_IDC;

KYLE_COMP_MENU_PLAYERS = ["All Players"] + (call BIS_fnc_listPlayers);

_control lbAdd "All Players";

for [{_i = 1}, {_i < count KYLE_COMP_MENU_PLAYERS}, {_i = _i + 1}] do
{
    _player = KYLE_COMP_MENU_PLAYERS select _i;
    _control lbAdd (name _player);
};