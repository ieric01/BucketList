class SearchSuggestion < ActiveRecord::Base
	def self.terms_for(prefix)
		suggestions = where("term LIKE ?", "#{prefix}_%")
		suggestions.order("popularity desc").limit(10).pluck(:term)
	end

	def self.index_todos
		Todo.find_each do |todo|
			index_term(todo.name)
			index_term(todo.category)
			todo.name.split.each { |t| index_term(t)}
		end
	end

	def self.index_term(term)
		where(term: term.downcase).first_or_intialize.tap do |suggestion|
			suggestion.increment! :popularity
		end
	end

	
end
