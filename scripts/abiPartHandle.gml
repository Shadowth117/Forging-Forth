/// abiPartHandle
if((currentArmAbility != armPrev)){
  switch(currentArmAbility){
    case 0:
      setBasicArmPirate();
      armBlend = c_white;
      aaArmBlend = c_white;
      break;
    case 1:
      setRGlowArmPirate();
      armBlend = c_white;
      aaArmBlend = c_red;
      break;
    default:
      setBasicArmPirate();
      armBlend = c_white;
      aaArmBlend = c_white;
      break;
  }
}
if((bodyAbility != bodyPrev)){
  switch(bodyAbility){
    case 0:
      setBasicBodyPirate();
      bodyBlend = c_white;
      aaBodyBlend = c_white;
      break;
    case 1:
      setBasicBodyPirate();
      bodyBlend = c_red;
      aaBodyBlend = c_red;
      break;
    default:
      setBasicBodyPirate();
      bodyBlend = c_white;
      aaBodyBlend = c_white;
      break;
  }
}
if((legAbility != legPrev)){
  switch(legAbility){
    case 0:
      setBasicLegPirate();
      legBlend = c_white;
      aaLegBlend = c_white;
      break;
    case 1:
      setBasicLegPirate();
      legBlend = c_red;
      aaLegBlend = c_red;
      break;
    default:
      setBasicLegPirate();
      legBlend = c_white;
      aaLegBlend = c_white;
      break;
  }
}
armPrev = currentArmAbility;
bodyPrev = bodyAbility;
legPrev = legAbility;
