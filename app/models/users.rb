class Users < ActiveRecord::Base
	has_many :courses
	belongs_to :university

	def self.load_user data
		Users.find_or_create_by_fb_id(data["user_id"])
	end
	
	def update_courses courses

	end
end
