class Course < ActiveRecord::Base
  attr_accessible :course_num, :university, :title
  validates :course_num, :presence => true, :uniqueness => true
  validates :title, :presence => true, :uniqueness => true
  validates :university, :presence => true
end
