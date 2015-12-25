class Person

# Create the profile and set the users name
# @param name [String] The user's name
	def initialize(name)
		@name = name
		@pocket = Inventory.new()
	end

# a method to grab the users name
#	@return [String] The user's name
	def get_name()
		return @name
	end

# asks the inventory to display and select an item
# @return [String] A text description of the item selected to use
	def use_item()
		return @pocket.use_item()
	end

# Adds an items to the profiles inventory
# @param qty [int] How many of the items will be added
# @param desc [String] A text description of the item to be added
	def add_item(qty, desc)
		item = [qty, desc]
		@pocket.add(item)
	end

	def has_item(item)
		return @pocket.contains(item)
	end
end
