/*
This script should be placed in the step event for the platform character.
It updates the keys used by the character, moves all of the solids, moves the
character, sets the sprite index, and sets the animation speed for the sprite.
*/

//Manage cooldowns
if(wepCD > 0){ 
  wepCD--; 
} else {
  wepCD = 0;
}
if(moveCD > 0){ 
  moveCD--; 
} else {
  moveCD = 0;
  if(richJump == 0){
    fastMovement = 0;
    dodgeState = 0;
  }
}
if(dodgeCD > 0){ 
  dodgeCD--; 
} else {
  dodgeCD = 0;
}
if(dodgeTimer > 0){ 
  dodgeTimer--; 
} else {
  dodgeTimer = 0;
}
if(comboTimer == comboWindow) {
  combo = 0;
  comboTimer = 0;
} else if(combo > 0){
  comboTimer++;
}

if (player=1 && !gamepad_is_connected(0)) {
  // updates the keys
  // key left
  kLeftReleased=0;
  if (kLeft) {
    kLeft=keyboard_check(vk_left);
    kLeftPushedSteps+=1;
    kLeftPressed=0;
    if (kLeft=0) {kLeftReleased=1;}
  }
  else {
    kLeft=keyboard_check(vk_left);
    if (kLeft) {kLeftPressed=1;}
    kLeftPushedSteps=0;
  }
  // key right
  kRightReleased=0;
  if (kRight) {
    kRight=keyboard_check(vk_right);
    kRightPushedSteps+=1;
    kRightPressed=0;
    if (kRight=0) {kRightReleased=1;}
  }
  else {
    kRight=keyboard_check(vk_right);
    if (kRight) {kRightPressed=1;}
    kRightPushedSteps=0;
  }
  // key up
  if (kUp) {
    kUp=keyboard_check(vk_up);
    kUpPressed=0;
  }
  else {
    kUp=keyboard_check(vk_up);
    if (kUp) {kUpPressed=1;}
  }
  // key down
  if (kDown) {
    kDown=keyboard_check(vk_down);
    kDownPressed=0;
  }
  else {
    kDown=keyboard_check(vk_down);
    if (kDown) {kDownPressed=1;}
  }
  // key "run"
  //if (canRun) {kRun=keyboard_check(vk_shift);} else {
  kRun=1;
  //}
  // key "jump"
  if (kJump) {
    kJump=keyboard_check(ord('Z'));
    kJumpPressed=0;
  }
  else {
    kJump=keyboard_check(ord('Z'));
    if (kJump) {kJumpPressed=1;}
  }
  // key "attack1"
  if (kAtk1) {
    kAtk1=keyboard_check(ord('X'));
    kAtk1Pressed=0;
  }
  else {
    kAtk1=keyboard_check(ord('X'));
    if (kAtk1) {kAtk1Pressed=1;}
  }
  // key "attack2"
  if (kAtk2) {
    kAtk2=keyboard_check(ord('C'));
    kAtk2Pressed=0;
  }
  else {
    kAtk2=keyboard_check(ord('C'));
    if (kAtk2) {kAtk2Pressed=1;}
  }
  // key Body Ability
  if (kBody) {
    kBody=keyboard_check(ord('F'));
    kBodyPressed=0;
  }
  else {
    kBody=keyboard_check(ord('F'));
    if (kBody) {kBodyPressed=1;}
  }
  // key Leg Ability
  if (kLegs) {
    kLegs=keyboard_check(ord('A'));
    kLegsPressed=0;
  }
  else {
    kLegs=keyboard_check(ord('A'));
    if (kLegs) {kLegsPressed=1;}
  }
  // key Arm1 Ability
  if (kArms1) {
    kArms1=keyboard_check(ord('S'));
    kArms1Pressed=0;
  }
  else {
    kArms1=keyboard_check(ord('S'));
    if (kArms1) {kArms1Pressed=1;}
  }
  // key Arm2 Ability
  if (kArms2) {
    kArms2=keyboard_check(ord('D'));
    kArms2Pressed=0;
  }
  else {
    kArms2=keyboard_check(ord('D'));
    if (kArms2) {kArms2Pressed=1;}
  }
  // key Arm Swap
  if (kDodge) {
    kDodge=keyboard_check(ord('V'));
    kDodgePressed=0;
  }
  else {
    kDodge=keyboard_check(ord('V'));
    if (kDodge) {kDodgePressed=1;}
  }
} else if (player=1 && gamepad_is_connected(0)) {
  // updates the keys
  // key left
  kLeftReleased=0;
  if (kLeft) {
    kLeft=gamepad_button_check(0,gp_padl);
    kLeftPushedSteps+=1;
    kLeftPressed=0;
    if (kLeft=0) {kLeftReleased=1;}
  }
  else {
    kLeft=gamepad_button_check(0,gp_padl);
    if (kLeft) {kLeftPressed=1;}
    kLeftPushedSteps=0;
  }
  // key right
  kRightReleased=0;
  if (kRight) {
    kRight=gamepad_button_check(0,gp_padr);
    kRightPushedSteps+=1;
    kRightPressed=0;
    if (kRight=0) {kRightReleased=1;}
  }
  else {
    kRight=gamepad_button_check(0,gp_padr);
    if (kRight) {kRightPressed=1;}
    kRightPushedSteps=0;
  }
  // key up
  kUp=gamepad_button_check(0,gp_padu);
  // key down
  kDown=gamepad_button_check(0,gp_padd);
  // key "run"
  //if (canRun) {kRun=keyboard_check(vk_shift);} else {
  kRun=1;
  //}
  // key "jump"
  if (kJump) {
    kJump=gamepad_button_check(0,gp_face1);
    kJumpPressed=0;
  }
  else {
    kJump=gamepad_button_check(0,gp_face1);
    if (kJump) {kJumpPressed=1;}
  }
  // key "attack1"
  if (kAtk1) {
    kAtk1=gamepad_button_check(0,gp_face3);
    kAtk1Pressed=0;
  }
  else {
    kAtk1=gamepad_button_check(0,gp_face3)
    if (kAtk1) {kAtk1Pressed=1;}
  }
  // key "attack2"
  if (kAtk2) {
    kAtk2=gamepad_button_check(0,gp_face4)
    kAtk2Pressed=0;
  }
  else {
    kAtk2=gamepad_button_check(0,gp_face4)
    if (kAtk2) {kAtk2Pressed=1;}
  }
  // key Body Ability
  if (kBody < -0.5) {
    kBody=gamepad_axis_value(0, gp_axisrv);
    kBodyPressed=0;
  }
  else {
    kBody=gamepad_axis_value(0, gp_axisrv);
    if (kBody < -0.5) {kBodyPressed=1;}
  }
  // key Leg Ability
  if (kLegs > 0.5) {
    kLegs=gamepad_axis_value(0, gp_axisrv);
    kLegsPressed=0;
  }
  else {
    kLegs=gamepad_axis_value(0, gp_axisrv);
    if (kLegs > 0.5) {kLegsPressed=1;}
  }
  // key Arm1 Ability
  if (kArms1 < -0.5) {
    kArms1=gamepad_axis_value(0, gp_axisrh);
    kArms1Pressed=0;
  }
  else {
    kArms1=gamepad_axis_value(0, gp_axisrh);
    if (kArms1 < -0.5) {kArms1Pressed=1;}
  }
  // key Arm2 Ability
  if (kArms2 > 0.5) {
    kArms2=gamepad_axis_value(0, gp_axisrh);
    kArms2Pressed=0;
  }
  else {
    kArms2=gamepad_axis_value(0, gp_axisrh);
    if (kArms2 > 0.5) {kArms2Pressed=1;}
  }
  // key Arm Swap
  if (kDodge) {
    kDodge=gamepad_button_check(0,gp_face2);
    kDodgePressed=0;
  }
  else {
    kDodge=gamepad_button_check(0,gp_face2);
    if (kDodge) {kDodgePressed=1;}
  }
}

