extends State

export(String, FILE, "*.tscn") var game_scene_path
onready var g_scene = load(game_scene_path)

func _on_StartButton_pressed():
	var g_state: State = g_scene.instance()
	var mach = self.get_parent()
	mach.add_child(g_state)
	g_state.set_owner(mach)
	var m = mach.get_child(1)
#	print(mach.get_path_to(m))
	mach.transition(mach.get_path_to(m))
	mach.remove_child(self)
	mach.emit_signal("mousemode","capture")
	

		

func _on_SettingsButton_pressed():
	pass # Replace with function body.


func _on_QuitButton_pressed():
	get_tree().quit()
