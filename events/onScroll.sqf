removeAllActions player;
player addAction ["<t color='#FFA500'>ArmiPhone</t>","noscript.sqf",'createDialog "ArmiPhone"',20,false,true,"","('armiPhone' call INV_GetItemAmount) > 0"];