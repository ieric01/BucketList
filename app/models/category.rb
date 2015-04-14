class Category < ActiveRecord::Base
  has_many :category_of_todos
  has_many :todos, :through => :category_of_todos
end
