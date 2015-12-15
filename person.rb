class Person

# Create the profile and set the users name
# @param name [String] The user's name
	def initialize(name)
		@Name = name
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
		return @Pocket.use_item()
	end

# Adds an items to the profiles inventory
# @param qty [int] How many of the items will be added
# @param desc [String] A text description of the item to be added
	def add_item(qty, desc)
		item = [qty, desc]
		@Pocket.add(item)
	end

	def has_item(item)
		return @Pocket.contains(item)
	end
end
