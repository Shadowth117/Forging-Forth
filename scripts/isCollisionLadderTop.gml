/*
Returns whether the object invoking this script is colliding with a ladder.
return
0:no collision
1:collision
*/

calculateCollisionBounds();

return (collision_line(lb,tb-1,rb,tb-1,oLadder,1,1)>0);

