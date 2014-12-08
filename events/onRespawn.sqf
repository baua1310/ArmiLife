_pPos = PLAYERDATA select 5;

if (_pPos == [0,0,0] || !alive player) then {
  // New or dead player
  _spawns = [];
  _randomSpawn = floor random count _spawns;
  _pPos = _spawns select _randomSpawn;
} else {
  // Reconnected player
};

PLAYERDATA set [5, _pPos];
waitUntil {alive player};
player setPos _pPos;