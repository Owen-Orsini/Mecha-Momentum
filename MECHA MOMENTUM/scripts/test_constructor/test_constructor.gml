// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function stat() constructor
{
	letter = choose("A", "B", "C", "D");
	number = irandom_range(1, 10);
	inc_num = function(){
		self.number++;
	}
	
}