//Check if colliding with a power up and if so, take it if the correct button is pressed
abi = instance_place(x,y,oPowerUp);
if(abi != noone){
  if(kBodyPressed){
    bodyAbility = abi.ability;
    instance_destroy(abi);
  } else
  if(kLegsPressed){
    legAbility = abi.ability;
    instance_destroy(abi);
  } else
  if(kArms1Pressed){
    armAbility1 = abi.ability;
    currentArmAbility = armAbility1;
    curArmTrack = 1;
    instance_destroy(abi);
  } else
  if(kArms2Pressed){
    armAbility2 = abi.ability;
    currentArmAbility = armAbility2;
    curArmTrack = 2;
    instance_destroy(abi);
  }
}

/*
//Handle Arm ability
if(curArmTrack == 0){
    currentArmAbility = armAbility2;
} else {
    currentArmAbility = armAbility1;
}*/

/*
//Swap Arm power between 1 and 2
if(kDodgePressed){
  if(curArmTrack == 0){
    curArmTrack = 1;
    currentArmAbility = armAbility2;
  } else {
    curArmTrack = 0;
    currentArmAbility = armAbility1;
  }
}
*/

//Attack buttons
if(kAtk1Pressed){
  currentArmAbility = armAbility1;
} else if(kAtk2Pressed){
  currentArmAbility = armAbility2;
}

