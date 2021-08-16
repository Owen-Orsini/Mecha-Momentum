/// @function			bool_flip(boolean_);
///	@param	{boolean}	_boolean	The Boolean to flip
/// @description	Will flip a given Boolean to opposite value
function bool_flip(_boolean)
{
	if(_boolean == true){
		_boolean = false;
	}else if(_boolean == false){
		_boolean = true;
	}
	return _boolean
}