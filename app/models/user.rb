class User < ActiveRecord::Base
  has_one :bucketlist
  has_many :bucketlist_todos, :through => :bucketlist





	def self.from_omniauth(auth)
		user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])|| create_from_omniauth(auth)
		user
	end

	def self.create_from_omniauth(auth)
		create! do |user|
		user.provider = auth["provider"]
		user.uid = auth["uid"]
		user.name = auth["info"]["name"]
		user.first_name = auth["info"]["first_name"]
		user.email = auth["info"]["email"]
		user.user_img_url = auth["info"]["image"]
		end
	end



end
