class Video < ActiveRecord::Base
  attr_accessible :name, :source
  validates :source, :presence => true
  validates :name, :uniqueness => true

  belongs_to :course
  attr_protected :course_id
  
  def to_param
    "#{name}".gsub(' ', '_')
  end

end