//Pressed Attacks
if((kAtk1Pressed || kAtk2Pressed) && wepCD == 0){
  switch(currentArmAbility){
    case 0:
      break;
    case 1:
      aFireFists();
      break;
    default:
      break;
  }
}

//Held Attacks
if((kAtk1|| kAtk2) && wepCD == 0){
  switch(currentArmAbility){
    case 0:
      aM1BasicShot();
      break;
    case 1:
      break;
    default:
      break;
  }
}

//Pressed Dodges
if(kDodgePressed && dodgeCD == 0){
    switch(legAbility){
    case 0:
      aAluDodge();
      break;
    case 1:
      aRichDodge();
      break;
    default:
      break;
  }
}

//Held Dodges
if(kDodgePressed && dodgeCD == 0){
    switch(legAbility){
    case 0:
      break;
    case 1:
      break;
    default:
      break;
  }
}

// deals with the ladderTimer
if (state=CLIMBING) {
   ladderTimer=10;
} else {
   if (ladderTimer>0) {ladderTimer-=1;}
}
// allows the character to run left and right
if ((state!=CLIMBING && state != DUCKING && state != LOOKING_UP && state!=HANGING && state!=CLAMBER && moveCD == 0)) {
  //if ((kLeftReleased) and (approximatelyZero(xVel))) {xAcc-=0.5;}
  //if ((kRightReleased) and (approximatelyZero(xVel))) {xAcc+=0.5;}
  if (kLeft) {
    if(facing == RIGHT && turning == 0 && !kRight && !rightTurn) {
      if(richJump == 1){
        richJump = 0;
        dodgeCD = 60;
        fastMovement = 0;
        dodgeState = 0;
      }
      turning = 1;
      xAcc = 0;
      leftTurn = 1;
      image_index = 0;
    }
    pushed = 6 - kLeftPushedSteps;
    if(pushed <= 0){
      pushed = 1;
    }
    if (((kLeftPushedSteps>0) or  (isCollisionMoveableSolidRight(1))) and ((facing=LEFT) or (approximatelyZero(xVel)))) {
      if(!turning || state == JUMPING || state == FALLING) {     
        xAcc-=runAcc / pushed;
        if(slowFall){
          xAcc+=airAcc / pushed;
        }
      }
    }
    if(canturn == 1 || spinJump){ 
      if(canturn) {
        //x -= TurnOffset;
        canturn = 0;
      }
    }
    facing=LEFT;
  } else if (kRight) {
    if(facing == LEFT && turning == 0 && !kLeft && !leftTurn) {
      if(richJump == 1){
        richJump = 0;
        dodgeCD = 60;
        fastMovement = 0;
        dodgeState = 0;
      }
      turning = 1;
      xAcc = 0;
      rightTurn = 1;
      image_index = 0;
    }
    pushed = 6 - kRightPushedSteps;
    if(pushed <= 0){
      pushed = 1;
    }
    if (((kRightPushedSteps>0) or  (isCollisionMoveableSolidLeft(1))) and ((facing=RIGHT) or (approximatelyZero(xVel)))) {
      if(!turning || state == JUMPING || state == FALLING) {
        xAcc+=runAcc / pushed;
        if(slowFall){
          xAcc-=airAcc / pushed;
        }
      }
    }
    if(canturn || spinJump){ 
      if(canturn) {
        //x += TurnOffset;
        canturn = 0;
      }
    }
    facing=RIGHT;
  } else if (kRight && kLeft) {
    facing=facingPrev;
  }
}


