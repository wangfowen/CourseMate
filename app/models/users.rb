class Users < ActiveRecord::Base
	def self.load_user(data)
		Users.find_or_create_by_fb_id(data["user_id"])
	end
end
