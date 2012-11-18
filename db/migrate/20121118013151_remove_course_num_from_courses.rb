class RemoveCourseNumFromCourses < ActiveRecord::Migration
  def up
    remove_column :courses, :course_num
  end

  def down
    add_column :courses, :course_num, :string
  end
end
