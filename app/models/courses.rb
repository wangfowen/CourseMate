class Courses < ActiveRecord::Base
	belongs_to :university
	belongs_to :users

	def self.parse_course_infos courses_array, univ_id
		#courses = Courses.joins(:university)

		#for course in courses_array do
			
		#end
		#compare course info in hash with courses (in university)
	    #if exist, grab course id
	    #if not, create course, grab course id
	    #return list of course ids
	end
end
