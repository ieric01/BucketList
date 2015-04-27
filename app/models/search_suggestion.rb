class SearchSuggestion < ActiveRecord::Base

	def self.suggestions_scroll(prefix)
		suggestions = Todo.where("lower(name) LIKE ?", "%#{prefix}%").limit(10).pluck(:name)
	end

	def self.results_objects(prefix)
			suggestions = Todo.where("lower(name) LIKE ?", "%#{prefix}%").limit(20)
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
