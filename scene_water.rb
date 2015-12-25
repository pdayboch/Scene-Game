require "./scenes.rb"

class Scene_water < Scene
	def initialize()
		super
		@actions = []
		@shark = true
	end

	def enter()
		puts "Your head pops up to the surface and you gasp for air."
		puts "The water is so cold it chills your bones and you feel stiff."
		puts "You see a small fin off in the distance but it's getting bigger."
		puts "Your next move must be made with survival on your mind."
		add_action('Swim to the shore')
		add_action("Don't move a muscle and sit still, maybe the shark won't see you")
		add_action('Drown yourself')
	end

	def choice()
		num = $stdin.gets.chomp.to_i
		puts "\n"
		if num == 1 # swim to shore
			if(@shark)
				puts "You start to kick your legs and move your arms in an attempt to"
				puts "outswim the shark. Your pathetic attempt fails and the shark catches"
				puts "you by the throat. Before you know it you're looking into a mouth"
				puts "full of razor blades. You hear a pop just before it all goes dark."
				return 'death'
			else
				puts "You start to kick your legs and move your arms in an attempt to reach"
				puts "the distant beach. Your arms and legs start to warm up by the time you"
				puts "are halfway there."
				puts "You turn around and see the shark starting to swim toward you."
				puts "In order to remain calm to keep swiming, you decide to do math problems"
				puts "in your head."
				puts "\nAnswer the following questions correctly to remain calm:"
				i = 0
				while i < 2
					i += 1
					num1 = rand(3..11)
					num2 = rand(3..11)
					puts "#{num1} x #{num2}?"
					answer = $stdin.gets.chomp.to_i
					if answer != num1*num2
						puts "That was wrong. You think about the time you failed 5th grade"
						puts "and forget to swim. The shark grabs you by the throat and chomps."
						return 'death'
					end
				end
				return 'beach'
			end
		elsif num == 2 # dont move, sit still.
			puts "You lay on your back and don't move a muscle. The shark approaches"
			puts "but swims circles around you."
			puts "A one eyed pirate winds up his cross bow from the upper deck of the ship."
			puts "He puts an arrow through your leg. The water runs red around your"
			puts "body and draws the shark in closer from its scent."
			puts "The shark finds the source of the blood and gobbles you whole like a"
			puts "long awaited meal."
			return 'death'
		elsif num == 3 # drown yourself
			puts "You head down to the bottom using the breast stroke while blowing all the air"
			puts "out of your lungs. By the time your 50 feet deep, you change your mind and"
			puts "decide to live. But it's already too late. On your way up you gasp for air"
			puts "and feel a sharp pain in your lungs. You black out. By the way, the shark"
			puts "eats you."
			return 'death'
		elsif num == 4 # use inventory
			use_inventory()
		else
			puts "You entered an invalid option."
			actions()
			return choice()
		end
	end


	def use_inventory()
		item = @profile.use_item()
		puts "\n"
		if item == "Bottle of Rum"
			puts "You unscrew the bottle and a wave knocks the bottle out of your hands."
			puts "Sea water fills the bottle and it sinks down to the ocean floor."
			puts "Well that was a waste. You feel terrible."
			actions()
			return choice()
		elsif item == "Tuna Head"
			@shark = false
			puts "You reach into your pocket and feel the gooey eyeballs of the tuna head."
			puts "You say to yourself, \"Thats what I'm going to use!\""
			puts "Squeezing your hand around the head, you pull it out of your bag and"
			puts "throw it as far as you can in the opposite direction of the beach."
			puts "The shark, who is still approaching you, jolts to the left in pursuit"
			puts "of the fish head. It bought you some time!"
			actions()
			return choice()
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
