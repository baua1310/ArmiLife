class mainOverlay {
	idd = -1;
	movingEnable = 0;
	enableSimulation = 0;
	fadein=0;
	duration = 99999999999999999999999999999999999999999999;
	fadeout=0;
	name="mainOverlay";
	onLoad="uiNamespace setVariable ['mainOverlay',_this select 0]";
  
	class controlsBackground {
		class lblFaction: RscStructuredText {
			idc = 1000;
			text = "Faction";
			x = 0.192 * safezoneW + safezoneX;
			y = 0.00697734 * safezoneH + safezoneY;
			w = 0.22 * safezoneW;
			h = 0.05;
			colorBackground[] = {0,0,0,0.6};
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		class lblHand: RscStructuredText {
			idc = 1003;
			x = 0.420312 * safezoneW + safezoneX;
			y = 0.00697734 * safezoneH + safezoneY;
			w = 0.159375 * safezoneW;
			h = 0.05;
			colorBackground[] = {0,0,0,0.6};
			class Attributes {
				align = "center";
				valign = "middle";
			};
		};
		class lblBalance: RscStructuredText {
			idc = 1001;
			text = "Money";
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.00697734 * safezoneH + safezoneY;
			w = 0.22 * safezoneW;
			h = 0.05;
			colorBackground[] = {0,0,0,0.6};
			class Attributes {
				align = "right";
				valign = "middle";
			};
		};
        class picCapNation: ARM_RscPicture
        {
            idc = 1004;
            text = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
            x = 0.9 * safezoneW + safezoneX;
            y = 0.7 * safezoneH + safezoneY;
            w = 0.04 * safezoneW;
            h = 0.05 * safezoneH;
        };
	};
	class controls {};
};

	
class hints
{
	idd=-1;
	movingEnable = true;
	fadein       =  0;
	fadeout      =  0;
	duration     =  0.1;
	name="hints";
	controls[]={"interact"};
	onLoad="uiNamespace setVariable ['hints', _this select 0]";
	
	class interact
	{
		type = 0;
		idc = 1;
		style = 0;
		x = 0.50;
		y = 0.47;
		w = 0.3;
		h = 0.2;
		font = "PuristaMedium";
		sizeEx = 0.03;
		colorText[] = {255, 255, 255, 0.8};
		colorBackground[]={0,0,0,0.8};
		text = "Interact (Space)";
	};
};
