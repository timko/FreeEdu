class AddSubjectToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :subject, :string
  end
end
