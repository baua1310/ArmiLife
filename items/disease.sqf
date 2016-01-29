healed = false;
_disease = _this select 0;

switch (_disease) do {
	case "hiv": {
		systemChat "I feel hot..."; sleep 200; if (healed) exitWith {};
		systemChat "Something is wrong with me, I should visit the doc.";
		player setHit ["body",0.1]; sleep 100; if (healed) exitWith {};
		systemChat "I feel so terrible"; player setHit ["hands",1]; player setHit ["legs",1];
		if (healed) exitWith {}; sleep 300; if (healed) exitWith {};
		systemChat "I feel sleepy..."; sleep 5; player setDamage 1;
	};
	case "ebola": {
		systemChat "I feel hot..."; sleep 200; if (healed) exitWith {};
		systemChat "Something is wrong with me, I should visit the doc.";
		player setHit ["body",0.1]; sleep 100; if (healed) exitWith {};
		systemChat "I feel so terrible"; player setHit ["hands",1]; player setHit ["legs",1];
		if (healed) exitWith {}; sleep 300; if (healed) exitWith {};
		systemChat "I feel sleepy..."; sleep 5; player setDamage 1;
	};
};