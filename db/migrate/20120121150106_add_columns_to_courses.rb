class AddColumnsToCourses < ActiveRecord::Migration
  def change
  	remove_column :courses, :prof
  	remove_column :courses, :time
  	add_column :courses, :time, :string
  end
end
