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
	
	// subtract the value of two vectors
	sub = function(_vec)
		{return new Vector(_x - _vec._x, _y - _vec._y);};
	
	// multiply/scale a vector
	mult = function(_scalar)
		{return new Vector(_x * _scalar, _y * _scalar);};
	
	// divide/scale a vector
	divi = function(_scalar)
		{return new Vector(_x / _scalar, _y / _scalar);};
	
	// get the magnitude, or length, of the vector
	mag = function()
		{return sqrt((_x * _x) + (_y * _y));};
	
	// normalize a Vector, or makes it's length 1
	norm = function()
		{if(mag() != 0){return divi(mag());}};
		
	// -TEMPORARY- print x and y values
	debug_print = function(_str)
	{
		show_debug_message(_str + "\t=\t{ _y : " + string(_x) + ",\t_y : " + string(_y) + " }");
	}
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
