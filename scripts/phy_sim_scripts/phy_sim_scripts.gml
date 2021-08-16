function Vector(_x_, _y_) constructor
{
	//set x and y components of vector
	_x = _x_; _y = _y_;
	
	// for: add, sub, mult, divi; 
		// _mode 0 - operates on the calling Vector
		// _mode 1 - does operation, returns the result as a Vector
		
	// set the value of a function	
	set = function(x__, y__)
		{_x = x__; _y = y__;};
	
	// add the value of two vectors
	add = function(_vec)
		{return new Vector(_x + _vec._x, _y + _vec._y);};
		
	
	// add real numbers to vector	
	add_real = function(x__, y__)
		{return new Vector(_x + x__, _y + y__);};
	
	// subtract the value of two vectors
	sub = function(_vec)
		{return new Vector(_x - _vec._x, _y - _vec._y);};

	sub_real = function(x__, y__)
		{return new Vector(_x - x__, _y - y__);};
		
	mult = function(_vec)
		{return new Vector(_x * _vec._x, _y * _vec._y);};
	
	// multiply/scale a vector by a real number
	mult_real = function(_scalar)
		{return new Vector(_x * _scalar, _y * _scalar);};
	
	// divide/scale a vector
	divide = function(_scalar)
		{return new Vector(_x / _scalar, _y / _scalar);};
	
	// get the magnitude, or length, of the vector
	get_mag = function()
		{return sqrt((_x * _x) + (_y * _y));};
	
	// normalize a Vector, or makes it's length 1
	normalize = function()
		{if(get_mag() != 0){return divide(get_mag());}};
		
	// limit Vector magnitude to a given value
	limit_mag = function(_len)
		{if(get_mag() > _len){return new Vector(_x * (_len/get_mag()), _y * (_len/get_mag()));}};
		
	// return direction/heading of vector relative to 0, 0
	dir = function()
		{return point_direction(0, 0, _x, _y);};
		
	v_floor = function()
		{return new Vector(floor(_x), floor(_y));};
		
	v_abs = function()
		{return new Vector(abs(_x), abs(_y));};
		
	v_sign = function()
		{return new Vector(sign(_x), sign(_y));};
		
	// -TEMPORARY- print x and y values
	debug_print = function(_str)
	{
		show_debug_message(_str + ":\t{ _x : " + string(_x) + ",\t_y : " + string(_y) + " }");
	}
}


function get_pos_delta()
{
	//Simulate integration to find the change in position
	var _vel = vel_.add(acc_.mult_real(global.f_time_));
	var _pos = pos_.add(_vel.mult_real(global.f_time_));
	
	var _pos_sign = _pos.v_sign();
	var _pos_int = _pos.v_abs().v_floor().mult(_pos_sign);
	
	pos_delta_ = _pos_int.sub(pos_int_);
}


//Adds two Vectors
	//vector1.x + vector2.x = vector_new.x
	//vector1.y + vector2.y = vector_new.y
	//return vector_new
//function vector_add(v_1, v_2)
//{
//	var _new_vec = new Vector(v_1._x + v_2._x, v_1._y + v_2._y);
	
//	return _new_vec;
//}
//function vector_sub(v_1, v_2)
//{
//	var _new_vec = new Vector(v_1._x - v_2._x, v_1._y - v_2._y);
	
//	return _new_vec;
//}
//function vector_sub(v_1, v_2)
//{
//	var _new_vec = new Vector(v_1._x - v_2._x, v_1._y - v_2._y);
	
//	return _new_vec;
//}
