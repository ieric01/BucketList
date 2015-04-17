class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.date :date
      t.time :time
      t.text :notes

      t.timestamps null: false
    end
  end
end
