class CategoryOfTodo < ActiveRecord::Base
  belongs_to :category
  belongs_to :todo
end
