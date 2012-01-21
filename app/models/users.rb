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

	def array_course_list
		self.course_list.split(' ').select { |s| s =~ /^[0-9]*$/ }
	end

	def match_friends_course_lists friends_list
		course_match_list = []

		for id in friends_list
			if (friend = Users.find_by_fb_id(id)).nil?
				break
			else
				match = friend.array_course_list & self.array_course_list
				course_match_list << { friend.id => 
					match.map { |m| Courses.where('univ_id = ?', self.univ_id).find(m).course } 
				}
			end
		end

		return course_match_list
	end
end