// Climbing Movement
if ((state==CLIMBING) && isCollisionLadder()==0 && isCollisionLadderHoriz()==0) {
  state = FALLING;
}
if (state=CLIMBING) {
  if(isCollisionLadder() == 0) {
    if (kLeft) {
      xAcc-=climbAcc*2;
      facing=LEFT;
    }
    if (kRight) {
      xAcc+=climbAcc*2;
      facing=RIGHT;
    }
  }
  if (isCollisionLadderHoriz() == 0) {
    if (kUp && isCollisionLadderTop() == 1 && isCollisionLadderTop2() == 1 && isCollisionLadder()) {
      yAcc-=climbAcc;
    } else if(kUp){
        if((!position_meeting(x + 10*facing, y - 62, oSolid)) && (!position_meeting(x + 10*facing, y - 54, oSolid)) && (!position_meeting(x + 10*facing, y - 40, oSolid)) && (!position_meeting(x + 10*facing, y - 26, oSolid))){
          dropTimer = 0;
          turning = 0;
          spinJump = 0;
          xVel = 0;
          yVel = 0;
          xAcc = 0;
          yAcc = 0; 
          state = CLAMBER;
        }
    }
  }
  if(kLeft) {
    hangLook = LEFT;
  } else if(kRight) {
    hangLook = RIGHT;
  }
  if (kDown) {yAcc+=climbAcc;}
}
if (platformCharacterIs(IN_AIR) && state != HANGING) {
  yAcc+=gravityIntensity;
}
if (((isCollisionBottom(1)) or (isCollisionPlatformBottom(1)) and (isCollisionPlatform()=0)) and (platformCharacterIs(IN_AIR)) and (yVel>=0) && state!=CLAMBER) {
  yVel=0;
  yAcc=0;
  // player has just landed
  walkOffTime=0;
  state=RUNNING;
  spinJump = 0;
  fallSpin = 0;
  slowFall = 0;
  if(richJump){
    dodgeState = 0;
    dodgeCD = 10;
    moveCD = 0;
    facing = -facing;
  }
  richJump = 0;
  jumps=0;
}
// if the character has just walked off of the edge of a solid
if ((isCollisionBottom(1)=0) and ((isCollisionPlatformBottom(1)=0) or (isCollisionPlatform())) and (platformCharacterIs(ON_GROUND)) && state != HANGING && state!=CLAMBER) {
  state=FALLING;
  walkOffTime = WALKOFF;
  yAcc+=grav;
}
if ((isCollisionTop(1)) and (state=JUMPING)) {
  yVel=abs(yVel*0.3);
}

