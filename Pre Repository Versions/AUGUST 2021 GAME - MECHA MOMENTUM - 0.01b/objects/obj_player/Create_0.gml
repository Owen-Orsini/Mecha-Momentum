


tilemap_ = layer_tilemap_get_id("TilesWalls");

// Player Speed Values
hsp_ = 0; hsp_whole_ = 0; hsp_frac_ = 0;
vsp_ = 0; vsp_whole_ = 0; vsp_frac_ = 0;



walk_acc_ = 0.05;
air_acc_ = 0.1;

// -TEMPORARY- Friction Values
global.h_fric_air_ = global.h_fric_air_default_;
global.h_fric_ground_ = global.h_fric_ground_default_;

global.v_fric_air_ = global.v_fric_air_default_;

x_dir_ = 0;
y_dir_ = 0;
global.grav_ = global.grav_default_;
walk_spd_ = 4;
air_spd_ = 12;

grounded_ = false;

thrust_acc_ = 0.03;


enum player_state_{
	normal,
	swing,
	paused

}
state_ = player_state_.normal;



















//max_walking_spd_ = 5;
//acceleration_ = 1.1;
//total_max_spd_ = 10;
//mass = 100;
//acc_ = [0, 0];
//vel_ = [0, 0];



//state_ = GROUNDED; 


