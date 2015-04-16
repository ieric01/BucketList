class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.text :description
      t.string :link
      t.string :image
    	t.string :status

      t.timestamps null: false
    end
  end
end
