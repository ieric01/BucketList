class Todo < ActiveRecord::Base
  has_many :user_todos
  has_many :users, :through => :user_todos
  has_many :comments
  has_many :event_users
  has_many :events
  has_many :travels_todos
  has_many :travel_deals, through: :travels_todos

    #Paperclip gem to upload image
  has_attached_file :new_image, :styles => { :medium => "50x50>"}, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :new_image, :content_type => /\Aimage\/.*\Z/
  validates_attachment :new_image,
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}


  def check_fo_image
    if self.image
      return self.image
    elsif self.new_image_file_name
      return self.new_image_file_name
    else
      return "http://www.etceter.com/assets/43b442c6/no_avatar_available.jpg"
    end
  end
  
end
