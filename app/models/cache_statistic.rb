class CacheStatistic < ActiveRecord::Base
  attr_accessible :log_time, :num_of_users, :bandwidth_demand, :num_of_caches, 
                    :storage_donated, :bandwidth_donated, :bandwidth_effectively_used, :server_load
  validates :log_time, :uniqueness => true
  def self.extract_sorted_stat(stat_field)
    CacheStatistic.order(:log_time).select(stat_field)
  end
  
  def self.extract_sorted_stats(stat_field_list)
    CacheStatistic.order(:log_time).select(stat_field_list.join(", "))
  end

  def self.create_from_file(stat_file, sample_rate = 10)
    log_lines = IO.readlines(stat_file)
    log_lines.step(sample_rate) do |log|
      CacheStatistic.create(CacheStatistic.parse(log))
    end
  end
  
  def self.parse(log_string)
    create_hash = {}
    hash_values = log_string.split(" ")
    create_hash[:log_time] = hash_values[0]
    create_hash[:num_of_users] = hash_values[1]
    create_hash[:bandwidth_demand] = hash_values[2]
    create_hash[:num_of_caches] = hash_values[3]
    create_hash[:storage_donated] = hash_values[4]
    create_hash[:bandwidth_donated] = hash_values[5]
    create_hash[:bandwidth_effectively_used] = hash_values[6]
    create_hash[:server_load] = hash_values[7]
  end
end
