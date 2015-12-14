require "./scenes.rb"

class Scene_water < Scene
	def initialize()
		super
		@actions = ['Swim to the shore',
					"Don't move a muscle and sit still, maybe the shark won't see you",
					'Drown yourself',
					'Look in your inventory'
				]
		@shark = true
	end

	def enter()
		puts "Your head pops up to the surface and you gasp for air."
		puts "The water is so cold it chills your bones and you feel stiff."
		puts "You see a small fin off in the distance but it's getting bigger."
		puts "Your next move must be made with survival on your mind."
	end

	def choice()
		num = $stdin.gets.chomp.to_i
		@Decisions.push(num)
		if num == 1
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
				puts "\n Answer the following questions correctly to remain calm:"
				i = 0
				while i < 2
					i += 1
					num1 = rand(2..10)
					num2 = rand(2..10)
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
		elsif num == 2
			puts "You lay on your back and don't move a muscle. The shark approaches"
			puts "but swims circles around you"
			return 'death'
		elsif num == 3
			return 'death'
		elsif num == 4
			use_inventory()
		else
			puts "You entered an invalid option."
			actions()
			return choice()
		end
	end

	def use_inventory()
		item = @Profile.use_item()
		@Decisions.push(item)
		if item == "Bottle of Rum"
			puts ""
			puts ""
			return 'death'
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
		else
			puts "That item cannot be used here. Why would you think that it can?"
			puts "You're pathetic."
			actions()
			return choice()
		end
	end

end
