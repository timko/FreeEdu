class RemoveCourseNumFromVideos < ActiveRecord::Migration
  def up
    remove_column :videos, :course_num
  end

  def down
    add_column :videos, :course_num, :string
  end
end
