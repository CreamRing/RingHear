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

static var note_names_list: Array[String] = ["C", "D", "E", "F", "G", "A", "B"];

var name: String;
var alter: String;
var number: int;

func set_name(n: String):
	if (n.length() == 3):
		alter = n[1];
		name = str(n[0] + n[2]);
		number = n[2].to_int() * 12 + note_names[n[0]] + alter_to_num(alter);
	else:
		alter = "";
		name = str(n[0] + n[1]);
		number = n[1].to_int() * 12 + note_names[n[0]] + alter_to_num(alter);
		
func get_name() -> String:
	var out: String = "";
	out = name;
	if (alter != ""):
		out.insert(1, alter);
	
	return out;
	
func set_number(num: int):
	var octave: int = int(float(num) / 12);
	var note_name_num = num - octave  * 12;
	var n_name = "";
	for i in note_names.keys():
		if (abs(note_name_num - note_names[i]) <= 1):
			n_name = i;
	
	if (note_names[n_name] > note_name_num):
		alter = "b";
	elif (note_names[n_name] < note_name_num):
		alter = "#";
	else:
		alter = "";
	
	name = n_name + alter + str(octave);

func set_name_with_interval(root: String, property: String) -> NoteHeight:
	var root_note: NoteHeight = NoteHeight.new();
	var top_note: NoteHeight = NoteHeight.new();
	root_note.set_name(root);
	top_note.set_name(root);
	var num = property[1].to_int();
	top_note.add(num);
	match (top_note.number - root_note.number + Properties.interval_property[property]):
		1:
			top_note.alter = "b";
		-1:
			top_note.alter = "#";
	
	return top_note;

func add(num: int):
	var now_num = note_names_list.find(name[0]);
	var octave = name[1].to_int();
	for i in range(num):
		if (now_num > 6):
			now_num = 0;
			octave += 1;
			if (octave >= 8):
				octave = 8;
			
		now_num += 1;
	
	set_name(note_names_list[now_num] + alter + str(octave));
	
func sub(num: int):
	var now_num = note_names_list.find(name[0]);
	var octave = name[1].to_int();
	for i in range(num):
		if (now_num < 0):
			now_num = 0;
			octave -= 1;
			if (octave < 0):
				octave = 0;
			
		now_num -= 1;
	
	set_name(note_names_list[now_num] + alter + str(octave));
	
static func random_note(from: String, to: String) -> NoteHeight:
	var a: NoteHeight = NoteHeight.new();
	var b: NoteHeight = NoteHeight.new();
	a.set_name(from);
	b.set_name(to);
	if (a.number >= b.number):
		return;
	
	var num = randi_range(a.number, b.number);
	
	var c: NoteHeight = NoteHeight.new();
	c.set_number(num);
	
	return c;

func alter_to_num(a: String) -> int:
	if (a == "#"):
		return 1;
	elif (a == "b"):
		return -1;
	
	return 0;
