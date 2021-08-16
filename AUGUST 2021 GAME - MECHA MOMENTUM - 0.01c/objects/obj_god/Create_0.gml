/// @description Insert description here
//Inputs
#region Delta Time
global.target_fps_ = 60;
// target time between frames (1 60th of a second)
global.target_f_time_ = 1/global.target_fps_;
// actual time between frames 
	// the built in variable "delta_time" is misnamed, it represents the time between frames, not the change (or delta) in time between frames
global.f_time_ = delta_time/1000000
// multiplier used to compensate for frame time deviating from the target
global.delta_multiplier_ = global.f_time_ / global.target_f_time_;

#endregion
tester_created = false;

enum test_mode
{
	phys_test,
	struct_test,
	phys_sim

}
mode = test_mode.phys_sim;
switch mode
{
	case test_mode.phys_test:
	{
		room_goto(rm_test_2);		
	}break;
	
	case test_mode.struct_test:
	{
		room_goto(rm_test_2);
	}break;
	case test_mode.phys_sim:
	{
		room_goto(rm_lvl_test_2);
	}break;


}







global.dt_ = 1/60;


//Declare global variables
	//Is the game paused?
global.paused_ = false;
	//Is the player alive/does player object exist?
global.player_alive_ = false;
	//Force of Gravity
global.grav_ = 0;
global.grav_default_ = 0.1

	// Friction
global.h_fric_ground_ = 0;
global.h_fric_ground_default_ = 0.1;

global.h_fric_air_ = 0;
global.h_fric_air_default_ = 0.01;

global.v_fric_air_ = 0;
global.v_fric_air_default_ = 0.01;


//Declare local variables










//room_goto(rm_lvl_test_1);

