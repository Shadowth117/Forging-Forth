/*
Returns whether the object invoking this script is colliding with a ladder.
return
0:no collision
1:collision
*/
calculateCollisionBounds();
var test = collision_rectangle(lb+6,tb,rb-7,bb-1,oLadderHoriz,1,1)>0;
if(test > 0){
  horizClimb = 1;
}
return test;
