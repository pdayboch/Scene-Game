class Person

# Create the profile and set the users name
# @param name [String] The user's name
	def initialize(name)
		@Name = name
		@Decision_map = []
		@Pocket = Inventory.new()
	end

# a method to grab the users name
#	@return [String] The user's name
	def get_name()
		return @Name
	end

# asks the inventory to display and select an item
# @return [String] A text description of the item selected to use
	def use_item()
		return @Pocket0.use_item()
	end

# Adds an items to the profiles inventory
# @param qty [int] How many of the items will be added
# @param desc [String] A text description of the item to be added
	def add_item(qty, desc)
		item = [qty, desc]
		@Pocket.add(item)
	end

# Logs the decisions a user makes throughout the game
# @param decision [Array] An array of integers listing the decisions made throughout a Scene
	def add_decisions(decisions)
		@Decision_map.push(decisions)
	end

	def get_decisions_map()
		#@Decision_map.each do |decisions|
		# 	print "["
		# 	decisions.each do |decision|
		# 		if decision == decisions.last
		# 			print "#{decision}"
		# 		else
		# 			print "#{decision}, "
		# 		end
		# 	end
		# 	print "]\n"
		# end

		return @Decision_map
	end

end
