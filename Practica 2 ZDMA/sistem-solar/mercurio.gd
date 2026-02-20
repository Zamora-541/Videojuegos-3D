extends Sprite2D

var speed = 600
var angular_speed = 10



func _process(delta):
	rotation += angular_speed * delta

	var velocity = Vector2.UP.rotated(rotation) * speed

	position += velocity * delta
