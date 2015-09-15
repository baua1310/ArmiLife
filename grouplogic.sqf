_action = _this select 0;
_grpData = PLAYERDATA select 16;
_grpName = _groupData select 0;

switch (_action) do {
	case "list": {
		{
			_xData = (_x getVariable "pubPlrData");
			if(_grpName == _xData select 6) then { _num = _dlgls lbAdd (_xData select 14); _dlgls lbSetData [_num, _x]; };
		} forEach playerarray;
	};
};