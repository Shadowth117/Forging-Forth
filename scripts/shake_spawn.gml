/// shake_spawn(length, magnitude)
var shake = instance_create(0, 0, oScreenShaker);

if(variable_instance_exists(self,"argument0")){
shake.length = argument0;
shake.magnitude = argument1;
}
