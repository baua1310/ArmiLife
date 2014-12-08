_pPos = PLAYERDATA select 5;

if (_pPos == [0,0,0] || !alive player) then {
  // New or dead player
  _spawns = [[15973,15798,0],[17583,18222,0],[22276,14582,0],[8877,8176,0]];
  _randomSpawn = floor random count _spawns;
  _pPos = _spawns select _randomSpawn;
} else {
  // Reconnected player
};

PLAYERDATA set [5, _pPos];
waitUntil {alive player};
player setPos _pPos;