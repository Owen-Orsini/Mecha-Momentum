// 16 pixels == 1 meter
// VECTORS
randomize();
pos_ = new Vector(0, 0);	// Position
vel_ = new Vector(0, 0);	// units per frame time
acc_ = new Vector(0, 0);	// units per frame time per frame time

vel_scaled_ = new Vector(0, 0);
pos_int_ = new Vector(0, 0);
pos_frac_ = new Vector(0, 0);
pos_delta_ = new Vector(0, 0);

input_dir_ = new Vector(0, 0);

wall_dist_ = 0;

pos_.set(x, y);


mass_ = 1000; //grams

grav_ = 9.8; // measure of acceleration

tilemap_ = layer_tilemap_get_id("TilesWalls");



#region Test 1
/*
enum phy_mode
{
	// scale values to ft before calculation
	pre_scale,
	// scale values to ft during integration
	int_scale,
}

mode_ = phy_mode.int_scale;
*/
#endregion
#region Test 2 - Fraction Handling 1
/*
var _pos = new Vector(0, 0);
var _pos_sign = new Vector(0, 0);
var _pos_int = new Vector(0, 0);
var _pos_frac = new Vector(0, 0);
var _pos_derived = new Vector(0, 0);
var _pos_match = 0;

show_debug_message("Update int & frac from original,")
show_debug_message("then check if accurate.")
for(i = 0; i < 10; i++)
{
	// Test if derived int & frac values accurately represent original value
		
	_pos.set(random_range(-10, 10), random_range(-10, 10));
		
	_pos_sign = _pos.v_sign();
	_pos_int = ((_pos.v_abs()).v_floor()).mult(_pos_sign);
	_pos_frac = _pos.sub(_pos_int);
	_pos_derived = _pos_int.add(_pos_frac);
	if(_pos._x == _pos_derived._x and _pos._y == _pos_derived._y){_pos_match = "True";}else{_pos_match = "False";}
	

	// Print Test Results
	show_debug_message("test #:\t" + string(i + 1));
	_pos.debug_print("Original");
	_pos_int.debug_print("Int");
	_pos_sign.debug_print("Sign");
	_pos_frac.debug_print("Frac");
	_pos_derived.debug_print("Derived");
	show_debug_message(_pos_match);
	show_debug_message("");
}
*/
#endregion
#region Test 3 - Fraction Handling 2
/*
var _pos_n = new Vector(0, 0);
// position n, initial position
var _pos_n1 = new Vector(0, 0);
// position n+1, position after change
var _pos_sign = new Vector(0, 0);
var _pos_int = new Vector(0, 0);
var _pos_frac = new Vector(0, 0);
var _delta_pos = new Vector(0, 0);

for(i = 0; i < 10; i++){

	// Set Initial Position
	_pos_n.set(random_range(-10, 10), random_range(-10, 10));
	// Derive int & frac from initial position
	_pos_sign = _pos_n.v_sign();
	_pos_int = ((_pos_n.v_abs()).v_floor()).mult(_pos_sign);
	_pos_frac = _pos_n.sub(_pos_int);


}
*/
#endregion

































