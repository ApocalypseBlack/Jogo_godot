extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
@onready var player = $"../CharacterBody2D"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	pass # Replace with function body.


func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		print("levou dano?")
		player._levouDano(1)
		
		
		

