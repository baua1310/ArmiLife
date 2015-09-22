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
		
		_nutri = PLAYERDATA select 10;
		// Bounty
		_GMenu3 = (findDisplay  602) ctrlCreate ["RscText",1928];
		_GMenu3 ctrlSetPosition  [0.698,0.959,0.201,0.05];
		_GMenu3str3 = format ["Bounty: $%1",PLAYERDATA select 9];
		_GMenu3 ctrlSetBackgroundColor [0, 0, 0, 0.65];
		_GMenu3 ctrlCommit 0;
		_GMenu3 ctrlSetText _GMenu3str3;
		//Schlüssel
		_GMenu4 = (findDisplay  602) ctrlCreate ["RscButton",1928];
		_GMenu4 ctrlSetPosition  [0.899,0.959,0.171,0.05];
		_GMenu4 ctrlSetBackgroundColor [0, 0, 0, 0.65];
		_GMenu4 ctrlCommit 0;
		_GMenu4 ctrlSetText "Keys";
		_GMenu4 ctrlSetTooltip "Keys";
		_GMenu4 buttonSetAction "createDialog 'Life_key_management';";
		// Nutrition - ProgressBar
		_Durst = if(_nutri >= 100)then{0.721}else{((_nutri / 100)*0.721);};
		_GMenu14 = (findDisplay  602) ctrlCreate ["RscText",1932];
		_GMenu14 ctrlSetPosition [0.342,-0.005,_Durst,0.04];
		_GMenu14 ctrlSetBackgroundColor [0, 1, 0, 0.65];
		_GMenu14 ctrlCommit 0;
		// Nutrition - Hintergrund
		_GMenu15 = (findDisplay  602) ctrlCreate ["RscText",1933];
		_GMenu15 ctrlSetPosition [0.338,-0.01,0.732,0.05];
		_GMenu15 ctrlSetBackgroundColor [0, 0, 0, 0.65];
		_GMenu15 ctrlCommit 0;
		_GMenu15 ctrlSetText "Nutrition";
		_GMenu15 ctrlSetTooltip "Nutrition";
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