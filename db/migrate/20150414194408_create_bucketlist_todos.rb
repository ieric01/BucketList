class CreateBucketlistTodos < ActiveRecord::Migration
  def change
    create_table :bucketlist_todos do |t|
      t.integer :bucketlist_id
      t.integer :todo_id
      t.timestamps null: false
    end
  end
end
