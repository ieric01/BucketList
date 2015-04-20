class CreateTravelsTodos < ActiveRecord::Migration
  def change
    create_table :travels_todos do |t|
      t.integer :travel_deals_id
      t.integer :todos_id
    end
  end
end
