_action = _this select 0;

switch (_action) do {
	case "restrain": {
		_target = _this select 1;
		if((animationState player) in moveSurrender) then { _target setVariable ["restrained",true,true]; }
	};
	default { };
};