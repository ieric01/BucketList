class Todo < ActiveRecord::Base
  has_many :user_todos
  has_many :users, :through => :user_todos
  has_many :comments
  has_many :event_users
  has_many :events
  has_many :travels_todos
  has_many :travel_deals, through: :travels_todos

    #Paperclip gem to upload image
  has_attached_file :new_image, :styles => { :medium => "300x300>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :new_image, :content_type => /\Aimage\/.*\Z/

end
