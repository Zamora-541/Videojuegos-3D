extends Area2D
signal hit
@export var speed = 400
var screen_size
@onready var health_var = $ProgressBar
var is_hit = false	
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	health_var.max_value = 100
	health_var.value = 100
	# Replace with function body.
	hide()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("Mover_Derecha"):
		velocity.x += 1
	if Input.is_action_pressed("Mover_Izquierda"):
		velocity.x -= 1
	if Input.is_action_pressed("Mover_Abajo"):
		velocity.y += 1
	if Input.is_action_pressed("Mover_Arriba"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "Caminar"
		$AnimatedSprite2D.flip_v = false
	# See the note below about the following boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "Arriba"
		#$AnimatedSprite2D.flip_v = velocity.y > 0
	

func _on_body_entered(_body):
	health_var.value -= 10
	$AnimatedSprite2D.animation = "Hit"
	$AnimatedSprite2D.play()
	
	if health_var.value <= 0:
		
		$CollisionShape2D.set_deferred("disabled", true)
		$AnimatedSprite2D.animation = "Dead"
		$AnimatedSprite2D.play()
		hide()
		hit.emit()
func start(pos):
	position = pos
	health_var.value = 100
	show()
	$CollisionShape2D.disabled = false
