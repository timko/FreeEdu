class Course < ActiveRecord::Base
  attr_accessible :course_num, :professor, :title
  validates :course_num, :presence => true, :uniqueness => true
  validates :title, :presence => true, :uniqueness => true
  validates :professor, :presence =true

end
