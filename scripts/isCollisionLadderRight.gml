/*
Returns whether the object invoking this script is colliding with a ladder.
return
0:no collision
1:collision
*/
var test;
calculateCollisionBounds();

return collision_rectangle(lb+9,tb+20,rb-1,bb-25,oLadder,1,1)>0;
