_itemData = _this select 0;
_pos = _this select 1;
_dir = _this select 2;
_class = _itemData select 1;

if (typeName _class == "STRING") then {
	if (isNil "_pos") then { _pos = getPosATL player; };
	if (isNil "_dir") then { _dir = getDir player; };
	
	_vcl = _class createVehicle _pos;
	_vcl setDir _dir;
	_vcl setPosATL _pos;
	_vcl setDamage 0;

	if (_vcl isKindOf "AllVehicles") then {
		_vcl lock true;
		_vcl setVariable ["vehData",[ getPlayerUID player, name player, _itemData ],true];
		vclKeys = vclKeys + [_vcl];

		switch (_class) do {
			case "RDS_Van_01_fuel_F": { _vcl addAction ["Deliver Fuel","jobs\patrol.sqf","gas",1,false,true,"","vehicle player != player"]; };
			default {
				if (_class in ["RDS_Ikarus_Civ_01","RDS_Ikarus_Civ_02"]) then {
					_vcl addAction ["Log Busstop","jobs\patrol.sqf","bus",1,false,true,"","vehicle player != player"];
				};
			};
		};
	};
	
	_vcl
};