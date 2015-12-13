class Person
	@Name
	@Inventory
	@Decision_map = []
# Create the profile and set the users name
# @param name [String] The user's name
	def initialize(name)
		@Name = name
	end
# a method to grab the users name
#	@return [String] The user's name
	def get_name()
		return @Name
	end

	def set_inventory(pocket)
		@Inventory = pocket
	end

# asks the inventory to display and select an item
# @return [String] A text description of the item selected to use
	def use_item()
		return @Inventory.use_item()
	end

# Adds an items to the profiles inventory
# @param qty [int] How many of the items will be added
# @param desc [String] A text description of the item to be added
	def add_item(qty, desc)
		item = [qty, desc]
		@Inventory.add(item)
	end

# Logs the decisions a user makes throughout the game
# @param decision [Array] An array of integers listing the decisions made throughout a Scene
	def add_decision(decision)
		@Decision_map.push(decision)
	end

	def get_decisions()
		return @Decision_map
	end
end
