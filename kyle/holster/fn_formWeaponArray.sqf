#include "vars.h"

params ["_holsterType"];

_weaponArray = [];

if (_holsterType isEqualTo HOLSTER_PRIMARY) then {
    _weaponArray set [HOLSTER_INDEX_WEAPON,                     primaryWeapon player];
    _weaponArray set [HOLSTER_INDEX_WEAPON_MAGAZINE,            (primaryWeaponMagazine player) select 0];
    _weaponArray set [HOLSTER_INDEX_WEAPON_MAGAZINE_COUNT,      [primaryWeaponMagazine player] call KyleHolster_fnc_getMagazineCount];
    _weaponArray set [HOLSTER_INDEX_WEAPON_ITEMS,               primaryWeaponItems player];
} else {
    _weaponArray set [HOLSTER_INDEX_WEAPON,                     handgunWeapon player];
    _weaponArray set [HOLSTER_INDEX_WEAPON_MAGAZINE,            (handgunMagazine player) select 0];
    _weaponArray set [HOLSTER_INDEX_WEAPON_MAGAZINE_COUNT,      [handgunMagazine player] call KyleHolster_fnc_getMagazineCount];
    _weaponArray set [HOLSTER_INDEX_WEAPON_ITEMS,               handgunItems player];
};

_weaponArray;
