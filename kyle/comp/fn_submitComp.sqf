#include "vars.h"

_index = lbCurSel COMP_MENU_LISTBOX_IDC;
scopeName "main";

_cash_amount = parseNumber (ctrlText COMP_MENU_AMOUNT_INPUT_IDC);
_player = KYLE_COMP_MENU_PLAYERS select _index;

if (_cash_amount == 0) exitWith {
    hint "Please enter a number!";
};

switch (_index) do {
    case -1: {
        hint "No player selected!";
    };
    case 0: {
        _cash_amount call KyleComp_fnc_globalComp;
    };
    default {
        [_cash_amount, _player] call KyleComp_fnc_compPlayer;
    };
};
