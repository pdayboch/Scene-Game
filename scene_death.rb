require "./scenes.rb"

class Scene_death < Scene
	def initialize()
		super
	end

	def enter()
		puts "You died. Please feel free to try again."
		exit(1)
	end
end
