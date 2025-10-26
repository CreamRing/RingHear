extends HarmonyHearManager
class_name IntervalHearManager;

static var properties: Array = [];
static var property_anwsers: Array = [];

var root_note = "";

const save_path = "user://harmony_save.sav";

static func load_file():
	if (!FileAccess.file_exists(save_path)):
		save_file();
		return;
	var file: FileAccess = FileAccess.open(save_path, FileAccess.READ_WRITE);
	var json_text: String = file.get_as_text();
	var json = JSON.new();
	var err: Error = json.parse(json_text);
	if (err == OK):
		var data: Dictionary = json.data;
		if (data.has("Properties")):
			properties = data["Properties"];
		if (data.has("PropertyAnwsers")):
			property_anwsers = data["PropertyAnwsers"];
		if (data.has("NoteHighest")):
			note_highest = data["NoteHighest"];
		if (data.has("NoteLowest")):
			note_lowest = data["NoteLowest"];
	
static func save_file():
	var file: FileAccess = FileAccess.open(save_path, FileAccess.WRITE);
	var data: Dictionary = {
		"Properties": properties,
		"PropertyAnwsers": property_anwsers,
		"NoteHighest": note_highest,
		"NoteLowest": note_lowest,
	};
	var text = JSON.stringify(data, "\t");
	file.store_string(text);
	file.close();

func decide_root_note():
	root_note = NoteHeight.random_note(note_lowest, note_highest);
	
func decide_vertical_notes():
	pass
	
func play_note():
	pass
	
func wait_anwser():
	pass
	
func judge_anwser():
	pass
