class CreateCategoryOfTodos < ActiveRecord::Migration
  def change
    create_table :category_of_todos do |t|
      t.integer :todo_id
      t.integer :category_id
      t.timestamps null: false
    end
  end
end
