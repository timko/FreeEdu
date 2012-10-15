class RemoveProfessorFromCourses < ActiveRecord::Migration
  def up
    remove_column :courses, :professor
  end

  def down
    add_column :courses, :professor, :string
  end
end
