class lbPlayers {
    idd = 100;
    movingEnable = true;
    enableSimulation = true;

    class controlsBackground {
		class plrBG : AL_RscBackground {
			x = 0.15 * safezoneW + safezoneX;
			y = 0.16 * safezoneH + safezoneY;
			w = 0.15 * safezoneW; h = 0.47 * safezoneH;
		}
	};

    class controls {
		class plrTitle : AL_RscText
		{
			idc = -1;
			text = "Players";
			sizeEx = 0.04;
			x = 0.15 * safezoneW + safezoneX;
			y = 0.16 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0.2,0.8};
		};

		class grpList : Life_RscCombo {
			idc = 2023;
			x = 0.15 * safezoneW + safezoneX;
			y = 0.20 * safezoneH + safezoneY;
			w = 0.15 * safezoneW; h = 0.03 * safezoneH;
		};
		
		class plrList : RscListBox {
			idc = 2024;
			sizeEx = 0.04;
			x = 0.15 * safezoneW + safezoneX;
			y = 0.23 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.4 * safezoneH;
		};
    };
};