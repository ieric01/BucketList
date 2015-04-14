class Bucketlist < ActiveRecord::Base
  has_many :bucketlist_todos
  belongs_to :user
end
