#include "vars.h"

params ["_weaponArray"];

_holsteredWeapon = _weaponArray select HOLSTER_INDEX_WEAPON;

player addMagazine [
    (_weaponArray select HOLSTER_INDEX_WEAPON_MAGAZINE),
    (_weaponArray select HOLSTER_INDEX_WEAPON_MAGAZINE_COUNT)
];

player addWeapon _holsteredWeapon;

_weaponItems = _weaponArray select HOLSTER_INDEX_WEAPON_ITEMS;

for "_i" from 0 to ((count _weaponItems) - 1) do
{
    player addWeaponItem [
        _holsteredWeapon,
        (_weaponItems select _i),
        false
    ];
};
