/// extraSpriteAssign()
switch(sprite_index) {
  case StandSpr:
    sprite_indexArm=StandArmSpr;
    sprite_indexLeg=StandLegSpr;
    break;
  case RunSpr:
    sprite_indexArm=RunArmSpr;
    sprite_indexLeg=RunLegSpr;
    break;
  case DuckSpr:
    sprite_indexArm=DuckArmSpr;
    sprite_indexLeg=DuckLegSpr;
    break;
  case UpSpr:
    sprite_indexArm=UpArmSpr;
    sprite_indexLeg=UpLegSpr;
    break;
  case ClimbSpr:
    sprite_indexArm=ClimbArmSpr;
    sprite_indexLeg=ClimbLegSpr;
    break;
  case FlipSpr:
    sprite_indexArm=FlipArmSpr;
    sprite_indexLeg=FlipLegSpr;
    break;
  case JumpSpr:
    sprite_indexArm=JumpArmSpr;
    sprite_indexLeg=JumpLegSpr;
    break;
  case FallSpr:
    sprite_indexArm=FallArmSpr;
    sprite_indexLeg=FallLegSpr;
    break;
  case FlySpr:
    sprite_indexArm=FlyArmSpr;
    sprite_indexLeg=FlyLegSpr;
    break;
  case DeadSpr:
    sprite_indexArm=DeadArmSpr;
    sprite_indexLeg=DeadLegSpr;
    break;
  case TurnSpr:
    sprite_indexArm=TurnArmSpr;
    sprite_indexLeg=TurnLegSpr;
    break;
  case TurnAirSpr:
    sprite_indexArm=TurnAirArmSpr;
    sprite_indexLeg=TurnAirLegSpr;
    break;
  case HangSpr:
    sprite_indexArm=HangArmSpr;
    sprite_indexLeg=HangLegSpr;
    break;
  case HangBkSpr:
    sprite_indexArm=HangBkArmSpr;
    sprite_indexLeg=HangBkLegSpr;
    break;
  default:
    sprite_indexArm=sAfter;
    sprite_indexLeg=sAfter;
    break;
}
