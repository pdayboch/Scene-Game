class Scene
	@Profile

	def initialize()
		@actions = ["actions", "not", "configured"]
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
	end
end

class Scene_boat < Scene
	def initialize()
		super
		@actions = ['Jump into the water and swim away.',
					'Reach for your sword.',
					'Look in your inventory.'
					]
	end

	def enter()
		puts "You wake up on a swinging hammock with the smell of salt in the air."
		puts "You listen closely and the seagulls are fighting over the morning catch."
		puts "You hear a loud commotion and decide to go up on deck."
		puts "Before you can peak your head outside, a sword is at your throat."
		puts "Pirates have taken over your ship and your whole crew is tied up."
		puts "Your next move is more important than you think."
	end

	def choice()

		num = $stdin.gets.chomp.to_i
		decision.push(num)
		if num == 1
			puts "you slowly backup to the edge of the deck. Before the captain says"
			puts "the next word, your falling into the icy water in the middle of the Pacific."
			return 'water'
		elsif num == 2
				puts "You quickly reach down to your sword handle but before you can close your grip"
				puts "the pirate sailors slice off your arms at the elbows. You stumble around screaming"
				puts "until 3 of the pirate pick you up and throw you into the water."
				puts "A shark quickly grabs the scent of blood and aggressivly swims over."
				puts "He takes one bite of your foot, and then your leg, and then your head."
			return 'death'
		elsif num == 3
			return use_inventory()
		end
	end

	def use_inventory()
		item = @Profile.use_item()

		if item == "Bottle of Rum"
			puts "You happily mention there's a bottle of Captain under your bed."
			puts "The pirates get drunk and throw you over board!"
			return 'water'
		elsif item == "Tuna Head"
			puts "Someone throws up, and the pirate captain takes your head off in one"
			puts "slice and replaces it with the tuna head. Your head rolls on the floor"
			puts "and the last thing you see when you look up at your pathetic body is the tuna"
			puts "head sitting between your shoulders."
			return 'death'
		else
			return 'win'
		end
	end
end

class Scene_water < Scene
	def initialize()
		super
		@actions = ['Swim to the shore',
					'Drown',
					''
				]
	end

	def enter()
		puts "water"
	end

	def choice()
		num = $stdin.gets.chomp.to_i
		if num == 1
			return 'beach'
		end
	end
end

class Scene_beach < Scene
	def initialize()
		super
	end

	def enter()
		puts "beach"
	end

	def choice()
		num = $stdin.gets.chomp.to_i
		if num == 1
			return 'village'
		end
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
