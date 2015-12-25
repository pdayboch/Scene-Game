require "./scenes.rb"

class Scene_win < Scene
	def initialize()
		super
	end

	def enter()
		puts "win"
		exit(1)
	end
end
