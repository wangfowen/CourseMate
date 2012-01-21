class AddUnivIdToCourses < ActiveRecord::Migration
  def change
  	add_column :courses, :univ_id, :integer
  end
end
