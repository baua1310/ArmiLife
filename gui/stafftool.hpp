class supportTool : lbPlayers {
	idd=100;
	movingEnable = true;
	enableSimulation = true;
	fadein=0;
	duration = 99999999999999999999999999999999999999999999;
	fadeout=0;
	name="supportTool";

	controls[] = {plrTitle, grpList, plrList, supportTitle, txtWarn, btnWarn, btnTS};
	controlsBackground[] = {plrBG,supportBG};
	objects[] = {};

	class supportBG : AL_RscBackground {
		x = 0.31 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.2 * safezoneW; h = 0.13 * safezoneH;	
	};

	class supportTitle : AL_RscText
	{
		idc = -1;
		text = "Support Tools";
		sizeEx = 0.04;
		x = 0.31 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0.2,0.8};
	};
	
	class txtWarn: RscEdit
	{
		idc = 1400;
		text = "";
		x = 0.315 * safezoneW + safezoneX;
		y = 0.21 * safezoneH + safezoneY;
		w = 0.19 * safezoneW;
		h = 0.033 * safezoneH;
	};
	
	class btnWarn: RscButtonMenu
	{
		idc = 2400;
		text = "Warn";
		x = 0.315 * safezoneW + safezoneX;
		y = 0.25 * safezoneH + safezoneY;
		w = 0.05 * safezoneW;
		h = 0.03 * safezoneH;
		colorBackground[] = {-1,-1,-1,0.8};
		onButtonClick = """warn"" execVM ""gui\stafftool.sqf"";";
	};
	
	class btnTS: RscButtonMenu
	{
		idc = 2400;
		text = "TS3";
		x = 0.37 * safezoneW + safezoneX;
		y = 0.25 * safezoneH + safezoneY;
		w = 0.0305 * safezoneW;
		h = 0.03 * safezoneH;
		colorBackground[] = {-1,-1,-1,0.8};
		onButtonClick = """teamspeak"" execVM ""gui\stafftool.sqf"";";
	};
};

class moderatorTool : supportTool {
	idd=100;
	movingEnable = true;
	enableSimulation = true;
	fadein=0;
	duration = 99999999999999999999999999999999999999999999;
	fadeout=0;
	name="moderatorTool";

	controls[] = {plrTitle, grpList, plrList, supportTitle, modTitle, txtWarn, btnWarn, btnTS, txtMod, btnChatban, btnRemoteCam};
	controlsBackground[] = {plrBG,supportBG,modBG};
	objects[] = {};

	class modBG : AL_RscBackground {
		x = 0.31 * safezoneW + safezoneX;
		y = 0.31 * safezoneH + safezoneY;
		w = 0.2 * safezoneW; h = 0.13 * safezoneH;	
	};

	class modTitle : AL_RscText
	{
		idc = -1;
		text = "Moderator Tools";
		sizeEx = 0.04;
		x = 0.31 * safezoneW + safezoneX;
		y = 0.31 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0.2,0.8};
	};
	
	class txtMod: RscEdit
	{
		idc = 1401;
		text = "";
		x = 0.315 * safezoneW + safezoneX;
		y = 0.36 * safezoneH + safezoneY;
		w = 0.19 * safezoneW;
		h = 0.033 * safezoneH;
	};
	
	class btnChatban: RscButtonMenu
	{
		idc = 2400;
		text = "Chatban";
		x = 0.315 * safezoneW + safezoneX;
		y = 0.4 * safezoneH + safezoneY;
		w = 0.07 * safezoneW;
		h = 0.03 * safezoneH;
		colorBackground[] = {-1,-1,-1,0.8};
		onButtonClick = """chatban"" execVM ""gui\stafftool.sqf"";";
	};
	
	class btnRemoteCam: RscButtonMenu
	{
		idc = 2401;
		text = "Remote Cam";
		x = 0.39 * safezoneW + safezoneX;
		y = 0.4 * safezoneH + safezoneY;
		w = 0.09 * safezoneW;
		h = 0.03 * safezoneH;
		colorBackground[] = {-1,-1,-1,0.8};
		onButtonClick = """remoteCam"" execVM ""gui\stafftool.sqf"";";
	};
	class btnCleanServer: RscButtonMenu
	{
		idc = 2401;
		text = "Clean Server";
		x = 0.48 * safezoneW + safezoneX;
		y = 0.4 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.03 * safezoneH;
		colorBackground[] = {-1,-1,-1,0.8};
		onButtonClick = """cleanServer"" execVM ""gui\stafftool.sqf"";";
	};
};

class devcon {
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	fadein=0;
	duration = 99999999999999999999999999999999999999999999;
	fadeout=0;
	name="devcon";
  
	class controlsBackground {
		class bgAdmin: AL_RscText
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
		class txtCmd: RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btnExec: RscButtonMenu
		{
			idc = 2400;
			text = "Execute";
			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
			onButtonClick = "0 execVM ""gui\devcon.sqf"";";
		};
		class btnTeleport: RscButtonMenu
		{
			idc = 2401;
			text = "Teleport";
			x = 0.108125 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
			onButtonClick = "1 execVM ""gui\devcon.sqf"";";
		};
		class btnTP2ME: RscButtonMenu
		{
			idc = 2402;
			text = "Teleport to me";
			x = 0.164844 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
			onButtonClick = "2 execVM ""gui\devcon.sqf"";";
		};
	};
};