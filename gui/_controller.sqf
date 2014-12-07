_action = _this select 0;            

switch (_action) do {
  case "init": {
    private ["_hud","_target"];
    2 cutRsc ["mainOverlay","PLAIN"];
    
    disableSerialization;
    _hud = uiNameSpace getVariable ["mainOverlay",displayNull];    
    _money = (_hud displayCtrl 1001);
    _money ctrlSetText format["$%2 || Bank: $%1",PLAYERDATA select 1,PLAYERDATA select 2];
    
    _faction = (_hud displayCtrl 1000);
    _sFaction = "";
    if (PLAYERDATA select 6 == 0) then { _sFaction = _sFaction + "Stranded Citizen"; };
    _faction ctrlSetText _sFaction;
    
    _money ctrlCommit 0;
    _faction ctrlCommit 0;
        
    0 call fnc_setHand;
  };
  case "inv": {
    if(!dialog) then { createDialog "playerSettings"; };
    disableSerialization;
    _display = findDisplay 2001;
    (_display displayCtrl 2015) ctrlSetText format [" Cash: $%2\n Bank: $%1",(PLAYERDATA select 1),(PLAYERDATA select 2)];
    
    {      
      _amount = _x select 2;
      _itemarr = _x call fnc_getItemArray;
      if(_x select 0 == 0) then { _itemarr = [_itemarr]; };
      (_display displayCtrl 2005) lbAdd format["%1 (%2)",(_itemarr select 0),_amount];
    } forEach (PLAYERDATA select 3);
    
    _lics = "";
    {
      _lics = _lics + format["%1\n",(licenseArray select _x) select 0];
    } forEach (PLAYERDATA select 4);
    (_display displayCtrl 2014) ctrlSetText _lics;
  };
};