//Stop if near solid
if (((isCollisionLeft(1)) and (facing=LEFT)) or ((isCollisionRight(1)) and (facing=RIGHT))) {
  xVel=0;
}

// player may jump
if ((platformCharacterIs(ON_GROUND) || walkOffTime > 0) and (kJumpPressed) && state!=CLAMBER && (moveCD == 0 || (dodgeState == 2 && dodgeCD > 0))) {
  if(dodgeState != 2){
    // Spin jump
    if(kRight || kRightPressed) {
      xAcc=5;
      spinJump=1;
      alarm[0] = aISJump;
    } else if(kLeft || kLeftPressed) {
      xAcc=-5;
      spinJump=1;
      alarm[0] = aISJump;
    } else {
      alarm[0] = aIJump;
      slowFall=1;
    }
    if(walkOffTime>0){
      yAcc-=grav*(WALKOFF-walkOffTime);
    }
    yAcc+=initialJumpAcc;
    xAcc+=xVel/2;
    walkOffTime = 0;
  } else if(dodgeState == 2){
    moveCD = 16;
    wepCD = 16;
    richJump = 1;
    yAcc += initialJumpAcc * 0.5;
    dodgeTimer = 30;
  }
  // the "state" gets changed to JUMPING later on in the code
  state=FALLING;
  // "variable jumping" states
  jumpButtonReleased=0;
  jumpTime=0;
}

//Handle hanging direction states
if (state==HANGING){
  if(kLeft && !kRight) {
    hangLook = LEFT;
  }
  if (kRight && !kLeft) {
    hangLook = RIGHT;
  }

  if ((kUp) && (!position_meeting(x + 10*facing, y - 72, oSolid)) && (!position_meeting(x + 10*facing, y - 62, oSolid)) && (!position_meeting(x + 10*facing, y - 54, oSolid)) && (!position_meeting(x + 10*facing, y - 40, oSolid)) && (!position_meeting(x + 10*facing, y - 26, oSolid))) {
    if(upTimer <= 10){
      upTimer++;
    } else if(upTimer >= 10){
      state = CLAMBER;
      upTimer=0;
    }
  } else if (!kUp){
    upTimer=0;
  }
  if (kDown && !kUp) {
    if(dropTimer <= 10){
      dropTimer++;
    } else if(dropTimer >= 10){
      dropTimer=0;
      state=FALLING;
    }
  } else if (!kDown){
    dropTimer=0;
  }
} 

//Jump while hanging
if (state==HANGING and (kJumpPressed)) {
  if(kDown == 0){    
    yAcc+=initialJumpAcc*0.8;
    xAcc+=xVel/2;
  }
  // the "state" gets changed to JUMPING later on in the code
  state=FALLING;
  // "variable jumping" states
  jumpButtonReleased=0;
  jumpTime=0;
}

