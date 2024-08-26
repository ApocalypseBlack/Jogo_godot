extends Control

@onready var label_melan = $MarginContainer/HBoxContainer/label_melan
@onready var time_cont = $MarginContainer/HBoxContainer/time_cont

signal tempo_acabou()

var minutos = 0
var segundos = 0


@export_range(0,2) var min_padrao = 1
@export_range(0,59) var seg_padrao = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	label_melan.text = str("%03d" % Global.ponto)
	time_cont.text = str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)
	
	minutos = min_padrao 
	segundos = seg_padrao


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label_melan.text = str("%03d" % Global.ponto)
#	contador_melons.text = str("%03d" % Globo.pontos)
	if minutos == 0 && segundos == 0:
		emit_signal("tempo_acabou")




func _on_timer_timeout():
	if segundos == 0:
		if minutos >0:
			minutos -=1
			segundos = 60
			
	segundos -=1
	time_cont.text = str("%02d" % minutos) + ":" + str("%02d" % segundos)

