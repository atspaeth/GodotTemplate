extends Node2D

func _process(_delta):
    if Input.is_action_pressed("ui_accept"):
        get_tree().change_scene_to_file("res://interface/MainMenu.tscn")

    $Icon.rotate(_delta)

func _input(event):
    if event.is_action_released("pause"):
        call_deferred("_pause")

func _pause():
    $PauseMenu.pause()
    get_tree().paused = true
