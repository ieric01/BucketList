class Todo < ActiveRecord::Base
  has_many :user_todos
  has_many :users, :through => :user_todos
  has_many :comments
  has_many :event_users
  has_many :events

end
