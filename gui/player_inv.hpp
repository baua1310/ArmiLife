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
            text = "Yes"; //--- ToDo: Localize;
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
            text = "No"; //--- ToDo: Localize;
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
            text = " A decision must be made "; //--- ToDo: Localize;
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
		class Progress: Life_RscProgress 
		{
			idc = 1;
			x = 0.42 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
		};
	};
};


class playerSettings {

    idd = playersys_DIALOG;
    movingEnable = true;
    enableSimulation = true;

    class controlsBackground {

    class life_RscTitleBackground:life_RscText {
                    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
                    idc = -1;
                    x = 0.1;
                    y = 0.2;
                    w = 0.8;
                    h = (1 / 25);
            };

            class MainBackground:life_RscText {
                    colorBackground[] = {0, 0, 0, 0.7};
                    idc = -1;
                    x = 0.1;
                    y = 0.2 + (11 / 250);
                    w = 0.8;
                    h = 0.6 - (22 / 250);
            };

            class Title : life_RscTitle {
                    colorBackground[] = {0, 0, 0, 0};
                    idc = -1;
                    text = "Player Menu";
                    x = 0.1;
                    y = 0.2;
                    w = 0.8;
                    h = (1 / 25);
            };

            class moneyStatusInfo : Life_RscStructuredText
            {
                    idc = 2015;
                    sizeEx = 0.020;
                    text = "";
                    x = 0.105;
                    y = 0.30;
                    w = 0.3; h = 0.6;
            };

            class PlayersName : Title {
                    idc = carry_weight;
                    style = 1;
                    text = "";
            };
    };

    class controls {

            class itemHeader : Life_RscText
            {
                    idc = -1;
                    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
                    text = "Items";
                    sizeEx = 0.04;

                    x = 0.62; y = 0.26;
                    w = 0.275; h = 0.04;
            };

            class licenseHeader : Life_RscText
            {
                    idc = -1;
                    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
                    text = "Licenses";
                    sizeEx = 0.04;

                    x = 0.336; y = 0.26;
                    w = 0.275; h = 0.04;
            };

            class moneySHeader : Life_RscText
            {
                    idc = -1;
                    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
                    text = "Money";
                    sizeEx = 0.04;

                    x = 0.11; y = 0.26;
                    w = 0.219; h = 0.04;
            };

            class itemList : life_RscListBox 
            {
                    idc = item_list;
                    sizeEx = 0.030;

                    x = 0.62; y = 0.30;
                    w = 0.275; h = 0.3;
            };

            class moneyEdit : Life_RscEdit 
            {
                    idc = 2018;

                    text = "1";
                    sizeEx = 0.030;
                    x = 0.12; y = 0.42;
                    w = 0.18; h = 0.03;
            };

            class NearPlayers : Life_RscCombo 
            {
                    idc = 2022;

                    x = 0.12; y = 0.46;
                    w = 0.18; h = 0.03;
            };

            class moneyDrop : Life_RscButtonMenu
            {
                    idc = 2001;
                    text = "Give";
                    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
                    onButtonClick = "[] call life_fnc_giveMoney";
                    sizeEx = 0.025;
                    x = 0.135; y = 0.50;
                    w = 0.13; h = 0.036;
            };

            class itemEdit : Life_RscEdit {		
            idc = 2010;
            text = "1";
            sizeEx = 0.030;
            x = 0.62; y = 0.61;
            w = 0.275; h = 0.03;		
            };
            class iNearPlayers : Life_RscCombo
            {
                    idc = 2023;

                    x = 0.62; y = 0.65;
                    w = 0.275; h = 0.03;
            };

            class DropButton : life_RscButtonMenu {

                    idc = 2002;
                    text = "Drop";
                    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
                    onButtonClick = " ""drop"" call fnc_INVaction; ";

                    x = 0.765;
                    y = 0.70;
                    w = (5.25 / 40);
                    h = (1 / 25);

            };

            class UseButton : life_RscButtonMenu {

                    text = "Use";
                    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
                    onButtonClick = " ""use"" call fnc_INVaction;";

                    x = 0.62;
                    y = 0.70;
                    w = (5.25 / 40);
                    h = (1 / 25);

            };

            class RemoveButton : life_RscButtonMenu {

                    text = "Destroy";
                    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
                    onButtonClick = " ""destroy"" call fnc_INVaction; ";

                    x = 0.475;
                    y = 0.70;
                    w = (5.25 / 40);
                    h = (1 / 25);

            };

            class ButtonClose : life_RscButtonMenu {
                    idc = -1;
                    //shortcuts[] = {0x00050000 + 2};
                    text = "Close";
                    onButtonClick = "closeDialog 0;";
                    x = 0.1;
                    y = 0.8 - (1 / 25);
                    w = (6.25 / 40);
                    h = (1 / 25);
            };

