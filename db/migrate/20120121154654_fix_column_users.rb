class FixColumnUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :courses
  	add_column :users, :course_list, :string
  end
end