if (jumpTime<jumpTimeTotal) {jumpTime+=1;}
// let the character continue to jump
if (kJump=0) {jumpButtonReleased=1;}
if (jumpButtonReleased) {

    // Allow player to spin after a basic jump
    if(kJump && platformCharacterIs(IN_AIR) && !(dodgeState == 1 || dodgeState == 2)){
      if(walkOffTime == 0){
        state=FALLING;
      }
      slowFall=0;
      fallSpin=1;
      spinJump=1;
      if(facing==RIGHT){xVel=5;} else {
        xVel=-5;
      }
    }
  jumpTime=jumpTimeTotal;
}
gravityIntensity=(jumpTime/jumpTimeTotal)*grav;
// look up
if ((kUp) and (xVel=0) and (xAcc=0) and (platformCharacterIs(ON_GROUND)) and (isCollisionLadder()=0) and isCollisionLadderHoriz()=0 && moveCD == 0) {state=LOOKING_UP;}
if ((kUp=0) and (state=LOOKING_UP)) {state=STANDING;}
// press key down
if ((kDown) and (platformCharacterIs(ON_GROUND)) and (isCollisionLadder()=0) and isCollisionLadderHoriz()=0 && moveCD == 0) {
  if (isCollisionPlatformBottom(1)) {
    if (isCollisionBottom(1)=0) {
      y+=1;
      state=FALLING;
      yAcc+=grav;
    } else {
      state=RUNNING;    // the character can't move down because there is a solid in the way
    }
  } else if (!kLeft && !kRight){
    state=DUCKING;
  }
}
// release key down
if ((kDown==0) and (state==DUCKING)) {
  state=STANDING;
  xVel=0;
  xAcc=0;
}
// stop running
if ((xVel=0) and (xAcc=0) and (state=RUNNING)) {state=STANDING;}
// running
if ((xAcc!=0) and (state=STANDING)) {state=RUNNING;}
// jumping
if ((yVel<0) and (platformCharacterIs(IN_AIR)) && state!=CLAMBER && state != HANGING) {state=JUMPING;}
// falling
if ((yVel>0) and (platformCharacterIs(IN_AIR)) && state!=CLAMBER && state != HANGING) {state=FALLING;}
// climbing
if ((isCollisionLadder() or isCollisionLadderHoriz()) and (ladderTimer=0) && moveCD == 0) {
  if(((kUp) or (kDown) && isCollisionLadder()) || (isCollisionLadderHoriz() && (kUp) || (kLeft) || (kRight))) {
    if((isCollisionLadderLeft() && facing == LEFT) || (isCollisionLadderRight() && facing == RIGHT) || isCollisionLadderHoriz()) {
      // orient character if 
      if(isCollisionLadderRight() || isCollisionLadderRight){
        hangLook = facing;
      }
      // nullifies the velocity
      xVel=0;
      yVel=0;
      // nullifies the acceleration
      xAcc=0;
      yAcc=0;
      richJump = 0;
      turning = 0;
      state=CLIMBING;
    }
  }
}

// jump off a ladder
if ((isCollisionLadder()) and (state=CLIMBING) and (kJumpPressed)) {
  if (facing=LEFT) {xVel=-departLadderXVel;} else {xVel=departLadderXVel;}
  yAcc+=departLadderYVel;
  state=JUMPING;
  jumpButtonReleased=0;
  jumpTime=0;
}

// jump off horizontal ladder
if ((isCollisionLadderHoriz()) and !(isCollisionLadder()) and (state=CLIMBING)) {
  if((kJumpPressed) || (kDownPressed)){
    yAcc-=departLadderYVel;
    state=FALLING;
    jumpButtonReleased=0;
    jumpTime=0;
  }
}



//stops everything if the character jumps on a ladder (and stops moving) or ducks
if ((state=CLIMBING) or (state=DUCKING)) {
  spinJump = 0;
  flySpeed=0;
  flySpeedTimer=0;
  flyAccTimer=0;
  flyAcc2Timer=0;
}


//calculates the horizontal and vertical friction, depending on the state of the charater
if (dodgeState > 0){
  switch(dodgeState){
    case 1:
      if(dodgeTimer > 0){
        if(platformCharacterIs(ON_GROUND)){
          xAcc = -facing*3.2;
        } else if(platformCharacterIs(IN_AIR)){
          xAcc = -facing*3.2;
          yVel *= 0.3;
        }
      } 
      xFric=0.8;
      break;
    case 2:
      if(!richJump){
        xAcc = facing *(dodgeTimer / 17);
        xFric=0.8;
      } else {
        xAcc = facing *(dodgeTimer / 7);
        xFric=0.8;
      }
      break;
    default:
      break;
  }
} else if (state=CLIMBING) {
  xFric=frictionClimbingX;
  yFric=frictionClimbingY;
} else {
  if (state=DUCKING) {
    if ((xVel<2) and (xVel>-2)) {xFric=0.2;} else {xFric=frictionDuckingX;}
  } else {
    //decrease the friction when the character is "flying"
    if ((canFly) and (jumps>1)) {
      xFric=frictionFlyingX;
    } else {
        if (flySpeed>50) {
          xFric=frictionRunningFastX;
        } else {
            if ((platformCharacterIs(IN_AIR)) and (kLeft=0) and (kRight=0)) {
              xFric=0.96;
            } else  {
                xFric=frictionRunningX;
            }
        }
    }
  }
  //if the character is underwater
  if (isCollisionWaterTop(1)) {
    inWater = 1;
    xFric-=0.4;
    if ((state=FALLING) and (yVel>0)) {
      yFric=0.5;
    } else {
      yFric=0.96;
    }
  } else {
    inWater = 0;
    yFric=1;
  }
}

