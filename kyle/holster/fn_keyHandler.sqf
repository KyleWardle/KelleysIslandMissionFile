#include "..\handler\vars.h"
#include "vars.h"

params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];

switch (_key) do {
    case KEY_HANDLER_H: {
        if (_shift) then {
            call KyleHolster_fnc_holsterCurrentWeapon;

        };
    };

    case KEY_HANDLER_1: {
        if (_ctrl) then {
            [HOLSTER_PRIMARY] call KyleHolster_fnc_unholsterWeapon;
        };
    };

    case KEY_HANDLER_2: {
        if (_ctrl) then {
            [HOLSTER_SECONDARY] call KyleHolster_fnc_unholsterWeapon;
        };
    };


    case KEY_HANDLER_3: {
        if (_ctrl) then {
            [HOLSTER_TERTIARY] call KyleHolster_fnc_unholsterWeapon;
        };
    };


};
