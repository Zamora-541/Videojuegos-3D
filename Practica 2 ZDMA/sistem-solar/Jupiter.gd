extends Sprite2D

var speed = 300
var angular_speed = 1


func _process(delta):
	rotation += angular_speed * delta

	var velocity = Vector2.UP.rotated(rotation) * speed

	position += velocity * delta
