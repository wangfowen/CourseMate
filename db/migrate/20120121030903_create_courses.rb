class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course
      t.time :time
      t.string :prof
      t.string :building
      t.timestamps
    end
  end
end
