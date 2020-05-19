class compMenu
{
    idd = COMP_MENU_IDD;

    class controls
    {
        class compFrame: RscFrame
        {
        	idc = 1800;

        	x = 0.345312 * safezoneW + safezoneX;
        	y = 0.269 * safezoneH + safezoneY;
        	w = 0.299062 * safezoneW;
        	h = 0.462 * safezoneH;
        };
        class playerList: RscListBox
        {
        	idc = COMP_MENU_LISTBOX_IDC;

        	x = 0.365937 * safezoneW + safezoneX;
        	y = 0.313 * safezoneH + safezoneY;
        	w = 0.12375 * safezoneW;
        	h = 0.33 * safezoneH;
        };
        class compButton: RscButton
        {
        	idc = 1600;
        	action = "call KyleComp_fnc_submitComp";

        	text = "Comp!";
        	x = 0.510312 * safezoneW + safezoneX;
        	y = 0.599 * safezoneH + safezoneY;
        	w = 0.103125 * safezoneW;
        	h = 0.044 * safezoneH;
        };
        class compAmount: RscEdit
        {
        	idc = COMP_MENU_AMOUNT_INPUT_IDC;
        	text = "Comp Amount";
        	x = 0.510312 * safezoneW + safezoneX;
        	y = 0.533 * safezoneH + safezoneY;
        	w = 0.103125 * safezoneW;
        	h = 0.044 * safezoneH;
        };

    };

};

