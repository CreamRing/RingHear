extends Object
class_name NoteHeight

static var note_names: Dictionary = {
	"C": 1,
	"D": 3,
	"E": 5,
	"F": 6,
	"G": 8,
	"A": 10,
	"B": 12
};

var name: String;
var alter: String;
var number: int;

func set_name(n: String):
	if (n.length() == 3):
		alter = n[1];
		name = str(n[0] + n[2]);
		number = n[2].to_int() * 12 + note_names[n[0]] + alter_to_num(alter);
		
func get_name() -> String:
	var out: String = "";
	out = name;
	if (alter != ""):
		out.insert(1, alter);
	
	return out;
	


func alter_to_num(a: String) -> int:
	if (a == "#"):
		return 1;
	elif (a == "b"):
		return -1;
	
	return 0;
