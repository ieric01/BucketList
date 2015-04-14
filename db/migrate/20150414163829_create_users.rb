class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :bio
      t.string :user_img_url
      t.string :uid
      t.string :email

      t.timestamps null: false
    end
  end
end
