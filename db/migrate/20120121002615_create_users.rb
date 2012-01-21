class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :fb_id, :limit => 8, :null => false
      t.integer :univ_id
      t.string :courses
      t.timestamps
    end
  end
end
