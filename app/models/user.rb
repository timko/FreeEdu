class User < ActiveRecord::Base
  attr_accessible :name, :password_digest, :password_confirmation, :disk_space, :bandwidth, :password
  validates :name, :presence => true, :uniqueness => true
  has_secure_password

  #To ensure validity, disk_space and bandwidth are set to 0 if unset
  before_save :validate_disk_space, :validate_bandwidth

  def validate_disk_space
    self.disk_space = self.disk_space ? self.disk_space : 0
  end
  
  def validate_bandwidth
    self.bandwidth = self.bandwidth ? self.bandwidth : 0
  end
end
