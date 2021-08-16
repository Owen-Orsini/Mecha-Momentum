/// @function			approach(a, b, amount)



function approach(a, b, amount)
{
	if(a < b){
		a = a + amount;
		if(a > b){
			return b;
		}
	
	}else{
		a = a - amount;
		if(a < b){
			return b;
		}
	
	}
	return a;
	
}