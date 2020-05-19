#include "vars.h"

// Gets count of loaded magazine

params ["_magazineName"];

_magazineName = _magazineName select 0; // passes array

_allMagazines = magazinesAmmoFull player;
_ammoCount = nil;

for [{_i = 0}, {_i < count _allMagazines}, {_i = _i + 1}] do
{
    _magazine = _allMagazines select _i;

    _magazineClassName  = _magazine select 0;
    _magazineAmmoCount  = _magazine select 1;
    _isLoaded           = _magazine select 2;

    if ((_magazineClassName isEqualTo _magazineName) && _isLoaded) then {
        _ammoCount = _magazineAmmoCount;
    };
};

_ammoCount; // int
