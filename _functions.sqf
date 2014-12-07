if(!isDedicated) then {
  fnc_getItemArray = {
    _fncreturn = [];  
    switch (_this select 0) do {
      case 0: { _fncreturn = productionResources select (_this select 1); };
      case 1: { _fncreturn = productionComponents select (_this select 1); };
      case 2: { _fncreturn = vehiclesArray select (_this select 1); };
      case 3: { _fncreturn = placeableObjects select (_this select 1); };
    }; 
    _fncreturn
  };
  
  fnc_setMoney = {
    if (typename (_this select 1) == "SCALAR") then {
      private["_hud","_acc","_cash","_target"];
      disableSerialization;
      _hud = uiNameSpace getVariable ["mainOverlay",displayNull];
      
      _acc = PLAYERDATA select 1;
      _cash = PLAYERDATA select 2;
      
      switch (_this select 0) do {
        case 0: { PLAYERDATA set [2,_cash + (_this select 1)] };
        case 1: { PLAYERDATA set [1,_acc + (_this select 1)] };
      };
      
      _target = (_hud displayCtrl 1001);
      _target ctrlSetText format["$%2 || Bank: $%1",_acc,_cash];
      _target ctrlCommit 0; 
    };
  };
  
  fnc_setHand = {
    private["_hud","_id","_count","_string"];        
    disableSerialization;
    _hud = uiNameSpace getVariable ["mainOverlay",displayNull];
    _id = (handItems find handItem);
    
    _count = count handItems;
    if(_this == 1 && _count > 1) then { if (_id != 0) then { _id = _id-1; } else { _id = _count-1; };  };
    if(_this == 2 && _count > 1) then { if (_id != (_count-1)) then { _id = _id+1; } else { _id = 0; };  };
    
    _string = (handItems select _id);
    _target = (_hud displayCtrl 1003);
    handItem = _string;
    _target ctrlSetText _string;
    _target ctrlCommit 0;   
  };
  
  fnc_addInventoryItem = {
    private["_arr","_inv","_add","_count"];
    if (typename _this == "ARRAY") then {     
      _add = true;
      _inv = (PLAYERDATA select 3);
      _arr = _this call fnc_getItemArray; 
      
      for [{_x= 0},{_x < count _inv},{_x = _x + 1}] do
      {
        _sel = _inv select _x;
        if (((_sel select 0) == (_this select 0)) && ((_sel select 1) == (_this select 1))) exitWith {
          _add = false;
          _count = ((_sel select 2) + (_this select 2));
          if(_count <= 0) then {
            PLAYERDATA set [3,(_inv - [_sel])];
            if(typename _arr == "ARRAY") then {
              handItems = handItems - [_arr select 0];
              handItem = "Empty Hands";
              0 call fnc_setHand;
            };
          } else {
            ((PLAYERDATA select 3) select _x) set [2, _count];         
          };
        };  
      };
      
      if(_add) then {
        if(_this select 2 > 0) then { 
          PLAYERDATA set [3,_inv + [_this]];
          if(typename _arr == "ARRAY") then {
            if(_this select 0 == 1 && _arr select 2 && !((_arr select 0) in handItems)) then {
              handItems = handItems + [_arr select 0];
            };
          };         
        };
      };
    };
  };
};           