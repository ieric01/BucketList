class CreateTravelDealsTable < ActiveRecord::Migration
  def change
    create_table :travel_deals do |t|
      t.string :url
      t.integer :deal_id
      t.string :title
      t.string :img
      t.float :price
      t.date :exp_date
    end
  end
end
