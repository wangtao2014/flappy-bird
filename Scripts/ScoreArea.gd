extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	body_exited.connect(_on_body_exited)

func _on_body_exited(_body):
	if _body.name == "Bird":  # 先通过body的名字判断一下所撞之物是否为"Bird"
		AudioManager.play("sfx_point") # 音效
		GameData.score += 1
		#加分以后通过ScreenTree把新的分数更新给所有想接受这个消息的节点
		get_tree().call_group("SCORE","on_score_updated", GameData.score)

func on_game_over():
	body_exited.disconnect(_on_body_exited) #得分区域停止触发
