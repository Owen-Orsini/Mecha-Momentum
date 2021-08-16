/// @description Insert description here
// You can write your code in this editor
var j_input_ = INPUT_JUMP;
var x_input_ = INPUT_RIGHT - INPUT_LEFT;
var y_input_ = INPUT_DOWN - INPUT_UP;
var input_magnitude_ = (x_input_ != 0) or (y_input_ != 0)
var bbox_side_;

var h_friction_ = 0;

var _dir = point_direction(0, 0, x_input_, y_input_);



// State Machine
switch(state_)
{
	case player_state_.normal:
	{
		// if jump input is pressed, apply thrust to vertical speed
		if(j_input_ == true){
			vsp_ -= thrust_acc_;
		}
		
		if(grounded_ == true){
			hsp_ += lengthdir_x(input_magnitude_ * walk_acc_, _dir);
		}else{
			hsp_ += lengthdir_x(input_magnitude_ * air_acc_, _dir);
			vsp_ += lengthdir_y(input_magnitude_ * air_acc_, _dir);
		}
		if(x_input_ == 0){
			if(grounded_ == true){
				h_friction_ = global.h_fric_ground_;
			}else{
				h_friction_ = global.h_fric_air_;
			}
				hsp_ = approach(hsp_, 0, h_friction_);
	
	}
		
		if(mouse_check_button_pressed(mb_left) == true){
			grapple_x = mouse_x;
			grapple_y = mouse_y;
			rope_x = x + sprite_width/2;
			rope_y = y + sprite_height/2;
			rope_angle_vel_ = 0;
			rope_angle_ = point_direction(grapple_x, grapple_y, rope_x, rope_y);
			rope_length_ = point_distance(grapple_x, grapple_y, rope_x, rope_y);
			state_ = player_state_.swing;
		
		}
	
	}break;
	case player_state_.swing:
	{
		

		var _rope_angle_acc = -0.2 *  dcos(rope_angle_);
		rope_angle_vel_ += _rope_angle_acc;
		rope_angle_ += rope_angle_vel_;
		rope_angle_vel_ *= 0.99;
		rope_x = grapple_x + lengthdir_x(rope_length_, rope_angle_);
		rope_y = grapple_y + lengthdir_y(rope_length_, rope_angle_);
		
		hsp_ = rope_x - x;
		vsp_ = rope_y - y;
		
		if(INPUT_JUMP == true){
			state_ = player_state_.normal;
			
		
		}
		
		
		
	}break;
	case player_state_.paused:
	{
		
	
	}break;



}

// if there is no x input, apply appropriate friction to horizontal speed




if(grounded_ != true and j_input_ != true){
	vsp_ = vsp_ + global.grav_;
}

// if grounded, clamp horizontal speed to walk speed
if(grounded_ == true){
	hsp_ = clamp(hsp_, -walk_spd_, walk_spd_);

}
// if not grounded, clamp horizontal speed to air speed
if(grounded_ != true){
	
	hsp_ = clamp(hsp_, -air_spd_, air_spd_);
	

}
#region Fraction Handling

// horizontal and vertical speed
// hsp_/vsp_:	Horizontal/Vertical Speed
// hsp_whole_/vsp_whole_:	Whole number component of Horizontal/Vertical Speed
// hsp_frac_/vsp_frac_:	Fractional Component of Horizontal/Vertical Speed

hsp_round_ = hsp_ + hsp_frac_;
hsp_frac_ = hsp_round_ - floor(abs(hsp_round_)) * sign(hsp_round_);
hsp_round_ = hsp_round_ - hsp_frac_;

vsp_round_ = vsp_ + vsp_frac_;
vsp_frac_ = vsp_round_ - floor(abs(vsp_round_)) * sign(vsp_round_);
vsp_round_ = vsp_round_ - vsp_frac_;

#endregion


#region Grounded check

// Check if grounded
bbox_side_ = bbox_bottom;
if(tilemap_get_at_pixel(tilemap_, bbox_left, bbox_side_ + 1)
or tilemap_get_at_pixel(tilemap_, x + sprite_width/2, bbox_side_ + 1)
or tilemap_get_at_pixel(tilemap_, bbox_right, bbox_side_ + 1)){
	grounded_ = true;
}else{
	grounded_ = false;
}

#endregion

#region Collsion

// Horizontal Tile Collision

if(hsp_ > 0)
{
	bbox_side_ = bbox_right;
}else{
	bbox_side_ = bbox_left;
}

// Checks the top, bottom, and center points of the bounding box in the direction the player is moving for collisions
if(tilemap_get_at_pixel(tilemap_, bbox_side_ + hsp_round_, bbox_top)
or tilemap_get_at_pixel(tilemap_, bbox_side_ + hsp_round_, y + sprite_height/2)
or tilemap_get_at_pixel(tilemap_, bbox_side_ + hsp_round_, bbox_bottom))
{
		if(hsp_round_ > 0)
		{
			hsp_round_ = hsp_round_ - ((bbox_side_ + hsp_round_) mod 32) - 1;
		}else if(hsp_round_ < 0){
			hsp_round_ = hsp_round_ - ((bbox_side_ + hsp_round_) mod 32) + 32;
		}
		hsp_ = hsp_round_;
}

// Vertical Tile Collision

if(vsp_round_ > 0){
	bbox_side_ = bbox_bottom;
}else{
	bbox_side_ = bbox_top;
}

// Checks the left, center, and bottom points of the bounding box in the direction the player is moving for collisions
if(tilemap_get_at_pixel(tilemap_, bbox_left, bbox_side_ + vsp_round_)
or tilemap_get_at_pixel(tilemap_, x + sprite_width/2, bbox_side_ + vsp_round_)
or tilemap_get_at_pixel(tilemap_, bbox_right, bbox_side_ + vsp_round_))
{
		if(vsp_round_ > 0)
		{
			vsp_round_ = vsp_round_ - ((bbox_side_ + vsp_round_) mod 32) - 1;
		}else if(vsp_round_ < 0){
			vsp_round_ = vsp_round_ - ((bbox_side_ + vsp_round_) mod 32) + 32;
		}
		vsp_ = vsp_round_;
}


#endregion
#region Apply Movement
x = x + hsp_round_;
y = y + vsp_round_;
#endregion


