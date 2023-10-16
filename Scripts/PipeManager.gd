extends Timer

var pipe_scn = preload("res://Objects/pipe.tscn") # 将要实例化的场景文件预加载进来


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("GAME_STATE")#加入GAME_STATE组
	timeout.connect(_on_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timeout():
	var pipe = pipe_scn.instantiate() # 实例化
	add_child(pipe) # 将实例化的结果作为自身的子节点

func on_game_over():
	paused = true #停止计时
