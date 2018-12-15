/*
Calculates the exact, non-relative collision bounds.
return
lb,tb,rb,bb
*/

//left bounds, top bounds, ect.
lb=x+collTurnLeftX-14;
tb=y+collTurnTopY;
rb=x+collTurnRightX+14;
bb=y+collTurnBottomY;
