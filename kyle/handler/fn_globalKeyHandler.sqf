// Global key handler

_key_handler_display = 46;
waitUntil { !isNull findDisplay _key_handler_display };

 (findDisplay _key_handler_display) displayAddEventHandler ["KeyDown", {
    params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];

    _this call KyleHolster_fnc_keyHandler;

    false; // We dont want to override all other events :)
}];
