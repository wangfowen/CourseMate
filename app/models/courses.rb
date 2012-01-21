class Courses < ActiveRecord::Base
	belongs_to :university
	belongs_to :users

	def self.parse_course_infos courses_array, univ_id
		courses = Courses.where("univ_id = ?", univ_id)
		courses_ids = []

		for course in courses_array do
			name = course["CourseName"]
			time = course["CourseTime"]
			location = course["CourseLocation"]
			if (a = Courses.find_by_course(name)).nil?
				tmp = Courses.new
				tmp.course = name
				tmp.time = time
				tmp.building = location
				tmp.univ_id = univ_id
				tmp.save!

				courses_ids += [tmp.id]
			else
				courses_ids += [a.id]
			end
		end

		return courses_ids
	end
end
