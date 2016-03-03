_act = _this select 0;

switch (_act) do {
	case "openShop": {
		if(shopDialogOpen) exitWith {};
		_shop = _this select 1;
		if(typeName _shop == "OBJECT") then {
			if (!(createDialog "shop")) exitWith {hint "Shop - Dialog Error!";};
			disableSerialization; _display = findDisplay 1203;
			_lsBuy = _display displayCtrl 1500;
			_lsSell = _display displayCtrl 1501;

			setDescr = {
				private ["_display","_lsb","_ctrlId","_data","_price","_descr"];
				_display = findDisplay 1203;
				_ctrlId = _this select 0;
				
				_lsb = _display displayCtrl _ctrlId;
				_data = call compile (_lsb lbData (_this select 1));
				if ( (_this select 0) == 1500) then {
					btnShopBuyData = [_this select 2,_data];
				} else {
					btnShopSellData = [_this select 2,_data];
				};
				_price = _data select 2;

				_descr = "";
				switch _ctrlId do {
					case 1500: { _descr = format ["\n%1\nPrice: $%2",_data select 0,_price]; };
					case 1501: { _descr = format ["\n%1\nSell: $%2",_data select 0,_price/2]; };
				};
				(_display displayCtrl 1000) ctrlSetText _descr;
			};

			_shopArray = [];
			switch _shop do {
				case kavCarShop: { _shopArray = [56,61,62,63,64,66,72,73,74,57,60,69,70,71,58,59,75,77]; };
				case pyrCarShop: { _shopArray = [56,61,62,63,64,66,72,73,74,57,60,69,70,71,58,59,75,77]; };
				case kavCopCar: { _shopArray = [65,59]; };
				case busHq: { _shopArray = [67,68]; };
				case gasHq: { _shopArray = [76]; };
				default { systemChat "This shop seems currently closed..."; };
			};

			{
				_item = itemList select _x;
				_entry = _lsBuy lbAdd (_item select 0);
				_lsBuy lbSetData [_entry,str(_item)];
			} forEach _shopArray;
			
			{
				_vehData = _x getVariable "vehData";
				_item = _vehData select 2;
				_entry = _lsSell lbAdd (_item select 0);
				_lsSell lbSetData [_entry,str(_item)];
			} forEach vclKeys;
			
			_lsBuy ctrlAddEventHandler ["LBSelChanged",format ["[1500,_this select 1,%1] call setDescr;",_shop] ];
			_lsSell ctrlAddEventHandler ["LBSelChanged",format ["[1501,_this select 1,%1] call setDescr;",_shop] ];
		};
	};
	case "buy": {
		if ( !(isNil "btnShopBuyData") ) then {
			_shop = btnShopBuyData select 0;
			_itemData = btnShopBuyData select 1;
			_cost = _itemData select 2;
			if (PLAYERDATA select 2 >= _cost) then {			
				_tags = _itemData select 3;
				if ("vehicle" in _tags) then {
					_spawnMarker = format ["%1Spawn",_shop];
					_markerPos = getMarkerPos _spawnMarker;
					
					if(count (nearestObjects [_markerPos, ["AllVehicles"], 5]) > 0) exitWith { systemChat "Something is blocking the vehicle spawn!"; };
					[_itemData, _markerPos, markerDir _spawnMarker] execVM "items\spawn.sqf";

					["cash",-_cost] call fnc_setMoney;
				};
			} else { systemChat "I can't afford this."; };
		} else { systemChat "I want to buy one.. but which one?"; };
	};
	case "sell": {
		if ( !(isNil "btnShopSellData") ) then {
			_shop = btnShopSellData select 0;
			_itemData = btnShopSellData select 1;
			_cost = _itemData select 2;

			_cars = nearestObjects [player, [_itemData select 1] , 20];
			if (count _cars > 0) then {
				_vcl = _cars select 0;
				if(_vcl in vclKeys) then {
					vclKeys = vclKeys - [_vcl];
					["cash",_cost/2] call fnc_setMoney;
					deleteVehicle _vcl;
				} else { systemChat "I don't own that vehicle.."; };
			} else { systemChat "Hmn, maybe I should bring the vehicle a bit closer?"; };
		} else { systemChat "Ok, what should I sell?"; };
	};
};