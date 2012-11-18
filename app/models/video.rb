class Video < ActiveRecord::Base
  attr_accessible :name, :source
  validates :source, :presence => true

  belongs_to :course
  attr_protected :course_id
end
