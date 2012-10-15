class Video < ActiveRecord::Base
  attr_accessible :course_id, :size, :time, :video_num
  validates :course_id, :presence => true, :uniqueness => true
  validates :video_num, :presence => true, :uniqueness => true

  belongs_to :course
end
