_stops = [];
_lastStop = 0;
_vclType = typeOf (vehicle player);

switch (_this select 3) do {
	case "bus": {
		switch _vclType do {
			case "RDS_Ikarus_Civ_01": { _stops = ["busPyrgos","busMilBase","busAnthrakia","busTelos","busAirport","busLakka","busAgios","busKore","busStadium","busKavala"]; };
			case "RDS_Ikarus_Civ_02": { _stops = ["busKavala","busStadium","busKore","busAgios","busLakka","busAirport","busTelos","busKalithea","busRodopoli","busParos","busAlmyra","busDelfinaki","busSofia","busMolos"]; };
			default { hintSilent "Illegal vehicle"; };
			
			_cnt = count _stops;
			if (_cnt > 0) then {
				_maxStops = _cnt-1;
				if(nextBusStop == 0) then { _lastStop = _maxStops; } else { _lastStop = nextBusStop-1; };
				
				_curStopMrkName = _stops select nextBusStop;
				_lastStopMrkName = _stops select _lastStop;
				
				_lastStop = getMarkerPos _lastStopMrkName;
				_curStop = getMarkerPos _curStopMrkName;
				
				if(speed (vehicle player) < 1) then {
					if ( ((getPosATL player) distance2D _curStop) < 40 ) then {
						_pay = (_lastStop distance2D _curStop)/3;
						["bank",_pay] call fnc_setMoney;
						if(nextBusStop == _maxStops) then { nextBusStop = 0; } else { nextBusStop = nextBusStop+1; };
						_nextStopMrkName = _stops select nextStop;
						systemChat format ["I earned $%1 for this trip. Next stop: %2",_pay,_nextStopMrkName];
					} else { systemChat format ["Either I'm too far away or this is the wrong stop... Next Stop: %1",_curStopMrkName]; };
				} else { systemChat "I'm driving too fast..."; };
			};
		};
	};
	case "gas": {
		if(_vclType == "RDS_Van_01_fuel_F") then {
			_stops = [["fs_feed_f"],5] call getMapObjects;
			if( isNil "lastGasPos") then { lastGasPos = [0,0,0]; };
			
			_cnt = count _stops;
			if (_cnt > 0) then {
				if(speed (vehicle player) < 1) then {
					if ( ((getPosATL player) distance2D lastGasPos) > 200 ) then {
						lastGasPos = getPosATL (vehicle player);
						["bank",50] call fnc_setMoney;
						systemChat "I earned $50 for this delivery.";
					} else { systemChat "This station is already full."; };
				} else { systemChat "I'm driving too fast..."; };
			};
		};
	};
};