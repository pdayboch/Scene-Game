class Scene

	def initialize()
		@actions = ["actions", "not", "configured"]
		@Decisions =[]
	end

	def set_profile(profile)
		@Profile = profile
	end

	def actions()
		i=1
		@actions.each do |act|
			puts "#{i}: #{act}"
			i += 1
		end
		print "> "
	end

	def export_decisions()
		@Profile.add_decisions(@Decisions)
	end
end



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

class Scene_win < Scene
	def initialize()
		super
	end

	def enter()
		puts "win"
		exit(1)
	end
end

class Scene_death < Scene
	def initialize()
		super
	end

	def enter()
		puts "You died. Please feel free to try again."
		exit(1)
	end
end
