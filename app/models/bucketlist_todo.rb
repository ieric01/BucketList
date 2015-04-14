class BucketlistTodo < ActiveRecord::Base
  belongs_to :todo
  belongs_to :bucketlist
end
