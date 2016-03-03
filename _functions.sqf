// ["capBorder",0,50] call fnc_set_sector;
fnc_set_sector = {
	private ["_markerName","_newOwner","_elec"];
	_markerName = _this select 0;
	_newOwner = _this select 1;
	_elec = _this select 2;
	
	for "_k" from 0 to ((count(capAreas))-1) do
	{
		_curCap = capAreas select _k; 
		if (_curCap select 0 == _markerName) exitWith {
			_curCap set [1,_newOwner];
			_curCap set [2,_elec];
			capAreas set [_k,_curCap];
		};
	};
	
	switch (_newOwner) do {
		case 1: { _markerName setMarkerColor "ColorWEST"; };
		case 2: { _markerName setMarkerColor "ColorEAST"; };
		case 3: { _markerName setMarkerColor "ColorGUER"; };
	};
};

if(!isDedicated) then {
	/*
	* DO NOT REMOVE THIS COMMENT!
	* Script written by Armitxes.
	* For usage visit: http://forums.bistudio.com/showthread.php?192645-RELEASE-Map-Interaction-Script
	*/  
	getMapObjects = {
		private ["_check","_near","_haystack","_compare","_needle"];
		_check = _this select 0; _distance = _this select 1; _near = [];
		
		_haystack = [];
		{ _haystack = _haystack + (toArray str(_x)); } forEach ((nearestObjects [player, [], _distance]) - [player]);
		
		{
			_needle = toArray _x;
			_needleLength = count _needle;
			
			for [{_i=0}, {_i<(count _haystack)}, {_i=_i+1}] do {
				if((_haystack select _i) == (_needle select 0) && (_haystack select (_i+1)) == (_needle select 1)) then {
					_compare = [];
					for [{_l=0}, {_l<_needleLength}, {_l=_l+1}] do {
						_compare = _compare + [_haystack select (_i+_l)];
					};
					if(count (_compare-_needle) == 0) then { _near = _near + [_x]; };
				};
			};    
		} forEach _check;
		_near
	};

	fnc_setMoney = {
		if (typeName (_this select 1) == "SCALAR") then {
			private["_hud","_acc","_cash","_target","_pubPlrData"];
			disableSerialization;
			_hud = uiNameSpace getVariable ["mainOverlay",displayNull];
			_pubPlrData = player getVariable "pubPlrData";
			
			_acc = round((PLAYERDATA select 1) + (_this select 1));
			_cash = round((PLAYERDATA select 2) + (_this select 1));
			
			switch (_this select 0) do {
				case "cash": { _pubPlrData set [1,[_cash,PLAYERDATA select 1]]; PLAYERDATA set [2,_cash]; };
				case "bank": { _pubPlrData set [1,[PLAYERDATA select 2,_acc]]; PLAYERDATA set [1,_acc]; };
			};

			player setVariable ["pubPlrData",_pubPlrData,true];
			if(count _this > 2) then {
				_log = _this select 2;
				if (typeName _log == "ARRAY") then {
					(["add","finances"] + _log) execVM "logs.sqf";
				} else {
					_txt = format ["%1 [ %2 ] might me using money cheats!",name player,getPlayerUID player];
					[ [["add","staffonly",_txt],"logs.sqf"] ,"BIS_fnc_execVM",_tar,false ] call BIS_fnc_MP;
				};
			};
			
			_target = (_hud displayCtrl 1001);
			_target ctrlSetText format["$%2 || Bank: $%1",PLAYERDATA select 1,PLAYERDATA select 2];
			_target ctrlCommit 0;
		};
	};
	
	fnc_updateCurCap = {
		private ["_hud","_texture","_target"];
		_texture = "\A3\Data_F\Flags\Flag_white_CO.paa";
		switch (curCap select 1) do {
			case 0: {_texture = "\A3\Data_F\Flags\Flag_white_CO.paa"};
			case 1: {_texture = "\A3\Data_F\Flags\Flag_nato_CO.paa";};
			case 2: {_texture = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";};
			case 3: {_texture = "\A3\Data_F\Flags\Flag_FIA_CO.paa";};
		};
		disableSerialization;
		_hud = uiNamespace getVariable ["mainOverlay",displayNull];
		_target = _hud displayCtrl 1004;
		_target ctrlSetText _texture;
		_target ctrlCommit 0;
	};

	fnc_setHand = {
		private ["_hud","_id","_count","_string","_target"];
		disableSerialization;
		_hud = uiNamespace getVariable ["mainOverlay",displayNull];

		_count = count handItems;
		if(_this == 1 && _count > 1) then { if (handItem != 0) then { handItem = handItem-1; } else { handItem = _count-1; };  };
		if(_this == 2 && _count > 1) then { if (handItem != (_count-1)) then { handItem = handItem+1; } else { handItem = 0; };  };

		_string = handItems select handItem;
		_target = _hud displayCtrl 1003;
		_target ctrlSetText _string;
		_target ctrlCommit 0;
	};
	
	fnc_setNutrition = {
		_amount = _this select 0;
		if(_amount > 0) then { playSound3D ["ArmiLife_Sounds\Man\eating.ogg",player,false,position player, 1, 1, 35]; };
		if (typeName _amount == "SCALAR") then {
			PLAYERDATA set [10, (PLAYERDATA select 10)+_amount];
			if((PLAYERDATA select 10) > 100) then {PLAYERDATA set [10,100];};
		};
	};
  
	fnc_getItemAmount = {
		private ["_sArray","_findItem"];
		_result = 0;
		_sArray = _this select 0;
		_findItem = _this select 1;

		{
			if((_x select 0) == (_findItem select 0) && (_x select 1) == (_findItem select 1)) then {
				_result = _x select 2;
			};
		} forEach _sArray;
		_result;
	};

	// call with check = ["markerpoint", "markertocheckagainst"] call fnc_isInMarker; for markers
	// call with check = [object, "markertocheckagainst"] call fnc_isInMarker; for objects
	fnc_isInMarker = {
		private ["_p","_m", "_px", "_py", "_mpx", "_mpy", "_msx", "_msy", "_rpx", "_rpy", "_xmin", "_xmax", "_ymin", "_ymax", "_ma", "_res", "_ret"];
		
		_p = _this select 0; // object
		_m = _this select 1; // marker
		_ret = false;
		
		if (typeName _p == "OBJECT") then {
			_px = position _p select 0;
			_py = position _p select 1;
		} else {
			_px = getMarkerPos _p select 0;
			_py = getMarkerPos _p select 1;
		};
		
		_mpx = getMarkerPos _m select 0;
		_mpy = getMarkerPos _m select 1;
		_msx = getMarkerSize _m select 0;
		_msy = getMarkerSize _m select 1;
		_ma = -markerDir _m;
		_rpx = ( (_px - _mpx) * cos(_ma) ) + ( (_py - _mpy) * sin(_ma) ) + _mpx;
		_rpy = (-(_px - _mpx) * sin(_ma) ) + ( (_py - _mpy) * cos(_ma) ) + _mpy;
		if ((markerShape _m) == "RECTANGLE") then {
			_xmin = _mpx - _msx;_xmax = _mpx + _msx;_ymin = _mpy - _msy;_ymax = _mpy + _msy;
			if (((_rpx > _xmin) && (_rpx < _xmax)) && ((_rpy > _ymin) && (_rpy < _ymax))) then { _ret=true; };
		} else {
			_res = (((_rpx-_mpx)^2)/(_msx^2)) + (((_rpy-_mpy)^2)/(_msy^2));
			if ( _res < 1 ) then { _ret=true; };
		};

		_ret;
	};
	
	fnc_timer = {
		private ["_dsp","_op","_rt","_time","_smove","_txt"];
		_time = _this select 0;
		_txt =  _this select 1;
		_smove = _this select 2;
		_emove = _this select 3;
		if (typeName _time == "SCALAR") then {
			if (!(createDialog "progressBar")) exitWith {hint "Dialog Error!"; true};
			if (!isNil "_smove") then { player playMove _smove; };
			disableSerialization;
			_dsp = findDisplay 2459;
			(_dsp displayCtrl 1) progressSetPosition 1;
			(_dsp displayCtrl 2) ctrlSetText _txt;
			_op = ( _time / 100 );
			_rt = _time;
			while { _time >= 1 } do {
				_time = _time - 1;
				sleep 1;
				_rt = _time / _op;
				(_dsp displayCtrl 1) progressSetPosition (_rt/100);
			};
			if (!isNil "_emove") then { player playMove _emove; };
			closeDialog 2459;
		} else {diag_log "ERROR: fnc_timer - param not scalar";};
		true;
	};

	fnc_getGearItems = {
		private ["_got"];
		_got = [];
		{
			_add = true;
			for [{_i = 0;}, {_i < count _got}, {_i=_i+1;}] do {
				_entry = (_got select _i); _cn = (_got select _i) select 0;
				if(_cn == _x) exitWith { _entry set [1,(_entry select 1)+1]; _got set [_i,_entry]; _add=false; }
			};
			if(_add) then { _got = _got + [ [ _x, 1 ] ]; };
		} forEach (items player);
		_got;
	};

	fnc_setBounty = {
		if (typeName (_this select 0) == "SCALAR") then {
			PLAYERDATA set [9,(PLAYERDATA select 9) + (_this select 0)];
			_pubPlrData = player getVariable "pubPlrData";
			_pubPlrData set [5,PLAYERDATA select 9];
			player setVariable ["pubPlrData",_pubPlrData,true];
		};
	};

	fnc_getNation = {
		private ["_faction"];
		_faction = "Refugee";
		switch (_this) do {
			case 1: { _faction = "Democratic Republic"; };
			case 2: { _faction = "Communists"; };
			case 3: { _faction = "Anarchists"; };
		};
		_faction;
	};

	fnc_setBankMoney = {
		private ["_bankId","_amount"];
		// 0 = NATO, 1 = CSAT
		_bankId = _this select 0; _amount = _this select 1;
		if (_bankId < 2 && (typeName _amount) == "SCALAR") then {
			bankSafes set [_bankId,(bankSafes select _bankId)-_amount]; publicVariable "bankSafes";
		};
	};

	fnc_isBusy = {
		private ["_moveBusy","_ret"];
		_ret = false;
		_moveBusy = [
			"ainvpknlmstpsnonwrfldnon_ainvpknlmstpsnonwrfldnon_medic",
			"ainvpknlmstpsnonwrfldnon_medicend",
			"amovpercmstpsnonwnondnon_ainvpknlmstpsnonwnondnon",
			"ainvpknlmstpsnonwrfldnon_medic",
			"unconscious"
		];
		if ( (animationState player) in _moveBusy || !((findDisplay 2459) isEqualTo displayNull) ) then { _ret = true; };
		_moveBusy = nil; _ret;
	};
	
	// Is unconscious, is restrained?
	fnc_hasDisadvantage = {
		private ["_moveBusy","_ret"];
		_ret = false;
		_moveBusy = [
			"unconscious"
		];
		if ( (animationState player) in _moveBusy || !((findDisplay 2459) isEqualTo displayNull) ) then { _ret = true; };
		_moveBusy = nil; _ret;
	};
};