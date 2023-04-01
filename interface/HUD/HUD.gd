extends Node2D

@onready var icon:Sprite2D = $Icon

func _process(delta:float) -> void:
    if Input.is_action_pressed("ui_accept"):
        get_tree().change_scene_to_file("res://interface/MainMenu.tscn")

    icon.rotate(delta)

func _input(event:InputEvent) -> void:
    if event.is_action_released("pause"):
        call_deferred("_pause")

func _pause() -> void:
    @warning_ignore('unsafe_method_access')
    $PauseMenu.pause()
    get_tree().paused = true
