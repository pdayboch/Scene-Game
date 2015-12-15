require "./scenes.rb"

class Scene_boat < Scene
	def initialize()
		super
		@actions = ['Jump into the water and swim away',
					'Reach for your sword',
					'Look in your inventory'
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
		puts "\n"
		if num == 1 # jump into the water.
			puts "you slowly backup to the edge of the deck. Before the captain says"
			puts "the next word, your falling into the icy water in the middle of the Pacific."
			return 'water'
		elsif num == 2 # reach for your sword.
				puts "You quickly reach down to your sword handle but before you can close your grip"
				puts "the pirate sailors slice off your arms at the elbows. You stumble around screaming"
				puts "until 3 of the pirate pick you up and throw you into the water."
				puts "A shark quickly grabs the scent of blood and aggressivly swims over."
				puts "He takes one bite of your foot, and then your leg, and then your head."
			return 'death'
		elsif num == 3 # use inventory
			return use_inventory()
		else
			puts "You entered an invalid option."
			actions()
			return choice()
		end
	end


	def use_inventory()
		item = @Profile.use_item()
		puts "\n"
		if item == "Bottle of Rum"
			puts "You happily mention there's a bottle of Captain under your bed."
			puts "The pirates get drunk and throw you over board, leaving you unharmed!"
			return 'water'
		elsif item == "Tuna Head"
			puts "Someone throws up, and the pirate captain takes your head off in one"
			puts "slice and replaces it with the tuna head. Your head rolls on the floor"
			puts "and the last thing you see when you look up at your pathetic body is the tuna"
			puts "head sitting between your shoulders."
			return 'death'
		elsif item == nil
			action()
			return choice()
		else
			puts "That item cannot be used here. Why would you think that it can?"
			puts "You're pathetic."
			actions()
			return choice()
		end
	end
end
