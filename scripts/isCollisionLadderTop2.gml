/*
Returns whether the object invoking this script is colliding with a ladder.
return
0:no collision
1:collision
*/

calculateCollisionBounds();

return (collision_line(lb,tb-2,rb,tb-2,oLadder,1,1)>0 && collision_line(lb,tb-3,rb,tb-3,oLadder,1,1)>0 && collision_line(lb,tb-4,rb,tb-4,oLadder,1,1)>0 && collision_line(lb,tb-5,rb,tb-5,oLadder,1,1)>0 && collision_line(lb,tb-6,rb,tb-6,oLadder,1,1)>0);

