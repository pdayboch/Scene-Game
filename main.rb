require "./scenes.rb"
require "./map.rb"
require "./person.rb"
require "./inventory.rb"

class Engine
#	@param profile [Person] The users profile
#	@param map [Map] The map object that contains all of the scenes.
	def initialize(profile, map)
		@Profile = profile
		@Map_layout = map
		@Start_scene = map.get_start()
	end

	def play()
		next_scene = @Start_scene
		while next_scene!='win' && next_scene != 'death'
			scene = @Map_layout.get_scene(next_scene)
			scene.set_profile(@Profile)
			scene.enter()
			scene.actions()
			next_scene = scene.choice()
			scene.export_decisions()
			@Profile.get_decisions_map()
		end

		@Map_layout.get_scene(next_scene).enter()
	end
end

# Create a new profile and add the start items to the inventory
profile = Person.new("Phil")
profile.add_item(2, 'Bottle of Rum')
profile.add_item(1, 'Tuna Head')
profile.add_item(1, 'Bar(s) of Gold')

# Create a new Map and build the engine.
amap = Map.new('boat')
engine = Engine.new(profile, amap)
engine.play()
