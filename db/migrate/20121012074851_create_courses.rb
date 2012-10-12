class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_num
      t.string :title
      t.string :professor

      t.timestamps
    end
  end
end
