class Inventory

	def initialize()
			@Items = [] # an array of arrays of items. [qty, item]
	end

	# Adds an item to the users inventory.
	# @param item [Array] An array containing the quantity and text description of the item
	def add(item)
		@Items.push(item)
	end

# displays available items in the inventory and asks which one to use.
# returns the item name of the item selected.
	def use_item()
		puts "INVENTORY:"
		puts "Which item do you desire? Select the item number:\n\n"
		i = 1
		puts "\tQTY\tItem"
		@Items.each do |item|
			qty = item[0]
			desc = item[1]
			puts "#{i}:\t#{qty} x\t#{desc}"
			i += 1
		end
		puts "Select N to not use anything and go back."
		print "> "
		choice_num = $stdin.gets.chomp

		if choice_num =~ /\d/ && choice_num.to_i <= @Items.count && choice_num.to_i > 0
			item = @Items[choice_num.to_i-1]
			if item[0] > 1
				item[0] -= 1
				item_desc = item[1]
				return item_desc
			else
				return @Items.delete_at(choice_num.to_i-1)[1]
			end
		elsif choice_num.upcase == "N"
			return nil
		else
			puts "Come on, enter a valid selection number!"
			return use_item()
		end
	end

# check to see if the item is in inventory
# @param item_search [String] the item to be searched for
# @return [Boolean] if the item exists in inventory
	def contains(item_search)
		@Items.each do |item|
			if item[1] == item_search
				return true
			end
		end
		return false
	end
end
