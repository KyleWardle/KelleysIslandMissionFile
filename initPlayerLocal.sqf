player addAction ["Open Comp menu", {call KyleComp_fnc_openMenu}];

[] spawn KyleKeyHandler_fnc_globalKeyHandler;

player addAction ["End Mission", {failMission "end5"}];

player addAction ["Arsenal", {
    ["Open", [true]] call BIS_fnc_arsenal;
}];
