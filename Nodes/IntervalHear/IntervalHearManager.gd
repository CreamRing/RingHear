extends HarmonyHearManager
class_name IntervalHearManager;

static var properties: Array = [];
static var property_anwsers: Array = [];

const save_path = "user://harmony_save.sav";

static func load_file():
	print_debug("Interval Loaded");
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
	
static func save_file():
	var file: FileAccess = FileAccess.open(save_path, FileAccess.WRITE);
	var data: Dictionary = {
		"Properties": properties,
		"PropertyAnwsers": property_anwsers
	};
	var text = JSON.stringify(data, "\t");
	file.store_string(text);
	file.close();

func decide_root_note():
	pass
	
func decide_vertical_notes():
	pass
	
func play_note():
	pass
	
func wait_anwser():
	pass
	
func judge_anwser():
	pass
