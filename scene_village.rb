require "./scenes.rb"

class Scene_village < Scene
	def initialize()
		super
	end

	def enter()
		puts "village"
	end

	def choice()
		num = $stdin.gets.chomp.to_i
		if num == 1
			return 'jail'
		end
	end
end
