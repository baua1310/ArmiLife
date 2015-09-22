#define playersys_DIALOG 2001
#define item_list 2005
#define player_list 2006
#define carry_weight 2009

class YesNo {
    idd = 1000;
    movingEnable = true;
    enableSimulation = true;

    class controlsBackground {};

    class controls {
        class btnYes:Life_RscButtonMenu
        {
            idc = 1600;
            text = "Yes";
            x = 0.412312 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.0773717 * safezoneW;
            h = 0.025 * safezoneH;
            action = "antwort = 1; closeDialog 0;";
            class Attributes
            {
                color = "#00FF00";
                align = "center";
                valign = "middle";
            };
        };
        class btnNo:Life_RscButtonMenu
        {
            idc = 1601;
            text = "No";
            x = 0.505158 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.0773717 * safezoneW;
            h = 0.025 * safezoneH;
            action = "antwort = 2; closeDialog 0;";
            class Attributes
            {
                color = "#00FF00";
                align = "center";
                valign = "middle";
            };
        };
        class RscFrame_1800:life_RscFrame
        {
            idc = 1800;
            text = " A decision must be made ";
            x = 0.371047 * safezoneW + safezoneX;
            y = 0.367963 * safezoneH + safezoneY;
            w = 0.252748 * safezoneW;
            h = 0.165046 * safezoneH;
        };
        class lblQuestion:life_RscStructuredText
        {
            idc = 1;
            text = "Loading...";
            x = 0.376205 * safezoneW + safezoneX;
            y = 0.378966 * safezoneH + safezoneY;
            w = 0.242431 * safezoneW;
            h = 0.14304 * safezoneH;
            colorBackground[] = {0,0,0,0.5};
        };
    };
};


class progressBar
{
	idd = 2459;
	onLoad = "((_this select 0) displayCtrl -1) progressSetPosition 0.5";
	class Controls
	{
		class Progress: AL_RscProgress 
		{
			idc = 1;
			x = 0.42 * safezoneW + safezoneX;
			y = 0.195 * safezoneH + safezoneY;
			h = 0.025 * safezoneH;
		};
		class lblText:life_RscStructuredText
        {
            idc = 2;
            text = "Loading...";
            x = 0.42 * safezoneW + safezoneX;
            y = 0.19 * safezoneH + safezoneY;
            w = 0.242431 * safezoneW;
            h = 0.14304 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
	};
};

class ArmiPhone {
	idd = -1;
	movingEnable = 1;
	enableSimulation = true;

	class controlsBackground {
    class bgPhone: ARM_RscPicture
    {
    	idc = 1200;
    	text = "img\phone.paa";
    	x = 0.0818 * safezoneW + safezoneX;
    	y = 0.17 * safezoneH + safezoneY;
    	w = 0.244375 * safezoneW;
    	h = 0.396 * safezoneH;
        colorText[] = {1,1,1,1};
    };  
  };
  class objects {};  
  class controls {
    class RscFrame_1800: ARM_RscFrameButton
    {
    	idc = 1800;
    	x = 0.0931719 * safezoneW + safezoneX;
    	y = 0.202 * safezoneH + safezoneY;
    	w = 0.0373437 * safezoneW;
    	h = 0.0598519 * safezoneH;
      action = "['call_cop'] execVM 'armitxes\phone.sqf'; closeDialog 0;";
    };
    class RscFrame_1801: ARM_RscFrameButton
    {
    	idc = 1801;
    	x = 0.131741 * safezoneW + safezoneX;
    	y = 0.2019 * safezoneH + safezoneY;
    	w = 0.0373437 * safezoneW;
    	h = 0.0598519 * safezoneH;
      action = "['call_medic'] execVM 'armitxes\phone.sqf'; closeDialog 0;";
    };
    class RscFrame_1802: ARM_RscFrameButton
    {
    	idc = 1802;
    	x = 0.170309 * safezoneW + safezoneX;
    	y = 0.2019 * safezoneH + safezoneY;
    	w = 0.0373437 * safezoneW;
    	h = 0.0598519 * safezoneH;
      action = "['call_un'] execVM 'armitxes\phone.sqf'; closeDialog 0;";
    };
    class RscFrame_1803: ARM_RscFrameButton
    {
    	idc = 1803;
    	x = 0.0931719 * safezoneW + safezoneX;
    	y = 0.26482 * safezoneH + safezoneY;
    	w = 0.0373437 * safezoneW;
    	h = 0.0598519 * safezoneH;
      action = "openMap true; closeDialog 0;";
    };
    class RscFrame_1804: ARM_RscFrameButton
    {
    	idc = 1804;
    	x = 0.131741 * safezoneW + safezoneX;
    	y = 0.26482 * safezoneH + safezoneY;
    	w = 0.0373437 * safezoneW;
    	h = 0.0598519 * safezoneH;
      action = "['use'] execVM 'handy.sqf';";
    };
    class RscFrame_1805: ARM_RscFrameButton
    {
    	idc = 1805;
    	x = 0.170309 * safezoneW + safezoneX;
    	y = 0.26482 * safezoneH + safezoneY;
    	w = 0.0373437 * safezoneW;
    	h = 0.0598519 * safezoneH;
      action = "['vote'] execVM 'armitxes\phone.sqf'; closeDialog 0;";
    };
    class RscFrame_1806: ARM_RscFrameButton
    {
    	idc = 1806;
    	x = 0.170309 * safezoneW + safezoneX;
    	y = 0.4527 * safezoneH + safezoneY;
    	w = 0.0373437 * safezoneW;
    	h = 0.0598519 * safezoneH;
      action = "createDialog 'MainMenu';";
    };
  };
};

class ArmiID {
    idd = 1601;
    movingEnable = 1;
    enableSimulation = true;