// Handle Clambering
if (state == CLAMBER){
  clamberTimer++;
  switch(clamberTimer){
    case 1: 
      break;
    case 2: y -= 10;
      break;
    case 3: y -= 10;
      break;
    case 4: 
      break;
    case 5: y -= 4;
      break;
    case 6:
      break;
    case 7: y -= 4;
      break;
    case 8: y -= 2;
            x += 4*facing; 
      break;
    case 9: y -= 2;
            x += 3*facing;
      break;
    case 10: y -= 4;
            x += 2*facing;
      break;
    case 11: y -= 4;
             x += 2*facing;
      break;
    case 12: y -= 4;
             x += 1*facing; 
      break;
    case 13: y -= 2;
             x += 1*facing; 
      break;
    case 14: state = STANDING;
             clamberTimer = 0; 
      break;
    default: 
      break;
  }
}


//Start hanging if close enough to a ledge while facing the right way
if(platformCharacterIs(IN_AIR) && position_meeting(x, y + 10, oSolid) == false && position_meeting(x, y - 32, oSolid) == false && yVel > 0 && y > 32 && moveCD == 0) {
  if (facing == RIGHT && isCollisionLadder()==0 && position_meeting(x + 9, y - 26, oSolid) == true && position_meeting(x + 9, y - 26, oMovingSolid) == false && position_meeting(x + 9, y - 32, oSolid) == false && (kRight > 0 || kUp > 0)) {
    state = HANGING;
    hangLook = RIGHT;
    while(!place_meeting(x+facing, y-26, oSolid)){
      x+=facing;
    }
    while(position_meeting(x+(9*facing),y-26, oSolid)){
      y-=1;
    }
    dropTimer = 0;
    turning = 0;
    spinJump = 0;
    richJump = 0;
    xVel = 0;
    yVel = 0;
    xAcc = 0;
    yAcc = 0; 
  }
  if (facing == LEFT && isCollisionLadder()==0 && position_meeting(x - 9, y - 26, oSolid) == true && position_meeting(x - 9, y - 26, oMovingSolid) == false && position_meeting(x - 9, y - 32, oSolid) == false && (kLeft > 0 || kUp > 0)) {
    state = HANGING;
    hangLook = LEFT;
    while(!place_meeting(x+facing, y-26, oSolid)){
      x+=facing;
    }
    while(position_meeting(x+(9*facing),y-26, oSolid)){
      y-=1;
    }
    dropTimer = 0;
    turning = 0;
    spinJump = 0;
    richJump = 0;
    xVel = 0;
    yVel = 0;
    xAcc = 0;
    yAcc = 0; 
  }
}

