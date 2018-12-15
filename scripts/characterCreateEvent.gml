/*
This script should be placed in the "Create Event" of the platform character.
It sets the variables needed for the platform character.

You can edit the "user variables" if you don't want to use the default values.  

This script sets the collision bounds using this code: setCollisionBounds(-5,-7,5,8)
You can modify the arguments to make a collsion bounds that fits your own sprites.
If you are just going to use the default Mario sprites, there is no reason to edit
the arguments.
*/

//constant states that the platform character may be (don't edit)
STANDING=10;
RUNNING=11;
DUCKING=12;
LOOKING_UP=13;
CLIMBING=14;
JUMPING=15;
FALLING=16;
DYING=17;
LEFT=-1;
RIGHT=1;
ON_GROUND=20;
IN_AIR=21;
ON_LADDER=22;
HANGING=23;
CLAMBER=24;

WALKOFF=5;


//Sprite Skin variables
var baseSkin = 0;
var sprite_indexArm;
var sprite_indexLeg;
var StandSpr, RunSpr, DuckSpr, UpSpr, ClimbSpr, FlipSpr, JumpSpr, FallSpr, FlySpr, DeadSpr, TurnSpr, TurnAirSpr, HangSpr, HangBkSpr;
var StandArmSpr, RunArmSpr, DuckArmSpr, UpArmSpr, ClimbArmSpr, FlipArmSpr, JumpArmSpr, FallArmSpr, FlyArmSpr, DeadArmSpr, TurnArmSpr, TurnAirArmSpr, HangArmSpr, HangBkArmSpr;
var StandLegSpr, RunLegSpr, DuckLegSpr, UpLegSpr, ClimbLegSpr, FlipLegSpr, JumpLegSpr, FallLegSpr, FlyLegSpr, DeadLegSpr, TurnLegSpr, TurnAirLegSpr, HangLegSpr, HangBkLegSpr;

//Set a skin and collision bounds 
setSkinPirate();
setCollisionBounds(StandBnd[0],StandBnd[1],StandBnd[2],StandBnd[3]);
image_speed=0.5;

//the keys that the platform character will use (don't edit)
kLeft=0;
kLeftPressed=0;
kRight=0;
kRightPressed=0;
kUp=0;
kUpPressed=0;
kDown=0;
kDownPressed=0;
kJump=0;
kJumpPressed=0;
kRun=0;
kBody=0;
kBodyPressed=0;
kArms1=0;
kArms1Pressed=0;
kArms2=0;
kArms2Pressed=0;
kLegs=0;
kLegsPressed=0;
kDodge=0;
kDodgePressed=0;
kAtk1=0;
kAtk1Pressed=0;
kAtk2=0;
kAtk2Pressed=0;

//user variables (you can edit these)
player=1;                   //player number (player 2 uses different keyboard keys than player 1)
state=FALLING;              //the character state, must be one of the following: STANDING, RUNNING, DUCKING, LOOKING_UP, CLIMBING, JUMPING, or FALLING
facing=RIGHT;               //which direction the character is facing, must be either LEFT or RIGHT
 runAcc=5;                   //the running acceleration
 airAcc=3;                  //the air acceleration for a non spin jump
 grav=0.6;                     //the gravity
 initialJumpAcc=-6.5;          //relates to how high the character will jump
 jumpTimeTotal=22;           //how long the user must hold the jump button to get the maximum jump height
 climbAcc=0.4;               //how fast the character will climb
runAnimSpeed=0.05;          //relates to the how fast the running animation should go
climbAnimSpeed=0.1;         //relates to how fast the climbing animation should go
 departLadderXVel=3;         //how fast character should be moving horizontally when he leaves the ladder
 departLadderYVel=-3;        //how fast the character should be moving vertically when he leaves the ladder
