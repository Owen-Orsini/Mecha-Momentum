/// @description Insert description here
// You can write your code in this editor
show_debug_message("Mode:\tStruct Test");
#region Struct
/*stat = {
	letter : choose("A", "B", "C", "D"),
	number : irandom_range(1, 10),
	inc_num : function(){
		self.number++;
	},
};
*/
//show_debug_message("Letter:\t" + string(stat.letter) + "\tNumber:\t" + string(stat.number));
#endregion
#region Constructor
stats = new stat();
show_debug_message(string(stats));
#endregion