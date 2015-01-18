_items = PLAYERDATA select 12;

if (typeName _this == "ARRAY") then {
  _itemArr = _this call fnc_getItemArray;
  _prodArray = _itemArr select 2;
  
  _prodItems = _prodArray select 0;
  
  _canProduce = true;
  {
    _amount = [PLAYERDATA select 12, _x] call fnc_getItemAmount;
    if(_this select 2 > _amount) exitWith { _canProduce = false; };
  } forEach _prodItems;
  
  if(_canProduce) then {
    {
      [12,-(_x select 2)] call fnc_addInventoryItem;
    } forEach _prodItems;
    
    [12,(_prodArray select 1)] call fnc_addInventoryItem;
  };
};