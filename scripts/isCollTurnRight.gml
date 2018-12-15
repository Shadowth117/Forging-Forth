
calcCollTurn();
if (collision_line(round(rb+argument0-1),round(tb),round(rb+argument0-1),round(bb-1),oSolid,1,1)>0) {
  return 1;
}
return 0;
