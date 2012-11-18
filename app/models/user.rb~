class User < ActiveRecord::Base
  attr_accessible :name, :password, :disk_space, :bandwidth
  validates :name, :presence => true, :uniqueness => true
  validates :password, :presence => true
  before_save :validate_disk_space, :validate_bandwidth



  def validate_disk_space
    self.disk_space = self.disk_space ? self.disk_space : 0
  end
  
  def validate_bandwidth
    self.bandwidth = self.bandwidth ? self.bandwidth : 0
  end





end
