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

			if (_damage > 0.15 && (vehicle player != player)) then {
				player action ["Eject", vehicle player]; 
				dmgHead=dmgHead+_damage; dmgBody=dmgBody+_damage;
				player setHit ["body",0.5];
				sleep 1;
			};

			if (dmgHead > dmgCap || dmgBody > dmgCap) then {
				dmgSkip = true; player setHit ["body",0.5];
				if (call fnc_hasDisadvantage) then { player setDamage 1; } else { player playAction "Unconscious"; player setDamage 0.8; sleep 2; };
				dmgSkip = false;
				
				_bleeding = round (300-(_damage*30));
				while { (alive player) && ((damage player) > 0.3) } do {
					titleText [format ["You are bleeding! You will die due blood loss in %1 seconds!",_bleeding],"PLAIN DOWN",0.2];
					_bleeding = _bleeding - 1;
					sleep 1;
					if (_bleeding < 1) then { player setDamage 1; };
				};
			};
		};
	};
};