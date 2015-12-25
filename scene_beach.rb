require "./scenes.rb"

class Scene_beach < Scene
	def initialize()
		super
		@actions = []
		@gold_bars_available = 12
		@dwarfs = false
	end

	def enter()
		puts "You struggle to the beach and one last wave throws you down onto the sand."
		puts "Covered in seaweed, you crawl onto the shore and lay face down in the sand."
		puts "To your left is a group of seven dwarfs. They look suspicious."
		puts "Up by the sand dunes is a tipped over wheel barrow."
		puts "Underneath your ribs in the sand you feel a hard object pressing into"
		puts "your chest. You stand up and brush the sand off your wet body."
		puts "Please choose what you would like to do next."
		add_action('Dig up the hard object')
		add_action('Talk to the dwarfs')
		add_action('Get the wheel barrow')
	end

	def choice()
		num = $stdin.gets.chomp.to_i
		puts "\n"
		if num < 1 || num > @actions.length
			puts "invalid choice!"
			actions()
			return choice()
		elsif @dwarfs && @actions[num-1] != "Look in your inventory"
			puts "As you try to walk away, the 7 dwarfs pick you up while chanting \"high ho\""
			puts "and slowly carry you into the water. They hold you down until you take a"
			puts "breath."
			return 'death'
		end

		action_chosen = @actions[num-1]
		if action_chosen == "Dig up the hard object"
			puts "You bend over to scoop the sand away from the object."
			puts "It's #{@gold_bars_available} bars of Gold!"
			remove_action(action_chosen)
			add_action("Take some gold!")
			actions()
			return choice()
		elsif action_chosen == "Take some gold!"
			return take_gold()
		elsif action_chosen == "Talk to the dwarfs"
			@dwarfs = true
			remove_action(action_chosen)
			puts "You walk over to the group of 7 dwarfs who instantly surround you."
			puts "They start chanting in an unknown language. They look angry."
			actions()
			return choice()
		elsif action_chosen == "Get the wheel barrow"
			remove_action(action_chosen)
			@profile.add_item(1, "Wheel barrow")
			actions()
			return choice()
		elsif action_chosen == "Use inventory"
			return use_inventory()
		else
			puts "Invalid option."
		end
	end


	def take_gold()
		puts "Well just how many bars gold would you like to take?"
		puts "[There are #{@gold_bars_available} bars in the sand]"
		print "> "
		gold_wanted = $stdin.gets.chomp.to_i

		if gold_wanted > @gold_bars_available
			puts "There isn't even that much gold on the groud. Can't you count?"
			actions()
			return choice()
		elsif gold_wanted < 3
			puts "You stuff #{gold_wanted} bars of gold into your pockets."
			@profile.add_item(gold_wanted, "Bar(s) of Gold")
			remove_action("Take some gold!")
			actions()
			return choice()
		elsif @profile.has_item("Wheel barrow")
			puts "You load up your wheel barrow with #{gold_wanted} bars of gold."
			actions()
			return choice()
		else
			puts "You dont have enough pockets to store all this gold."
			puts "You will need something to carry it."
			actions()
			return choice()
		end
	end


	def use_inventory()
		item = @profile.use_item()
		puts "\n"
		if item == "Bottle of Rum"
			if @dwarfs
				puts "You offer the dwarfs your bottle of Rum. One of them mumbles and takes"
				puts "the bottle. The dwarfs get drunk and throw rocks at you until you bleed"
				puts "to death."
				return 'death'
			else
				puts "You take a sip of your rum and the world becomes a little blurry."
				puts "You drink the rest of the bottle and die of alcohol poisoning."
				return 'death'
			end
		elsif item == "Bar(s) of Gold"
			if @dwarfs
				puts "The dwarfs take your gold, tie it around your neck and throw you into"
				puts "the water. You drown."
				return 'death'
			else
				puts "You drop your bar of gold onto the floor. Nothing happens."
				puts "What a waste of good gold."
				actions()
				return choice()
			end
		elsif item == nil
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
