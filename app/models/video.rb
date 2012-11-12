class Video < ActiveRecord::Base
  attr_accessible :course_num, :size, :time, :name, :source
  validates :course_num, :presence => true
  validates :source, :presence => true

  belongs_to :course
  attr_protected :course_id
end
