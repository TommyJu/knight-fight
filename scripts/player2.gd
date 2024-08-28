extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var attack_collision: CollisionShape2D = $Killzone/AttackCollision


var isAttacking = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump2") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation_player.play("jump_sound")

	# Get the input direction and handle the movement/deceleration. (-1, 0, -1)
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction := Input.get_axis("move_left2", "move_right2")
	# Flip the sprite and attack collision
	if direction > 0:
		get_node("Killzone").set_scale(Vector2(1, 1))
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		get_node("Killzone").set_scale(Vector2(-1, 1))
	
	if isAttacking == false:
		# Play animations
		if is_on_floor():
			if direction == 0:
				animated_sprite_2d.play("idle")
			else:
				animated_sprite_2d.play("run")
		else:
			animated_sprite_2d.play("jump")
	
	# Handle attack
	if Input.is_action_just_pressed("attack2"):
		animated_sprite_2d.play("attack")
		isAttacking = true
		attack_collision.disabled = false
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
		
# Ends the attack animation
func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "attack":
		isAttacking = false
		attack_collision.disabled = true
