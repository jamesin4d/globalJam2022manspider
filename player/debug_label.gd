extends Label
export(NodePath) var player
export(NodePath) var ch 
onready var p = get_node(player)
func _ready():
	options("cik")
	
func options(opt:String):
	set_text("options:"+opt)
func _process(delta):
	pass
