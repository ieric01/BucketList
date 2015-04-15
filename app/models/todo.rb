class Todo < ActiveRecord::Base
  has_many :user_todos
  has_many :users, :through => :user_todos
end
