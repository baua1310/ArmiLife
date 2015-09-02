if((alive player) && !dmgSkip) then {
	_vehicle	= _this select 0;
	_vcls		= nearestObjects [getPos _vehicle, ["LandVehicle", "Air", "ship"],8];
	_selection	= _this select 1;
	_damage		= _this select 2;
	_shooter	= _this select 3;
	_ammo		= _this select 4;
	_vcl		= _vcls select 0;
	
	if(vehicle player == player && (_ammo in ["ammoType"])) then {
	// stunned
	} else {
		if(
			[player, "capKavala"] call fnc_isInMarker ||
			[player, "capPyrgos"] call fnc_isInMarker
		) exitWith { dmgSkip = true; systemChat "Some mystical power saved you from death."; sleep 5; dmgSkip = false; };
		
		if(alive player) then {
			switch (_selection) do {
				case "head_hit": { dmgHead = dmgHead + _damage; };
				case "body": { dmgBody = dmgBody + _damage; };
				case "hands": { dmgHands = dmgHands + _damage; player setHit ["hands",dmgHands]; };
				case "legs": { dmgLegs = dmgLegs + _damage; player setHit ["legs",dmgLegs]; };
			};
	
			if (dmgHead > dmgCap || dmgBody > dmgCap) then {
				dmgSkip = true;
				player playAction "Unconscious";
				dmgSkip = false;
			};
		};
	};
};