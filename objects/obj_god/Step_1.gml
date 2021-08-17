#region Update DT
global.f_time_ = delta_time / 1000000;

global.delta_multiplier_ = global.f_time_ / global.target_f_time_;
#endregion
if(tester_created == false){
	switch mode
	{
		case test_mode.phys_test:
		{
			instance_create_layer(0, 0, "Instances", obj_phys_tester);
		}break;
	
		case test_mode.struct_test:
		{
			instance_create_layer(0, 0, "Instances", obj_struct_tester);
		}break;
		case test_mode.phys_sim:
		{
			instance_create_layer(room_width/2, room_height/2, "Instances", obj_player);
		}break;
	}
	tester_created = true;
}