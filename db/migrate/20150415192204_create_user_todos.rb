class CreateUserTodos < ActiveRecord::Migration
  def change
    create_table :user_todos do |t|
      t.integer :user_id
      t.integer :todo_id
      t.timestamps null: false
    end
  end
end
