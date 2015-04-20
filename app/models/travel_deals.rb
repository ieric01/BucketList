class TravelDeals < ActiveRecord::Base
	has_many :travel_todos
	has_many :todos, through: :travel_todos

end