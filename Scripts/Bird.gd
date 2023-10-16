extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(_on_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _physics_process(delta):
	if Input.is_mouse_button_pressed(1): # 当按鼠标左键时
		AudioManager.play("sfx_swooshing") # 音效
		linear_velocity = Vector2.UP * 500 # 给它一个竖直向上的线性速度
		angular_velocity = -3.0 # 同时给它一个逆时针的角速度
	if rotation_degrees < -30:
		rotation_degrees = -30
		angular_velocity = 0
	if linear_velocity.y > 0.0: # 下坠时给它一个顺时针的角速度
		angular_velocity = 1.5 


func _on_body_entered(_body):
	if _body is StaticBody2D: # 先通过body的类型判断一下所撞之物是否为一个"StaticBody2D"
		call_deferred("set_physics_process",false)#停用_physics_process(delta)
		call_deferred("set_contact_monitor",false)#关闭碰撞检测
		AudioManager.play("sfx_hit")#播放碰撞音效
		$AnimationPlayer.play("die")#动画切换到死亡状态
		GameData.update_record()#更新最好成绩记录
		get_tree().call_group("GAME_STATE", "on_game_over")#调用GAME_STATE的on_game_over方法
