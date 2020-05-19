#include "vars.h"

params ["_holsterType"];

_weapon = currentWeapon player;
_hasWeapon = !((_weapon) isEqualTo "");
_weaponArray = KYLE_PLAYER_HOLSTERS select _holsterType;

if (_holsterType isEqualTo HOLSTER_PRIMARY) exitWith {
    player action ['SwitchWeapon', player, player, 1];
};

if (_hasWeapon) exitWith {
    hint "You cant unholster a weapon with one in your hands!";
};


if (_weaponArray isEqualTo []) exitWith {
    hint format ["No weapon stored in holster %1", (_holsterType + 1)];
};

[_weaponArray] call KyleHolster_fnc_addWeaponFromArray;

_holsteredWeapon = _weaponArray select HOLSTER_INDEX_WEAPON;

hint (format ["%1 Unholstered!", _holsteredWeapon]);
player selectWeapon _holsteredWeapon;

KYLE_PLAYER_HOLSTERS set [_holsterType, []];
