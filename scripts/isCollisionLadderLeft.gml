/*
Returns whether the object invoking this script is colliding with a ladder.
return
0:no collision
1:collision
*/
var test;
calculateCollisionBounds();

return collision_rectangle(lb,tb+20,rb-10,bb-25,oLadder,1,1)>0;
