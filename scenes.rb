class Scene

	def initialize()
		@actions = ["actions", "not", "configured"]
	end

	def set_profile(profile)
		@profile = profile
	end

	def actions()
		i=1
		@actions.each do |act|
			puts "#{i}: #{act}"
			i += 1
		end
		print "> "
	end

	def add_action(action)
		remove_action("Use inventory")
		@actions.push(action)
		@actions.push("Use inventory")
	end

	def remove_action(action)
		@actions.delete(action)
	end
end
