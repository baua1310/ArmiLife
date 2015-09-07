_action = _this select 0;

switch (_action) do {
	case "icall": {
		disableSerialization;
		waitUntil { !(isNull (findDisplay  602)) };
		((findDisplay  602) displayCtrl 633) ctrlAddEventHandler ["LBDblClick", "['gear_use',_this,0] execVM 'gearlogic.sqf'"]; // Uniform
		((findDisplay  602) displayCtrl 638) ctrlAddEventHandler ["LBDblClick", "['gear_use',_this,1] execVM 'gearlogic.sqf'"]; // West
		((findDisplay  602) displayCtrl 619) ctrlAddEventHandler ["LBDblClick", "['gear_use',_this,2] execVM 'gearlogic.sqf'"]; // Backpack
		((findDisplay  602) displayCtrl 640) ctrlAddEventHandler ["LBDblClick", "['gear_use',_this,3] execVM 'gearlogic.sqf'"]; // Container
		((findDisplay  602) displayCtrl 632) ctrlAddEventHandler ["LBDblClick", "['gear_use',_this,4] execVM 'gearlogic.sqf'"]; // Ground
	
		/* Geld
		_GMenu = (findDisplay  602) ctrlCreate ["RscText",1928];
		_GMenu ctrlSetPosition  [-0.07, 0.96, 0.36, 0.05];
		_GMenu ctrlSetBackgroundColor [0, 0, 0, 0.65];
		_GMenu ctrlCommit 0;
		_GMenustr = format ["Bargeld: €%1",0];
		_GMenu ctrlSetTooltip "Bargeld";
		_GMenu ctrlSetText _GMenustr;
		//Geld-Bank
		_GMenu2 = (findDisplay  602) ctrlCreate ["RscText",1928];
		_GMenu2 ctrlSetPosition  [0.338, 0.959, 0.36, 0.05];
		_GMenu2 ctrlSetBackgroundColor [0, 0, 0, 0.65];
		_GMenu2 ctrlCommit 0;
		_GMenu2str2 = format ["Kontostand: €%1",0];
		_GMenu2 ctrlSetTooltip "Kontostand";
		_GMenu2 ctrlSetText _GMenu2str2;
		//Karma */
		_GMenu3 = (findDisplay  602) ctrlCreate ["RscText",1928];
		_GMenu3 ctrlSetPosition  [0.698,0.959,0.201,0.05];
		_GMenu3str3 = format ["Karma: %1",0];
		_GMenu3 ctrlSetBackgroundColor [0, 0, 0, 0.65];
		_GMenu3 ctrlCommit 0;
		_GMenu3 ctrlSetTooltip "Karma is a Bi...";
		_GMenu3 ctrlSetText _GMenu3str3;
		//Schlüssel
		_GMenu4 = (findDisplay  602) ctrlCreate ["RscButton",1928];
		_GMenu4 ctrlSetPosition  [0.899,0.959,0.171,0.05];
		_GMenu4 ctrlSetBackgroundColor [0, 0, 0, 0.65];
		_GMenu4 ctrlCommit 0;
		_GMenu4 ctrlSetText "Schlüssel";
		_GMenu4 ctrlSetTooltip "Schlüssel";
		_GMenu4 buttonSetAction "createDialog 'Life_key_management';";
		//Hunger - ProgressBar
		_Hunger = if(100 >= 100)then{0.3555}else{((100 / 100)*0.3555);};
		_GMenu12 = (findDisplay  602) ctrlCreate ["RscText",1930];
		_GMenu12 ctrlSetPosition  [0.3425,-0.005,0,0.04];
		_GMenu12 ctrlSetBackgroundColor [0, 1, 0, 0.65];
		_GMenu12 ctrlCommit 0;
		//Hunger - Hintergrund
		_GMenu13 = (findDisplay 602) ctrlCreate ["RscText",1931];
		_GMenu13 ctrlSetPosition  [0.338,-0.01,0.3655,0.05];
		_GMenu13 ctrlSetBackgroundColor [0, 0, 0, 0.65];
		_GMenu13 ctrlCommit 0;
		_GMenu13 ctrlSetText "|- Hunger -";
		_GMenu13 ctrlSetTooltip "- Hunger -";
		//Durst - ProgressBar
		_Durst = if(100 >= 100)then{0.3555}else{((100 / 100)*0.3555);};
		_GMenu14 = (findDisplay  602) ctrlCreate ["RscText",1932];
		_GMenu14 ctrlSetPosition  [0.708,-0.005,_Durst,0.04];
		_GMenu14 ctrlSetBackgroundColor [0, 1, 0, 0.65];
		_GMenu14 ctrlCommit 0;
		//Durst = Hintergrund
		_GMenu15 = (findDisplay  602) ctrlCreate ["RscText",1933];
		_GMenu15 ctrlSetPosition  [0.704,-0.01,0.366,0.05];
		_GMenu15 ctrlSetBackgroundColor [0, 0, 0, 0.65];
		_GMenu15 ctrlCommit 0;
		_GMenu15 ctrlSetText "|- Durst -";
		_GMenu15 ctrlSetTooltip "- Durst -";
		//Gesundheit - Grüne Bar
		_GMenu16 = (findDisplay  602) ctrlCreate ["RscText",1934];
		_GMenu16 ctrlSetPosition [1.08,0.049,0.04,0.9];
		_GMenu16 ctrlSetBackgroundColor [0, 1, 0, 1];
		_GMenu16 ctrlCommit 0;
		//Gesundheit - Hintergrund (Grün wird abgeschwächt)
		_GMenu17 = (findDisplay  602) ctrlCreate ["RscText",1935];
		_GMenu17 ctrlSetPosition [1.075,0.039,0.05,0.92];
		_GMenu17 ctrlSetBackgroundColor [0, 0, 0, 0.65];
		_GMenu17 ctrlCommit 0;
		_GMenu17 ctrlSetTooltip "Gesundheit";
		//Gesundheit - schwarze Bar zum verdecken von Grüner Bar (Gesundheitsstatus)
		_HealthBar = if(damage player == 0)then{0}else{(0.9 * damage player)};
		_GMenu18 = (findDisplay  602) ctrlCreate ["RscText",1936];
		_GMenu18 ctrlSetPosition [1.08,0.049,0.04,0];
		_GMenu18 ctrlSetBackgroundColor [0, 0, 0, 1];
		_GMenu18 ctrlCommit 0;
		
		waitUntil { isNull (findDisplay  602) };
		INV_isOpen = false;
	};
};