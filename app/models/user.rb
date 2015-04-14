class User < ActiveRecord::Base
  has_one :bucketlist
  has_many :bucketlist_todos, :through => :bucketlist
end
