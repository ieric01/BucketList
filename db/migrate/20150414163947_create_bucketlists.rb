class CreateBucketlists < ActiveRecord::Migration
  def change
    create_table :bucketlists do |t|
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
