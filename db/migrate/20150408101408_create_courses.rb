class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :Name
      t.string :Teacher
      t.string :Time
      t.string :Place
      t.string :Credit

      t.timestamps null: false
    end
  end
end