maxSlope=2;                 //approximately how many pixels the character can climb UPWARDS per step (a value of 5 means the character can climb up a slope of 5)
maxDownSlope=10;             //approximately how many pixels the character can climb DOWNWARDS per step (a value of 5 means the character can climb down a slope of 5)
spinJump=0;                 //whether player is spin jumping or not
fallSpin=0;                 //whether player is spin jumping while falling
slowFall=0;                 //whether player has high aerial mobility or not
canRun=0;                   //when the user presses the shift button, should the character be allowed to run?
canFly=0;                   //whether the character can do a fly jump when running at full speed
canFlyJump=0;               //whether the character can do continuous fly jumps (mid-air)
flyMaxJumps=5;              //the maximum number of jumps the character can perform while flying
frictionRunningX=0.6;       //friction obtained while running
frictionRunningFastX=0.98;   //friction obtained while holding the shift button for some time while running 
frictionClimbingX=0.5;      //friction obtained while climbing
frictionClimbingY=0.8;      //friction obtained while climbing
frictionDuckingX=0.8;       //friction obtained while ducking
frictionFlyingX=0.99;       //friction obtained while "flying"
 xVelLimit=5;               //limits the xVel
 xVelLimitAir = 2;          //limits the xVel in air if not spin jumping
 yVelLimit=30;               //limits the yVel
 xAccLimit=5;                //limits the xAcc
 yAccLimit=30;                //limits the yAcc
aIJump=12;                   //time to make afer images after a jump
aISJump=21;                   //time to make afer images after a spin jump
stopped=0;                   //whether animation should stop
turning=0;                   //whether character is turning
canturn=0;                   //whether character is able to turn
leftTurn=0;                  //whether character is in a left turn
rightTurn=0;                 //whether character is in a right turn
spritePrevPrev=sprite_index; //Previous previous sprite used
spritePrev=sprite_index;     //Previous sprite used
facingPrevPrev=RIGHT;        //Previous direction faced
facingPrev=RIGHT;            //Previous direction faced
inWater=0;                   //whether in water 
horizClimb=0;                //whether "climbing" across the ceiling
slopeRatio=1.1;              //0.9 by default; determines slope walkup speed ratio
kHorizCheck = kRight;        //
hangLook = RIGHT;            //direction to look when hanging
dropTimer = 0;               //timer to drop from ledge
upTimer = 0;                 //timer to climb ledge
clamberTimer = 0;            //frame of clambering
wepCD = 0;                   //cooldown for attacks
walkOffTime = 0;             //timer for how long one can jump after walking off the edge
moveCD = 0;                  //cooldown for movement
dodgeCD = 0;                 //cooldown for dodging
combo = 0;                   //combo counter
comboTimer = 0;              //combo timer
fastMovement = 0;            //Whether player can exceed normal velocity limits
dodgeState = 0;              //type of dodging
dodgeTimer = 0;              //dodge timer
richJump = 0;                //whether doing the special richDodge jump
comboWindow=60;              //window for combo followup

//Abilities
armAbility1 = 0;
armAbility2 = 1;
currentArmAbility = 0;
curArmTrack = 0;
armBlend = c_white;
aaArmBlend = c_white;
armPrev = 0;
bodyAbility = 0;
bodyBlend = c_white;
aaBodyBlend = c_white;
bodyPrev = 0;
legAbility = 0;
legBlend = c_white;
aaLegBlend = c_white;
legPrev = 0;


//hidden variables (don't edit)
statePrev=state;
statePrevPrev=statePrev;
gravityIntensity=grav;      //this variable describes the current force due to gravity (this variable is altered for variable jumping)
jumpTime=jumpTimeTotal;     //current time of the jump (0=start of jump, jumpTimeTotal=end of jump)
jumpButtonReleased=0;       //whether the jump button was released. (Stops the user from pressing the jump button many times to get extra jumps)
ladderTimer=0;              //relates to whether the character can climb a ladder
jumps=0;
flySpeed=0;                 //ranges between 0 and 100. When the flySpeed is approximately 100, the character can "fly."
flySpeedTimer=0;
flyAccTimer=0;
flyAcc2Timer=0;
flyJumpsTimer=0;
flyJumpWasPressed=0;

//makes the object "active" (don't edit)
makeActive();
