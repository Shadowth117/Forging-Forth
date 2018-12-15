if(state!=HANGING && state!=CLIMBING && state!=CLAMBER && kDown && !platformCharacterIs(IN_AIR) && !turning){
  dodgeTimer = 40;
  alarm[0] = dodgeTimer;
  moveCD = 40;
  dodgeCD = 30;
  wepCD = 40;
  fastMovement = 1;
  dodgeState = 2;
}
