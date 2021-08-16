// the center of an object who's origin is in the top left corner, based on it's sprite size

#macro INPUT_UP keyboard_check(ord("W"))
#macro INPUT_DOWN keyboard_check(ord("S"))
#macro INPUT_LEFT keyboard_check(ord("A"))
#macro INPUT_RIGHT keyboard_check(ord("D"))
#macro INPUT_JUMP keyboard_check(vk_space)

#macro CENTER_X (x + round(sprite_width/2))
#macro CENTER_Y (y + round(sprite_height/2))
	
#macro X 0
#macro Y 1
	
#macro GROUNDED -35
#macro AIRBORNE -36