//limits the acceleration if it is too extreme
if (xAcc>xAccLimit) {xAcc=xAccLimit;} else {if (xAcc<-1*xAccLimit) {xAcc=-1*xAccLimit;}}
if (yAcc>yAccLimit) {yAcc=yAccLimit;} else {if (yAcc<-1*yAccLimit) {yAcc=-1*yAccLimit;}}
//applies the acceleration
xVel+=xAcc;
yVel+=yAcc;
//nullifies the acceleration
xAcc=0;
yAcc=0;
//applies the friction to the velocity, now that the velocity has been calculated
xVel*=xFric;
yVel*=yFric;
//Stop if near solid 
/*
if (((isCollSolidTurnLeft(1)) and (facing=LEFT)) or ((isCollSolidTurnRight(1)) and (facing=RIGHT))) {
  xVel=0;
}*/
//apply the limits since the velocity may be too extreme
if (abs(xVel)>xVelLimit && fastMovement == 0) {xVel= sign(xVel)*xVelLimit;} 
if (abs(yVel)>yVelLimit && fastMovement == 0) {yVel= sign(yVel)*yVelLimit;} 
//approximates the "active" variables
if (approximatelyZero(xVel)) {xVel=0;}
if (approximatelyZero(yVel)) {yVel=0;}
if (approximatelyZero(xAcc)) {xAcc=0;}
if (approximatelyZero(yAcc)) {yAcc=0;}
//prepares the character to move up a hill
//we need to use the "slopeYPrev" variable later to know the "true" y previous value
//keep this condition the same
if ((maxSlope>0) and (platformCharacterIs(ON_GROUND)) and (xVel!=0)) {
  slopeYPrev=y;
  for (y=y; y>=slopeYPrev-maxSlope; y-=1;) {
    if (isCollisionTop(1)) {break;}
  }
  slopeChangeInY=slopeYPrev-y;
} else {
  slopeChangeInY=0;
}
//moves the character, and balances out the effects caused by other processes
//keep this condition the same
if ((maxSlope*abs(xVel)>0) and (platformCharacterIs(ON_GROUND))) {
  //we need to check if we should dampen out the speed as the character runs on upward slopes
  xPrev=x;
  yPrev=slopeYPrev;       //we don't want to use y, because y is too high
  yPrevHigh=y;            //we'll use the higher previous variable later
  moveTo(xVel,yVel+slopeChangeInY);
  dist=point_distance(xPrev,yPrev,x,y);   //overall distance that has been traveled
  //we should have only ran at xVel
    if ((dist)>(abs(xVelInteger))) {
    excess=dist-abs(xVelInteger); 
    if (xVelInteger<0) {excess*=-1;}
    //move back since the character moved too far
    x=xPrev;
    y=yPrevHigh;     //we need the character to be high so the character can move down
    //this time we'll move the correct distance, but we need to shorten out the xVel a little
    //these lines can be changed for different types of slowing down when running up hills
    ratio=abs(xVelInteger)/dist*(slopeRatio);        //can be changed
    moveTo(round(xVelInteger*ratio),round(yVelInteger*ratio+slopeChangeInY));
  }
} else {
  //we simply move xVel and yVel while in the air or on a ladder
  moveTo(xVel,yVel);
}
//move the character downhill if possible
//we need to multiply maxDownSlope by the absolute value of xVel since the character normally runs at an xVel larger than 1
if ((isCollisionBottom(1)=0) and (maxDownSlope>0) and (xVelInteger!=0) and (platformCharacterIs(ON_GROUND))) {
  //the character is floating just above the slope, so move the character down
  upYPrev=y;
  for (y=y; y<=upYPrev+maxDownSlope; y+=1;) {
    if (isCollisionBottom(1)) {            //we hit a solid below
      upYPrev=y;
      break;
    }
  }
  y=upYPrev;
}

//sets the previous state and the previously previous state
statePrevPrev=statePrev;
statePrev=state;
facingPrevPrev=facingPrev;        
facingPrev=facing;   

if(walkOffTime > 0){
  walkOffTime--;
}

if (state=CLIMBING)
  {
    image_speed=sqrt(sqr(abs(xVel))+sqr(abs(yVel)))*climbAnimSpeed;
  }
//limit the image_speed at 1 so the animation always looks good
if (image_speed>1)
  {image_speed=1;}
