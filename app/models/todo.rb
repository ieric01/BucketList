class Todo < ActiveRecord::Base
  has_many :bucketlist_todos
  has_many :category_of_todos
end
