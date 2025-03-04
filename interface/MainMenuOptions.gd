extends VFlowContainer

@export var gameplay_scene: PackedScene
@export var settings_scene: PackedScene

@onready var start_button: Button = $Start
@onready var quit_button: Button = $Quit

func _ready() -> void:
    HUD.enabled = false
    start_button.grab_focus()

    if !OS.has_feature("pc"):
        quit_button.hide()

func _on_quit_pressed() -> void:
    get_tree().quit()

func _on_settings_pressed() -> void:
    get_tree().change_scene_to_packed(settings_scene)

func _on_start_pressed() -> void:
    HUD.enabled = true
    get_tree().change_scene_to_packed(gameplay_scene)
