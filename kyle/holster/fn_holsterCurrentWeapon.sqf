#include "vars.h"

_holsterType = [currentWeapon player] call KyleHolster_fnc_getHolsterType;
_holsterIsEmpty = (KYLE_PLAYER_HOLSTERS select _holsterType) isEqualTo [];

if (!_holsterIsEmpty) exitWith {
    hint "Holster not empty!";
};

_weapon = nil;
if (_holsterType isEqualTo HOLSTER_PRIMARY) then {
    _weapon = primaryWeapon player;
} else {
    _weapon = handgunWeapon player;
};

_hasWeapon = !((_weapon) isEqualTo "");

if (_hasWeapon) then {
    _weaponArray = [_holsterType] call KyleHolster_fnc_formWeaponArray;

    if (!(_holsterType isEqualTo HOLSTER_PRIMARY)) then {
        // Remove weapon
        KYLE_PLAYER_HOLSTERS set [_holsterType, _weaponArray];
        player removeWeapon (_weaponArray select HOLSTER_INDEX_WEAPON);
    };

    player action ['SwitchWeapon', player, player, -5];

    hint (format ["%1 Holstered!", _weapon]);
};
