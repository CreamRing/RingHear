@abstract class_name HarmonyHearManager extends Node;

enum TestState {
	Stop,
	Start,
	Rootnote,
	Verticalnotes,
	Playnote,
	Answer,
	Judge,
	End,
}

static var root_note_highest;
static var root_note_lowest;

static var test_state: TestState = TestState.Stop;

func init():
	test_state = TestState.Stop;

static func save_file():
	pass
	
static func load_file():
	pass

func start_test():
	test_state = TestState.Start;

func _process(delta: float) -> void:
	if (test_state == TestState.Rootnote):
		decide_root_note();
	elif (test_state == TestState.Verticalnotes):
		decide_vertical_notes();
	elif (test_state == TestState.Playnote):
		play_note();
	elif (test_state == TestState.Answer):
		wait_anwser();
	elif (test_state == TestState.Judge):
		judge_anwser();

@abstract func decide_root_note();

@abstract func decide_vertical_notes();

@abstract func play_note();

@abstract func wait_anwser();

@abstract func judge_anwser();
