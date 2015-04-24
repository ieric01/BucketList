class CouponGiver

	def self.distribute_deals(table, todo_title)
		final_array = []
		todo_title_array = todo_title.downcase.split
		take_out_word = ["the", "a", "an", "to", "do", "and", "with", "in", "go", "by", "of", "own", "goto", "learn", "ride"]
		take_out_word.each do |word|
			if todo_title_array.include?(word)
				todo_title_array.delete(word)
			end
		end

		#look for deal based on the parsed name
		todo_title_array.each do |word| 
			final_array << table.where("lower(title) LIKE ?", "%#{word}%")
		end
		#present the array results based on match score
    final_array.flatten.uniq{|deal| deal.title}
	end

	def shorten
		
	end


end
