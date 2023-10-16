extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("GAME_STATE")
	set_process(false)#刚开局先停用_process(delta)方法


func on_game_over():
	$LabelCurrent.text = str(GameData.score)#显示本局成绩
	$LabelRecord.text = str(GameData.load_record())#显示历史最好成绩
	$AnimationPlayer.play("show")#显示计分板


func _process(delta):#一旦开启_process(delta)，用户再次点击屏幕，将开始新的一局
	if Input.is_mouse_button_pressed(1):
		get_tree().call_group("GAME_STATE","on_game_start")

func on_board_shown():#由动画触发的回调函数，负责开启_process(delta)方法
	set_process(true)
