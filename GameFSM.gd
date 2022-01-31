extends StateMachine

export var fast_close := true
export var mouse_free := true

signal gamepaused(p)
signal mousemode(mode)
signal statechanged()
export var is_paused := false

#onready var p_state: State = get_node(pause_state)
export(String, FILE, "*.tscn") var pause_scene_path


export var pause_state := NodePath()
var pause_scene: State # an instance of the pause scene produced in _setup to pass around
func handle_mouse_mode() -> void:
	if mouse_free:
			emit_signal("mousemode","vis")
	else:
		emit_signal("mousemode","capture")
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and fast_close:
		get_tree().quit() # Quits the game
	
	if event.is_action_pressed("mouse_input") and fast_close:
		mouse_free = not mouse_free
		handle_mouse_mode()
			
func _setup(_m={}) -> void:
	if !OS.is_debug_build():
		fast_close = false
	if fast_close:
		print("** Fast Close: esc to close **")
	handle_mouse_mode()
		
func _on_StateMachine_mousemode(mode):
	match mode:
		"capture":
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		"vis":
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		"confine":
			Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
		_:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			
			


func _on_StateMachine_gamepaused(p):
	if not p is bool:
		pass
	is_paused = p


