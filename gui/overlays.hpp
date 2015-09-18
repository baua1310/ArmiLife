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
		class lblFaction: Life_RscStructuredText
		{
			idc = 1000;
			text = "Faction";
			x = 0.00593747 * safezoneW + safezoneX;
			y = 0.00697736 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.05;
			colorBackground[] = {0,0,0,0.6};
			class Attributes {
				valign = "middle";
			};
		};
		class lblBalance: Life_RscStructuredText
		{
			idc = 1001;
			text = "Money";
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.00697734 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.05;
			colorBackground[] = {0,0,0,0.6};
			class Attributes {
				align = "right";
				valign = "middle";
			};
		};
		class lblFame: Life_RscStructuredText
		{
			idc = 1002;
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.00697734 * safezoneH + safezoneY;
			w = 0.135469 * safezoneW;
			h = 0.05;
			colorBackground[] = {0,0,0,0.6};
			class Attributes {
				align = "center";
				valign = "middle";
			};
		};
		class lblHand: Life_RscStructuredText
		{
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
	};
	class controls {};
};