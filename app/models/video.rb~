class Video < ActiveRecord::Base
  attr_accessible :course_id, :size, :time
  validates :course_id, :presence => true, :uniqueness => true

  belongs_to :course
end
