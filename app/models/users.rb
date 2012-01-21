class Users < ActiveRecord::Base
	has_many :courses
	belongs_to :university

	def self.load_user fb_id
		Users.find_or_create_by_fb_id(fb_id)
	end
	
	def update_course_list! course_list
		self.course_list = course_list
		self.save!
	end

	def update_univ! univ_id
		self.univ_id = univ_id
		self.save!
	end
end
