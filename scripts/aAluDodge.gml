if(state!=HANGING && state!=CLIMBING && state!=CLAMBER){
  dodgeTimer = 10;
  alarm[0] = dodgeTimer;
  moveCD = 25;
  dodgeCD = 30;
  fastMovement = 1;
  dodgeState = 1;
}
