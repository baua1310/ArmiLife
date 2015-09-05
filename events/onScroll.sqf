removeAllActions player;
player addAction ["<t color='#FFA500'>ArmiPhone</t>","noscript.sqf",'createDialog "ArmiPhone"',20,false,true,"","('armiPhone' call INV_GetItemAmount) > 0"];
player addAction ["Unflip vehicle","noscript.sqf",'_vcl setvectorup [0.001,0.001,1]',1,false,true,"",'_vcl = (nearestobjects [getpos player, ["LandVehicle"], 10] select 0); player distance _vcl < 5'];