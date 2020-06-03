
systemChat "Truck Fire!";

params ["_position"];

_vec = "Land_Wreck_Truck_F" createVehicle _position;


_firePos = [_position select 0, (_position select 1) + 1.2, (_position select 2) + 2];
[_firePos, "FIRE_BIG"] call KyleHelpers_fnc_createFireEffect;

 // @todo: change last number to -2 when done


uiSleep 10; // Give the scrubs some time to gtfo

for "_i" from 0 to 1 step 0 do
{
    _random = round (random 5);
    if (_random isEqualTo 1) then {
        _possiblePositions = [
            [_position select 0, (_position select 1) + 2, _position select 2],
            [_position select 0, (_position select 1) - 1.5, _position select 2]
        ];

        _possibleExplosions = [
            "SatchelCharge_Remote_Ammo_Scripted",
            "DemoCharge_Remote_Ammo_Scripted",
            "ClaymoreDirectionalMine_Remote_Ammo_Scripted"
        ];

        _explosion = (selectRandom _possibleExplosions) createVehicle (selectRandom _possiblePositions);
        _explosion setDamage 1;
    };

    uiSleep 0.5;

    // for "_x" from 0 to 300 step 1 do
    // {
    //
    // };
    //
    // [_vec,["Put out fire",{
    //     systemChat "Put out fire!!!";
    // },[],1,false,true,"","player distance _target < 15"]] remoteExec ["addAction", 0];
    // uiSleep 60;


};


// Explodes for 5 minutes
// after 5 mins, they have one minute to clear explosion (20s)
// if they dont clear it in time, another 5 mins of explosions.
// rinse nad repoeat
