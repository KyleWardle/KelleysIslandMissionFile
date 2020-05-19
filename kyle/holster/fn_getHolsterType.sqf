#include "vars.h"

// Returns primary or secondary

params ["_weapon"];

if ((primaryWeapon player) isEqualTo _weapon) exitWith {
    HOLSTER_PRIMARY;
};

if (WEAPON_TASER isEqualTo _weapon) exitWith {
    HOLSTER_TERTIARY;
};

if ((handgunWeapon player) isEqualTo _weapon) exitWith {
    HOLSTER_SECONDARY;
};
