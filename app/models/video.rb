class Video < ActiveRecord::Base
  
  attr_accessible :name, :source
  validates :source, :presence => true
  validates_uniqueness_of :name, :scope => :course_id
  #validates :name, :uniqueness => {:scope => :course_id}

  belongs_to :course
  attr_protected :course_id
  
  def to_param
    "#{name}".gsub(' ', '_')
  end

end
