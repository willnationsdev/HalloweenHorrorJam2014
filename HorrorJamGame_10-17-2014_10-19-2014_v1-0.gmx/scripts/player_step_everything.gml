image_angle = direction;

with(obj_lanternLight) {
    other.hspeed = hspeed;
    other.vspeed = vspeed;
}

if(keyboard_check_pressed(vk_alt)) lightOn = !lightOn;

if speed > 0 //if moving (and not attempting to move continously in one direction)
{
    //if no key is pressed and moving, stop moving @ grid
    if(place_snapped(64,64) && !(keyboard_check(vk_left) || keyboard_check(vk_right))) {
        hspeed = 0;
    }
    if(place_snapped(64,64) && !(keyboard_check(vk_up) || keyboard_check(vk_down))) {
        vspeed = 0;
    }
    //if key is pressed and we are moving in the opposite direction, reverse direction
    if(place_snapped(64,64) && ((keyboard_check(vk_left)) && hspeed > 0)) {
        hspeed = -playerSpeed;
    }
    if(place_snapped(64,64) && ((keyboard_check(vk_right)) && hspeed < 0)) {
        hspeed = playerSpeed;
    }
    if(place_snapped(64,64) && ((keyboard_check(vk_up)) && vspeed > 0)) {
        vspeed = -playerSpeed;
    }
    if(place_snapped(64,64) && ((keyboard_check(vk_down)) && vspeed < 0)) {
        vspeed = playerSpeed;
    }
}
else //Otherwise, allow keyboard presses potentially establishing new directionality
{
    if      (keyboard_check(vk_up)    && !place_meeting(x,y-16,obj_block)) vspeed = -playerSpeed;
    else if (keyboard_check(vk_down)  && !place_meeting(x,y+16,obj_block)) vspeed =  playerSpeed;
    else if (keyboard_check(vk_left)  && !place_meeting(x-16,y,obj_block)) hspeed = -playerSpeed;
    else if (keyboard_check(vk_right) && !place_meeting(x+16,y,obj_block)) hspeed =  playerSpeed;
}
//Stops movement at edge of screen
/*if(x+hspeed < 0) {x = 0;hspeed = 0;}
if(x+hspeed > room_width-64) {x = room_width-64;hspeed = 0;}
if(y+vspeed < 0) {y = 0;vspeed = 0;}
if(y+vspeed > room_height-64) {y = room_height-64;vspeed = 0;}
*/

if(keyboard_check_pressed(vk_space)) {
    with(instance_nearest(x,y,obj_door)) {
        if(openable) {
            if(!isOpen) {
                if(!locked) {
                    image_angle = 90;
                    audio_play_sound(snd_doorOpen,10,false);
                    isOpen = true;
                }
                else audio_play_sound(snd_doorLocked,10,false);
            }             
        }
    }
}