    class controlsBackground {
        class bgID: ARM_RscPicture
        {
            idc = -1;
            text = "img\id.paa";
            x = 0.235902 * safezoneW + safezoneX;
            y = 0.15 * safezoneH + safezoneY;
            w = 0.4 * safezoneW;
            h = 0.6 * safezoneH;
        }; 
    };
    class objects {};  
    class controls {
        class lblName: AL_RscText
        {
            idc = 1;
            text = "";
            x = 0.338 * safezoneW + safezoneX;
            y = 0.2 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.03 * safezoneH;
            colorText[] = { 0, 0, 0, 1 };
        };
        class lblFaction: AL_RscText
        {
            idc = 2;
            text = "Faction: Factionless";
            x = 0.338 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.03 * safezoneH;
            colorText[] = { 0, 0, 0, 1 };
        };
        class lblRank: AL_RscText
        {
            idc = 3;
            text = "Rank: None";
            x = 0.338 * safezoneW + safezoneX;
            y = 0.250 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.03 * safezoneH;
            colorText[] = { 0, 0, 0, 1 };
        };
        class lblTest: AL_RscText
        {
            idc = 4;
            text = "";
            x = 0.338 * safezoneW + safezoneX;
            y = 0.275 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.03 * safezoneH;
            colorText[] = { 0, 0, 0, 1 };
        };
        class lblUID: AL_RscText
        {
            idc = 5;
            text = "";
            x = 0.3 * safezoneW + safezoneX;
            y = 0.33 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.03 * safezoneH;
            colorText[] = { 0, 0, 0, 1 };
        };
    };
};


class professions {
    idd = 1602;
    movingEnable = 1;
    enableSimulation = true;

    class controlsBackground {
        class bgProfession: AL_RscBackground
        {
        	idc = -1;
        	x = 0.235902 * safezoneW + safezoneX;
        	y = 0.149928 * safezoneH + safezoneY;
        	w = 0.528196 * safezoneW;
        	h = 0.700143 * safezoneH;
            colorBackground[] = { 1, 1, 1, 0.3 };
        };
    };
    class objects {};  
    class controls {
        class lstProfessions: Life_RscListNBox
        {
        	idc = 1;
        	x = 0.249107 * safezoneW + safezoneX;
        	y = 0.219943 * safezoneH + safezoneY;
        	w = 0.151856 * safezoneW;
        	h = 0.588121 * safezoneH;
        };
        class lblProfessions: Life_RscStructuredText
        {
        	idc = -1;
        	text = "Professions";
        	x = 0.249107 * safezoneW + safezoneX;
        	y = 0.177934 * safezoneH + safezoneY;
        	w = 0.0726269 * safezoneW;
        	h = 0.0280057 * safezoneH;
        };
        class lblProfDesc: Life_RscStructuredText
        {
        	idc = 2;
        	text = "Please select a profession for more details.";
        	x = 0.414168 * safezoneW + safezoneX;
        	y = 0.219943 * safezoneH + safezoneY;
        	w = 0.336725 * safezoneW;
        	h = 0.532109 * safezoneH;
        };
        class btnJob: Life_RscButtonMenu
        {
        	text = "Accept Profession";
        	x = 0.618844 * safezoneW + safezoneX;
        	y = 0.780057 * safezoneH + safezoneY;
        	w = 0.132049 * safezoneW;
        	h = 0.0280057 * safezoneH;
        };
    };
};