            class ButtonSettings : life_RscButtonMenu {
                    idc = -1;
                    text = "Settings";
                    onButtonClick = "[] call life_fnc_settingsMenu;";
                    x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
                    y = 0.8 - (1 / 25);
                    w = (6.25 / 40);
                    h = (1 / 25);
            };

            class ButtonMyGang : Life_RscButtonMenu {
                    idc = 2011;
                    text = "My Faction";
                    onButtonClick = "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
                    x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
                    y = 0.805;
                    w = (6.25 / 40);
                    h = (1 / 25);
            };

            class Licenses_Menu : Life_RscControlsGroup
            {
                    idc = -1;
                    w = 0.28;
                    h = 0.38;
                    x = 0.34;
                    y = 0.30;

                    class Controls
                    {
                            class Life_Licenses : Life_RscStructuredText
                            {
                                    idc = 2014;
                                    sizeEx = 0.020;
                                    text = "";
                                    x = 0;
                                    y = 0;
                                    w = 0.27; h = 0.65;
                            };
                    };
            };

            class ButtonGangList : Life_RscButtonMenu {
                    idc = 2012;
                    text = "Warrants";
                    onButtonClick = "[] call life_fnc_wantedMenu";
                    x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
                    y = 0.8 - (1 / 25);
                    w = (6.25 / 40);
                    h = (1 / 25);
            };

            class ButtonKeys : Life_RscButtonMenu {
                    idc = 2013;
                    text = "Key Chain";
                    onButtonClick = "createDialog ""Life_key_management"";";
                    x = 0.26 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
                    y = 0.8 - (1 / 25);
                    w = (6.25 / 40);
                    h = (1 / 25);
            };

            class ButtonCell : Life_RscButtonMenu {
                    idc = 2014;
                    text = "Phone";
                    //onButtonClick = "createDialog ""Life_my_smartphone"";";
                    onButtonClick = "[] call life_fnc_cellphone2;";
                    x = 0.42 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
                    y = 0.8 - (1 / 25);
                    w = (6.25 / 40);
                    h = (1 / 25);
            };

            class ButtonAdminMenu : Life_RscButtonMenu {
                    idc = 2021;
                    text = "Admin Menu";
                    onButtonClick = "createDialog ""life_admin_menu"";";
                    x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
                    y = 0.805;
                    w = (6.25 / 40);
                    h = (1 / 25);
            };

            class ButtonSyncData : life_RscButtonMenu {
                    idc = -1;
                    //shortcuts[] = {0x00050000 + 2};
                    text = "Sync";
                    onButtonClick = "[] call SOCK_fnc_syncData;";
                    x = 0.1;
                    y = 0.805;
                    w = (6.25 / 40);
                    h = (1 / 25);
            };

            class ButtonMarket : Life_RscButtonMenu {
                    idc = -1;
                    text = "Market";
                    onButtonClick = "[] call life_fnc_OpenEconomy;";
                    //x = 0.26 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
                    x = 0.26 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
                    y = 0.805;
                    w = (6.25 / 40);
                    h = (1 / 25);
            };

            class ButtonWantedAdd : life_RscButtonMenu {
                    idc = 9800;
                    //shortcuts[] = {0x00050000 + 2};
                    text = "Wanted +";
                    onButtonClick = "createDialog ""life_wantedadd2"";";
                    x = 0.42 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
                    y = 0.805;
                    w = (6.25 / 40);
                    h = (1 / 25);
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
        class lblName: Life_RscText
        {
            idc = 1;
            text = "";
            x = 0.338 * safezoneW + safezoneX;
            y = 0.2 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.03 * safezoneH;
            colorText[] = { 0, 0, 0, 1 };
        };
        class lblFaction: Life_RscText
        {
            idc = 2;
            text = "Faction: Factionless";
            x = 0.338 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.03 * safezoneH;
            colorText[] = { 0, 0, 0, 1 };
        };
        class lblRank: Life_RscText
        {
            idc = 3;
            text = "Rank: None";
            x = 0.338 * safezoneW + safezoneX;
            y = 0.250 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.03 * safezoneH;
            colorText[] = { 0, 0, 0, 1 };
        };
        class lblTest: Life_RscText
        {
            idc = 4;
            text = "";
            x = 0.338 * safezoneW + safezoneX;
            y = 0.275 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.03 * safezoneH;
            colorText[] = { 0, 0, 0, 1 };
        };
        class lblUID: Life_RscText
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
        class bgProfession: Life_RscBackground
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