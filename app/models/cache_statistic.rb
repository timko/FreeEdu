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
end
