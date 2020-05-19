Luke_Core_RunCode = {
    private _code = param [0];

    switch (typeName _code) do
    {
      case "ARRAY":  { _code apply { call compile _code; }; };
      case "STRING": { call compile _code; };
      case "CODE":   { call _code; };
    };
};

life_cash = 500;
life_atmcash = 1000;

KYLE_PLAYER_HOLSTERS = [
    [],
    [],
    []
];
