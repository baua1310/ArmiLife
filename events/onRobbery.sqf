_kind = _this select 0;

switch (_kind) do {
	case "bank": {
		if(lastBankRob+1800 > time) then {
			_bankId = _this select 1;
			_bankName = "Democratic";
			_bankmoney = bankSafes select _bankId;
			
			// Add Minimum of 5 cops
			if(count (weapons player) < 1) exitWith {systemChat "Robbing a bank without gun? I could just hand myself in...";};
			if(_bankmoney < 1000000) exitWith {systemChat "This bank has no money. It's simply not worth it..."};
			
			lastBankRob = time; publicVariable "canRobBank";
			_endRob = round(time)+300;
			
			if (_bankId == 1) then { _bankName = "Communist"; };
			{ titleText [format["$$$ The alarm of the %1 bank has been triggered! $$$",_bankName] "plain"]; } remoteExecCall ["BIS_fnc_call"];
			
			while {
				(_endRob > time) &&
				((player distance bankSafeNato) <= 100 || (player distance bankSafeCsat) <= 100) &&
				(alive player) &&
				!(player getVariable "restrained")
			} do { hintSilent format ["%1 seconds until the safe is cracked!",round(_endRob-time)]; sleep 1; };
			if(_endRob < time) exitWith { [["add","crime",format["$$ %1 was caught robbing the bank!",name player],"logs.sqf"] remoteExecCall ["BIS_fnc_execVM", -2]; };
			
			[5,"Collecting money...","AinvPknlMstpSnonWrflDnon_medic","AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] spawn fnc_timer;
			bankSafes set [_bankId,(bankSafes select _bankId)-50000]; publicVariable "bankSafes";
			[["add","crime","Someone successfully robbed the bank and stole $50k"],"logs.sqf"] remoteExec ["BIS_fnc_execVM", -2];
			
			["cash",50000] call fnc_setMoney; systemChat "I got 50k! Now I shall get my ass out of here!";
			robbedTotal = robbedTotal + 50000;		
		} else { systemChat "Doing a robbery during a robbery? Better not..."; };
	};
	case "shop": {
	
	};
	case "player": {
		_victim = _this select 1;
		if((animationState _victim) in moveSurrender) then {
			_pubPlrData = _victim getVariable "pubPlrData";
			_cash = (_pubPlrData select 1) select 0;
			_steal = _cash;
			if(_steal > 500) then { _steal=500;  };
			["cash",-_steal,"robbed"] remoteExecCall ["fnc_setMoney"];
			["cash",_steal] call fnc_setMoney;
			systemChat format["You stole $%1!",_steal];
		} else { systemChat "He hasn't even his hands up!"; };
	};
};