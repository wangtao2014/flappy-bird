extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("GAME_STATE") #加入GAME_STATE组
	position.y += randf() * 300 - 150 # Y轴随机偏移量的范围(-150,150)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2.LEFT * 200.0 * delta
	if position.x < -50:
		queue_free() # 自动销毁
		
		
func on_game_over():
	set_process(false) #停用_process(delta)
