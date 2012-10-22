class Video < ActiveRecord::Base
  attr_accessible :course_num, :size, :time, :name
  validates :course_num, :presence => true

  belongs_to :course
  attr_protected :course_id
end
