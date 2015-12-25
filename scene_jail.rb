require "./scenes.rb"

class Scene_jail < Scene
	def initialize()
		super
	end

	def enter()
		puts "jail"
	end

	def choice()
		num = $stdin.gets.chomp.to_i
		if num == 1
			return 'win'
		end
	end
end
