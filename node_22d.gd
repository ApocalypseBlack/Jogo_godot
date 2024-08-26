extends Node2D

@onready var player = $CharacterBody2D


# Called when the node enters the scene tree for the first time.'
func _ready():
	Global.ponto = 0
	
	
	player.morreu.connect(_reset)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _reset():
	get_tree().reload_current_scene()
	
 
@onready var control = $CanvasLayer/Control
func _on_body_entered(body):
	control.segundos +=5
	await $collisionShape.call_deferred("queue_free")
