/*
Returns whether the object invoking this script is colliding with a solid.
return
0:no collision
1:collision
*/
calcCollTurn();
return collision_rectangle(lb,tb,rb-15,bb-1,oSolid,1,1)>0;
