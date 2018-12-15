if(state!=HANGING && state!=CLIMBING && state!=CLAMBER){
if(platformCharacterIs(IN_AIR) && spinJump){
  instance_create(x,y,oExplosion);
  wepCD=35;
} else if(combo==0){
  projCreate(10*facing,-10,oSmallFireShot, facing,12,1);
  wepCD = 15;
  moveCD = 15;
  dodgeCD = 10;
  xVel = 3*facing;
  combo++;
  comboWindow = 30;
  comboTimer = 0; 
} else if(combo==1){
  projCreate(10*facing,-20,oSmallFireShot, facing,12,1);
  projCreate(20*facing,-10,oSmallFireShot, facing,12,10);
  wepCD = 15;
  moveCD = 15;
  dodgeCD = 10;
  xVel = 5*facing;
  combo++;
  comboWindow = 30;
  comboTimer = 0; 
} else if(combo==2){
  projCreate(10*facing,-10,oFireShot, facing,12,20);
  wepCD = 45;
  moveCD = 45;
  dodgeCD = 45;
  xVel = 3*facing;
  combo=0;
  comboTimer = 0; 
} 
}
