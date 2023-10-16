extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("SCORE") #把自己加入"SCORE"组


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func on_score_updated(score):# 当接收到"SCORE"组的调用时，更新分数
	text = str(score)
