#region info
/*
This physics system uses a variation of the semi implicit euler integration:

	Velocity n+1 = velocity n + (acceleration x frame time)
	position n+1 = position n + (velocity n+1 x frame time)

or put into code:

	velocity = velocity + (acceleration * frame_time);
	position = position + (velocity * frame_time);

Things to note:
	all accounting for frame time is done during integration, values should not be scaled to frame time beforehand except:
	- predictive calculations, such as collision checking
	
	When you scale a value to frame time, you are essentially changing how much time the value represents
	
	For example:
		an acceleration value of 5 implies that this value actually means 5 units per second per second.
		This would be perfect if the game ran at 1 frame per second, but it does not, it runs at (around) 60 frames per second
		If we integrated this value every frame without scaling it, the game would run (around) 60 times faster than it should
		
		So, we scale it to the actual time between frames, instead of just one second
		At 60 FPS, the time between frames is 0.0166 seconds.
		So, 5 units per second per second would become:
			0.0833 units per 0.0166 seconds per 0.0166 seconds
			
		When this scaled value is integrated 60 times over 1 second, 
		it ends up having the same effect as integrating the original value 1 time over the course of 1 second
		
*/

//Semi Implicit Euler
	//velocity += acceleration * dt;
	//position += velocity * dt;

//Acceleration is the rate of change in velocity over time
	//	delta_velocity/delta_time = acceleration = force/mass
	//	dv/dt = a = f/m
	
//Velocity is the rate of change in position over time
	//	delta_position/delta_time = velocity
	//	dx/dt = v

//Velocity_n+1 = velocity_n + (acceleration_n * dt)



/*
	Velocity and Acceleration are measures of change per second.
	So, when doing calculations, they must be divided by the fps to get the change for just one frame
*/


#endregion

#region housekeeping

//Reset acceleration
acc_.set(0, 0);

var _vel_sign = new Vector(0, 0);
var _pos_sign = new Vector(0, 0);






#endregion
#region Movement

input_dir_.set(INPUT_RIGHT - INPUT_LEFT, INPUT_DOWN - INPUT_UP);
acc_ = acc_.add(input_dir_.mult_real(30));
//acc_ = acc_.add_real(0, grav_);
#endregion





#region fraction handling

// Update int & frac based on original


// Update original based on frac & int


#endregion


#region Collision

var _bbox_side = 0;

var _wall_dist = 0;

get_pos_delta();

if(pos_delta_._x > 0)
{
	_bbox_side = bbox_right;
}else if(pos_delta_._x < 0){
	_bbox_side = bbox_left;
}

// Checks the top, bottom, and center points of the bounding box in the direction the player is moving for collisions
if(tilemap_get_at_pixel(tilemap_, _bbox_side + pos_delta_._x, bbox_top)
or tilemap_get_at_pixel(tilemap_, _bbox_side + pos_delta_._x, y + sprite_height/2)
or tilemap_get_at_pixel(tilemap_, _bbox_side + pos_delta_._x, bbox_bottom))
{
		var _projected_pos = _bbox_side + pos_delta_._x;
		
		var _wall_location = (_projected_pos + 16) / 32;
			_wall_location = floor(_wall_location) * 32;
		
		
			
		if(pos_delta_._x > 0){
			wall_dist_ = _wall_location - _projected_pos - 1;
			}
		if(pos_delta_._x < 0){
			wall_dist_ = _wall_location - _projected_pos;
			}
		
		//vel_._x -= wall_dist_ / global.f_time_;
		
		show_debug_message("Wall Location: \t" + string(_wall_location));
		show_debug_message("Projected Bbox location: \t" + string(_projected_pos));
		

		show_debug_message("Wall Distance: \t" + string(wall_dist_));
		
		
		

	// Set X acceleration to 0, then update int & frac values
	acc_._x = 0;
	vel_._x = 0;
}




#endregion

			
// reset acceleration

			
// calculate acceleration
//acc_ = acc_.add(force_.divide(mass_));



#region integration

// velocity = velocity + (acceleration * frame time)
vel_ = vel_.add(acc_.mult_real(global.f_time_));

// position = position + (velocity * frame time)
vel_scaled_ = vel_.mult_real(global.f_time_);
pos_ = pos_.add(vel_scaled_);

//Position Fraction Handling
_pos_sign = pos_.v_sign();
pos_int_ = pos_.v_abs().v_floor().mult(_pos_sign);
pos_frac_ = pos_.sub(pos_int_);


// update position
x = pos_int_._x;
y = pos_int_._y;

#endregion 

#region testing
// Test 1
/*
if(t <= 1)
{
	show_debug_message("Timestep:\t" + string(t));
	acc_.debug_print("Acceleration");
	vel_.debug_print("Velocity");
	pos_.debug_print("Position");
	show_debug_message("Target Frame Time:\t" + string(global.target_f_time_));
	show_debug_message("Real Frame Time:\t" + string(global.f_time_));
	show_debug_message("Delta Multiplier:\t" + string(global.delta_multiplier_));

	switch (mode_)
	{
		case phy_mode.pre_scale:
	
		acc_.set(5*global.target_f_time_, 0)
	
		vel_ = vel_.add(acc_.mult(global.delta_multiplier_));
		pos_ = pos_.add(vel_.mult(global.delta_multiplier_));
	
		break;
	
		case phy_mode.int_scale:
		acc_.set(5, 0)
	
		vel_ = vel_.add(acc_.mult(global.f_time_));
		pos_ = pos_.add(vel_.mult(global.f_time_));
	
		break;
	}
	x = pos_._x;
	y = pos_._y;
	t += global.f_time_;
}
*/
#endregion
