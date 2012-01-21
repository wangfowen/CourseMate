class Courses < ActiveRecord::Base
	belongs_to :university
	belongs_to :users

	def parse_course_infos courses_hash
		#compare course info in hash with courses (in university)
	    #if exist, grab course id
	    #if not, create course, grab course id
	    #return list of course ids
	end
end
