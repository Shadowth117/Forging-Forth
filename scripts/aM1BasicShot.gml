pSpd = 12;

if(!instance_exists(oM1BasicShot1) && state!=CLAMBER){
  if(state != HANGING){
    var shot = instance_create(x+10*facing,y-10,oM1BasicShot1);
  } else {
    var shot = instance_create(x+10*hangLook,y-10,oM1BasicShot1);
  }
  wepCD = 15; 
  oM1BasicShot1.spd = pSpd;
  if(kUp && isCollisionLadderHoriz()==0 && state != HANGING){
      oM1BasicShot1.dir = 0;
    } else {
      oM1BasicShot1.dir = facing;
    }
  if(state == HANGING){
    hangLook = -facing;
    oM1BasicShot1.dir = -facing;
  }
}

