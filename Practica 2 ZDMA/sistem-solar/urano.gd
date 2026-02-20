extends Sprite2D

var speed = 150
var angular_speed = .25


func _process(delta):
	rotation += angular_speed * delta

	var velocity = Vector2.UP.rotated(rotation) * speed

	position += velocity * delta
