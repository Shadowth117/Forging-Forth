
/*
This event should be placed in the draw event of the platform character.
It draws the "flySpeed" bar and the character sprite.
*/
abiPartHandle();
setCollTurn(TurnBnd[0],TurnBnd[1],1,TurnBnd[3]);
//figures out what the sprite index of the character should be
//handles right facing anims
if (facing==RIGHT)  {
  switch(state){
   
  case STANDING:
    if (!turning) {
      image_speed = 0.08;
      setCollisionBounds(StandBnd[0],StandBnd[1],StandBnd[2],StandBnd[3]);
      sprite_index=StandSpr;
    } else if (turning) {
      image_speed = 0.75;
      sprite_index=TurnSpr;
      setCollisionBounds(TurnBnd[0],TurnBnd[1],TurnBnd[2],TurnBnd[3]);
    }
    break;
  case RUNNING:
    if (!turning) {
      image_speed=0.3;
      setCollisionBounds(RunBnd[0],RunBnd[1],RunBnd[2],RunBnd[3]);
      sprite_index=RunSpr;
    } else if (turning){
      image_speed = 0.75;
      setCollisionBounds(TurnBnd[0],TurnBnd[1],TurnBnd[2],TurnBnd[3]);
      sprite_index=TurnSpr;
    }
    break;
  case DUCKING:
    if (!turning) {
      setCollisionBounds(DuckBnd[0],DuckBnd[1],DuckBnd[2],DuckBnd[3]);  
      sprite_index=DuckSpr;
    } else if (turning) {
      image_speed = 0.75;
      setCollisionBounds(TurnBnd[0],TurnBnd[1],TurnBnd[2],TurnBnd[3]);
      sprite_index=TurnSpr;
    }
    break;
  case LOOKING_UP:
    if (!turning) {
      image_speed = 0.08;
      setCollisionBounds(UpBnd[0],UpBnd[1],UpBnd[2],UpBnd[3]);
      sprite_index=UpSpr;
    } else if (turning) {
      image_speed = 0.75;
      setCollisionBounds(TurnBnd[0],TurnBnd[1],TurnBnd[2],TurnBnd[3]);
      sprite_index=TurnSpr;
    }
    break;
  case CLIMBING:
    setCollisionBounds(ClimbBnd[0],ClimbBnd[1],ClimbBnd[2],ClimbBnd[3]);  
    if(hangLook == RIGHT || abs(yVel) > 0){
      sprite_index=ClimbSpr;
    } else if(hangLook == LEFT){
      sprite_index=HangBkSpr;
    }
    break;
  case CLAMBER:
    image_speed = 0.00001;
    setCollisionBounds(FlipBnd[0],FlipBnd[1],FlipBnd[2],FlipBnd[3]);  
    sprite_index=FlipSpr;
    break;
  case HANGING:
      if(hangLook == RIGHT){
        image_speed = 0.08;
        setCollisionBounds(HangBnd[0],HangBnd[1],HangBnd[2],HangBnd[3]);  
        sprite_index=HangSpr;
      } else if(hangLook == LEFT){
        image_speed = 0.08;
        setCollisionBounds(HangBnd[0],HangBnd[1],HangBnd[2],HangBnd[3]);  
        sprite_index=HangBkSpr;
      }
    break;
  case JUMPING:
    if(spinJump) {
      image_speed=1;
      setCollisionBounds(FlipBnd[0],FlipBnd[1],FlipBnd[2],FlipBnd[3]);
      sprite_index=FlipSpr;
    }   else if (turning == 0)
    {
      setCollisionBounds(JumpBnd[0],JumpBnd[1],JumpBnd[2],JumpBnd[3]);  
      sprite_index=JumpSpr;
    } else if (turning == 1) {
      setCollisionBounds(TurnAirBnd[0],TurnAirBnd[1],TurnAirBnd[2],TurnAirBnd[3]);  
      sprite_index=TurnAirSpr;
      image_speed=0.75;
    }
    break;
  case FALLING:
    if(statePrev==FALLING && statePrevPrev==FALLING) {
      if (!fallSpin && !turning)
      {
        setCollisionBounds(FallBnd[0],FallBnd[1],FallBnd[2],FallBnd[3]); 
        sprite_index=FallSpr;
      } else if (fallSpin && !turning)
      {
        image_speed=1;
        setCollisionBounds(FlipBnd[0],FlipBnd[1],FlipBnd[2],FlipBnd[3]);
        sprite_index=FlipSpr;
      } else if (turning) 
      {
        setCollisionBounds(TurnAirBnd[0],TurnAirBnd[1],TurnAirBnd[2],TurnAirBnd[3]);  
        sprite_index=TurnAirSpr;
        image_speed=0.75;
      }
    }
    break;
  default:
    break;
  }
  //Check if animation should stop after anim ends
  if(sprite_index!=FallSpr && sprite_index!=DuckSpr){
    stopped = 0;
    if(image_speed == 0 && state!=CLIMBING){
      image_speed = 0.5;
    }
  } /*else if(sprite_index!=FallSpr || sprite_index!=DuckSpr && image_index == image_number-1) {
    stopped = 1;
  } */
  //draws the sprite
  extraSpriteAssign();
  if(!stopped){
    if(inWater) {
      image_speed*=0.6;
    }
    draw_sprite_ext(sprite_index,-1,x,y, 1 ,1,0,bodyBlend,1);
    draw_sprite_ext(sprite_indexArm,-1,x,y, 1 ,1,0,armBlend,1);
    draw_sprite_ext(sprite_indexLeg,-1,x,y, 1 ,1,0,legBlend,1);
  } else {
    image_speed = 0;
    draw_sprite_ext(sprite_index,image_number-1,x,y, 1 ,1,0,bodyBlend,1);
    draw_sprite_ext(sprite_indexArm,image_number-1,x,y, 1 ,1,0,armBlend,1);
    draw_sprite_ext(sprite_indexLeg,image_number-1,x,y, 1 ,1,0,legBlend,1);
  }
} else if (facing==LEFT) {
  //Handle left facing anims 
  /*********************************************
   ALL X VALUES MUST BE REVERSED AND INVERTED!!!
  *********************************************/
  switch(state){
  
  case STANDING:
    if (!turning) {
      image_speed = 0.08;
      setCollisionBounds(-StandBnd[2],StandBnd[1],-StandBnd[0],StandBnd[3]);
      sprite_index=StandSpr;
    } else if (turning) {
      image_speed = 0.75;
      sprite_index=TurnSpr;
      setCollisionBounds(-TurnBnd[2],TurnBnd[1],-TurnBnd[0],TurnBnd[3]);
    }
    break;
  case RUNNING:
    if (!turning) {
      image_speed=0.3;
      setCollisionBounds(-RunBnd[2],RunBnd[1],-RunBnd[0],RunBnd[3]);
      sprite_index=RunSpr;
    } else if (turning){
      image_speed = 0.75;
      setCollisionBounds(-TurnBnd[2],TurnBnd[1],-TurnBnd[0],TurnBnd[3]);
      sprite_index=TurnSpr;
    }
    break;
  case DUCKING:
    if (!turning) {
      setCollisionBounds(-DuckBnd[2],DuckBnd[1],-DuckBnd[0],DuckBnd[3]);  
      sprite_index=DuckSpr;
    } else if (turning) {
      image_speed = 0.75;
      setCollisionBounds(-TurnBnd[2],TurnBnd[1],-TurnBnd[0],TurnBnd[3]);
      sprite_index=TurnSpr;
    }
    break;
  case LOOKING_UP:
    if (!turning) {
      image_speed = 0.08;
      setCollisionBounds(-UpBnd[2],UpBnd[1],-UpBnd[0],UpBnd[3]);
      sprite_index=UpSpr;
    } else if (turning) {
      image_speed = 0.75;
      setCollisionBounds(-TurnBnd[2],TurnBnd[1],-TurnBnd[0],TurnBnd[3]);
      sprite_index=TurnSpr;
    }
    break;
  case CLIMBING:
    setCollisionBounds(-ClimbBnd[2],ClimbBnd[1],-ClimbBnd[0],ClimbBnd[3]);  
    if(hangLook == LEFT || abs(yVel) > 0){
      sprite_index=ClimbSpr;
    } else if(hangLook == RIGHT){
      sprite_index=HangBkSpr;
    }
    break;
  case CLAMBER:
    image_speed = 0.00001;
    setCollisionBounds(-FlipBnd[2],FlipBnd[1],-FlipBnd[0],FlipBnd[3]);  
    sprite_index=FlipSpr;
    break;
  case HANGING:
      if(hangLook == LEFT){
        image_speed = 0.08;
        setCollisionBounds(-HangBnd[2],HangBnd[1],-HangBnd[0],HangBnd[3]);  
        sprite_index=HangSpr;
      } else if(hangLook == RIGHT){
        image_speed = 0.08;
        setCollisionBounds(-HangBnd[2],HangBnd[1],-HangBnd[0],HangBnd[3]);  
        sprite_index=HangBkSpr;
      }
    break;
  case JUMPING:
    if(spinJump) {
      image_speed=1;
      setCollisionBounds(-FlipBnd[2],FlipBnd[1],-FlipBnd[0],FlipBnd[3]);
      sprite_index=FlipSpr;
    }   else if (turning == 0)
    {
      setCollisionBounds(-JumpBnd[2],JumpBnd[1],-JumpBnd[0],JumpBnd[3]);  
      sprite_index=JumpSpr;
    } else if (turning == 1) {
      setCollisionBounds(-TurnAirBnd[2],TurnAirBnd[1],-TurnAirBnd[0],TurnAirBnd[3]);  
      sprite_index=TurnAirSpr;
      image_speed=0.75;
    }
    break;
  case FALLING:
    if(statePrev==FALLING && statePrevPrev==FALLING) {
      if (!fallSpin && !turning)
      {
        setCollisionBounds(-FallBnd[2],FallBnd[1],-FallBnd[0],FallBnd[3]); 
        sprite_index=FallSpr;
      } else if (fallSpin && !turning)
      {
        image_speed=1;
        setCollisionBounds(-FlipBnd[2],FlipBnd[1],-FlipBnd[0],FlipBnd[3]);
        sprite_index=FlipSpr;
      } else if (turning) 
      {
        setCollisionBounds(-TurnAirBnd[2],TurnAirBnd[1],-TurnAirBnd[0],TurnAirBnd[3]);  
        sprite_index=TurnAirSpr;
       image_speed=0.75;
      }
    }
    break;
  default:
    break;
  }
  //Check if animation should stop after anim ends
  if(sprite_index!=FallSpr && sprite_index!=DuckSpr){
    stopped = 0;
    if(image_speed == 0 && state!=CLIMBING){
      image_speed = 0.5;
    }
  } /*else if(sprite_index!=FallSpr || sprite_index!=DuckSpr && image_index == image_number-1) {
    stopped = 1;
  } */
  //draw sprite
  extraSpriteAssign();
  if(!stopped){
    if(inWater) {
      image_speed*=0.6;
    }
    draw_sprite_ext(sprite_index,-1,x,y, -1 ,1,0,bodyBlend,1);
    draw_sprite_ext(sprite_indexArm,-1,x,y, -1 ,1,0,armBlend,1);
    draw_sprite_ext(sprite_indexLeg,-1,x,y, -1 ,1,0,legBlend,1);
  } else {
    image_speed = 0;
    draw_sprite_ext(sprite_index,image_number-1,x,y, -1 ,1,0,bodyBlend,1);
    draw_sprite_ext(sprite_indexArm,image_number-1,x,y, -1 ,1,0,armBlend,1);
    draw_sprite_ext(sprite_indexLeg,image_number-1,x,y, -1 ,1,0,legBlend,1);
  }
}     // new code
/*
if (canRun) {
  xOffset=80;
  if (player=1) {yOffset=120;} else {yOffset=143;}
  //draw the "flySpeed" bar, which shows how much speed the character has acquired while holding the "run" button
  draw_healthbar(view_xview[0]+224+xOffset,view_yview[0]+432+yOffset,view_xview[0]+400+xOffset,view_yview[0]+450+yOffset,flySpeed,make_color_rgb(0,64,128),c_blue,c_aqua,0,1,1);
}
*/
spritePrevPrev=spritePrev;
spritePrev=sprite_index;

if (( alarm[0] % 3 ) == 1){
  var AfterImage2 = instance_create(x, y, oAfterImage);
  AfterImage2.sprite_index = sprite_indexLeg;
  AfterImage2.image_index = image_index;
  if(aaLegBlend != c_white){
    AfterImage2.color = aaLegBlend;
  }
  var AfterImage1 = instance_create(x, y, oAfterImage);
  AfterImage1.sprite_index = sprite_indexArm;
  AfterImage1.image_index = image_index;
  if(aaArmBlend != c_white){
    AfterImage1.color = aaArmBlend;
  }
  var AfterImage = instance_create(x, y, oAfterImage);
  AfterImage.sprite_index = sprite_index;
  AfterImage.image_index = image_index;
  if(aaBodyBlend != c_white){
    AfterImage.color = aaBodyBlend;
  }

  AfterImage.facing = facing;
  AfterImage1.facing = facing;
  AfterImage2.facing = facing; 
}
