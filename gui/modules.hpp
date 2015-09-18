class lbPlayers {
    idd = 100;
    movingEnable = true;
    enableSimulation = true;

    class controlsBackground {
		class plrBG : AL_RscBackground {
			x = 0; y = 0.15;
			w = 0.275; h = 0.57;
		}
	};

    class controls {
		class plrTitle : AL_RscText
		{
			idc = -1;
			text = "Players";
			sizeEx = 0.04;
			x = 0; y = 0.15;
			w = 0.275; h = 0.04;
			colorBackground[] = {0,0,0.2,0.8};
		};

		class grpList : Life_RscCombo {
			idc = 2023;
			x = 0; y = 0.19;
			w = 0.275; h = 0.03;
		};
		
		class plrList : life_RscListBox 
		{
			idc = item_list;
			sizeEx = 0.030;
			x = 0; y = 0.22;
			w = 0.275; h = 0.5;
		};
		
    };
};