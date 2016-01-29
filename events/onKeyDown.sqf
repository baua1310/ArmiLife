private["_handled", "_key", "_shift","_downKeys"];

_downKeys = [2,3,4,15];
_key     = _this select 1;
_handled = true;

if(!(_key in _downKeys)) then {
	_shift   = _this select 2; 
	switch (_key) do {
		default { _handled = false; };
	};
};

_handled