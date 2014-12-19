class devcon {

	idd = -1;
	movingEnable = true;
	enableSimulation = true;
  fadein=0;
	duration = 99999999999999999999999999999999999999999999;
  fadeout=0;
	name="devcon";
  
	class controlsBackground {
    class bgAdmin: Life_RscText
    {
    	idc = 2200;
    	x = 0.0359375 * safezoneW + safezoneX;
    	y = 0.236 * safezoneH + safezoneY;
    	w = 0.221719 * safezoneW;
    	h = 0.088 * safezoneH;
    	colorBackground[] = {255,-1,-1,0.2};
    };
	};
	class controls {
    class txtCmd: Life_RscEdit
    {
    	idc = 1400;
      text = "";
    	x = 0.0410937 * safezoneW + safezoneX;
    	y = 0.247 * safezoneH + safezoneY;
    	w = 0.211406 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class btnExec: Life_RscButtonMenu
    {
    	idc = 2400;
    	text = "Execute"; //--- ToDo: Localize;
    	x = 0.0410937 * safezoneW + safezoneX;
    	y = 0.291 * safezoneH + safezoneY;
    	w = 0.061875 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {-1,-1,-1,0.8};
      onButtonClick = "0 execVM ""gui\devcon.sqf"";";
    };
    class btnTeleport: Life_RscButtonMenu
    {
    	idc = 2401;
    	text = "Teleport"; //--- ToDo: Localize;
    	x = 0.108125 * safezoneW + safezoneX;
    	y = 0.291 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {-1,-1,-1,0.8};
      onButtonClick = "1 execVM ""gui\devcon.sqf"";";
    };
    class btnTP2ME: Life_RscButtonMenu
    {
    	idc = 2402;
    	text = "Teleport to me"; //--- ToDo: Localize;
    	x = 0.164844 * safezoneW + safezoneX;
    	y = 0.291 * safezoneH + safezoneY;
    	w = 0.0876563 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {-1,-1,-1,0.8};
      onButtonClick = "2 execVM ""gui\devcon.sqf"";";
    };
  };
};