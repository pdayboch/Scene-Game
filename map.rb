require "./scenes.rb"
require "./scene_boat.rb"
require "./scene_water.rb"

class Map
	@@Scenes = {
		'boat' => Scene_boat.new(),
		'water' => Scene_water.new(),
		'beach' => Scene_beach.new(),
		'village' => Scene_village.new(),
		'jail' => Scene_jail.new(),
		'win' => Scene_win.new(),
		'death' => Scene_death.new()
	}

	def initialize(start_scene)
		@Start_scene = start_scene
	end

	def get_start()
		return @Start_scene
	end

	def get_scene(scene)
		return @@Scenes[scene]
	end
end
