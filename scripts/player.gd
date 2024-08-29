extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const MINIMUM_SPEED = SPEED / 2
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var attack_collision: CollisionShape2D = $TakeCoin/AttackCollision
@onready var game_manager: Node = %GameManager

var isAttacking = false
var isDamaged = false
var current_speed = SPEED  

func _physics_process(delta: float) -> void:
	# Adjust movment speed
	if game_manager.score_player_1 < 10:
		current_speed = SPEED * (1 - (0.05 * game_manager.score_player_1))
	else:
		current_speed = MINIMUM_SPEED
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation_player.play("jump_sound")

	# Get the input direction and handle the movement/deceleration. (-1, 0, -1)
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction := Input.get_axis("move_left", "move_right")
	# Flip the sprite and attack collision
	if direction > 0:
		get_node("TakeCoin").set_scale(Vector2(1, 1))
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		get_node("TakeCoin").set_scale(Vector2(-1, 1))
	
	if not isAttacking && not isDamaged:
		# Play animations
		if is_on_floor():
			if direction == 0:
				animated_sprite_2d.play("idle")
			else:
				animated_sprite_2d.play("run")
		else:
			animated_sprite_2d.play("jump")
		
		# Handle attack
		if Input.is_action_just_pressed("attack"):
			animated_sprite_2d.play("attack")
			animation_player.play("attack_sound")
			isAttacking = true
			attack_collision.disabled = false
	
	
	# Apply movement
	if direction:
		velocity.x = direction * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		
	move_and_slide()
		
# Ends the attack animation
func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "attack":
		isAttacking = false
		attack_collision.disabled = true
	if animated_sprite_2d.animation == "damage":
		isDamaged = false
		
