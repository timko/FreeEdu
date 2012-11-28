class Course < ActiveRecord::Base
  attr_accessible :subject, :title, :description
  #validates :course_num, :presence => true, :uniqueness => true
  validates :title, :presence => true, :uniqueness => true

  has_many :videos


end
