extends CharacterBody2D


const SPEED = 300.0#velocidade constante
const JUMP_VELOCITY = -400.0#velocidade de oulo constante
var pulando = false
var is_takingdamage = false
var vida = 3
signal morreu

# Get the gravity from the project settings to be synced with RigidBody nodes.

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")#gravidade variavel
func _physics_process(delta): #funcao de processo psiquio
	# Add the gravity.
	
	if not is_on_floor():
		velocity.y += gravity * delta# velocidade 
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and !is_takingdamage: #acao so executada pessionando,,,e no chao 
		velocity.y = JUMP_VELOCITY #velocidade de pulo
		pulando = true
	else:
		pulando = false
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")#variaçao de direcao
	if direction and !is_takingdamage:
			velocity.x = direction * SPEED# velocidade x
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	#Animação
	if !is_takingdamage:
		if is_on_floor():
			if pulando:
				$AnimatedSprite2D.play("jump")
			elif direction !=0: #diferente de 0 != não 0 ~not 0
				$AnimatedSprite2D.play("run")
			elif direction == 0:
				$AnimatedSprite2D.play("idle")
		else:
			if velocity.y <0:
				$AnimatedSprite2D.play("jump")
		
			else:
				$AnimatedSprite2D.play("fall")
	
	move_and_slide()# movimento e slide

func _levouDano(dano):
	
	is_takingdamage = true
	vida -= dano 
	$AnimatedSprite2D.play("hit")
	await $AnimatedSprite2D.animation_finished
	is_takingdamage = false
	
	print("vida:",vida)
	if vida <= 0:
		print("morreu")
		
func PlayerMorreu():
	emit_signal("morreu")
		
