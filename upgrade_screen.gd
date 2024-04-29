extends TileMap
signal upgraded(level, upgrade_name)

var bomb_radius
var fuse_time
var bomb_cooldown
var multi_throw

func _ready():
	upgraded.connect(get_parent().get_child(0)._on_upgraded)
	load_levels()

func _on_bomb_radius_upgraded(level, upgrade_name):
	upgraded.emit(level, upgrade_name)


func _on_fuse_time_upgraded(level, upgrade_name):
	upgraded.emit(level, upgrade_name)


func _on_bomb_cd_upgraded(level, upgrade_name):
	upgraded.emit(level, upgrade_name)


func _on_multi_throw_upgraded(level, upgrade_name):
	upgraded.emit(level, upgrade_name)

func load_levels():
	var upgrades = get_children().slice(3, get_child_count())
	upgrades[0].set_level(bomb_radius)
	upgrades[1].set_level(fuse_time)
	upgrades[2].set_level(bomb_cooldown)
	upgrades[3].set_level(multi_throw)
