/*
Returns whether the object invoking this script is colliding with a ladder.
return
0:no collision
1:collision
*/
var test;
calculateCollisionBounds();
if(collision_rectangle(lb+6,tb,rb-7,bb-1,oLadderHoriz,1,1)>0){
  test = 0;
} else {
  test = collision_rectangle(lb,tb,rb-1,bb-35,oLadder,1,1)>0;
}
if(test > 0){
  horizClimb = 0;
}
return test;
