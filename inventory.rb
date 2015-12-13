class Inventory
	@Items # an array of arrays of items. [qty, item]
	
	def initialize(start)
		@Items = start
	end
	
	# displays available items in the inventory and asks which one to use.
	# returns the item name of the item selected.
	def use_item()
		puts "Which item do you desire? Select the item number:"
		i = 1
		@Items.each do |item|
			desc = item[1]
			puts "#{i}: #{desc}"
			i += 1
		end
		print "> "
		item_num = $stdin.gets.chomp.to_i
		
		item_selected = @Items[item_num - 1][1]
		
		return item_selected
	end
end