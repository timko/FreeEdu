class Course < ActiveRecord::Base
  attr_accessible :subject, :title, :description
  validates :title, :presence => true, :uniqueness => true
  has_many :videos
end