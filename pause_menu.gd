extends CanvasLayer
var game_paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_voltar_bt_pressed():
	get_tree().paused = false
	visible = false 


func _on_restart_bt_pressed():
	get_tree(). paused = false
	get_tree(). change_scene_to_file("res://LEVEL.tscn")
	emit_signal("resetou")

func _on_quit_bt_pressed():
	get_tree(). quit()
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		game_paused = !game_paused
		get_tree().paused = true
		visible = true
		
		
