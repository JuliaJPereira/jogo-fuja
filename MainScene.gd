extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(PackedScene) var enemy_scene
var screen_size
var PADDING_MIN = 20
var score



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	screen_size = get_viewport_rect().size
	score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_enemyTimer_timeout():
	var enemy = enemy_scene.instance()
	enemy.position.x = rand_range(PADDING_MIN, screen_size.x - PADDING_MIN)
	get_tree().get_root().add_child(enemy)


func _on_player_area_entered(area: Area2D):
	if area.is_in_group("enemy"):
		$Canvas/Button.show()
		$Canvas/Label.show()
		$Canvas/Label.text =  "Fim de Jogo"
		$player.hide()
		$enemyTimer.stop()
		$ScoreTimer.stop()


func _on_Button_button_down():
	$Canvas/Button.hide()
	$Canvas/Label.hide()
	$enemyTimer.start()
	$player.show()
	$ScoreTimer.start()
	score = 0


func _on_ScoreTimer_timeout():
	score += 1
	$Canvas/Score.text = "Score: " + str(score)
