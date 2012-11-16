class CacheStatistic < ActiveRecord::Base
  attr_accessible :log_time, :num_of_users, :bandwidth_demand, :num_of_caches
  attr_accessible :storage_donated, :bandwidth_donated, :bandwidth_effectively_used, :server_load
  validates :log_time, :uniqueness => true
  def self.extract_sorted_stat(stat_field)
    stats = CacheStatistic.order(:log_time).select(stat_field)
    to_return = []
    stats.each do |stat|
      to_return << stat.send(stat_field)
    end
    return to_return
  end
  
  def self.extract_sorted_stats(stat_field_list)
    to_return = []
    stats = CacheStatistic.order(:log_time).select(stat_field_list.join(", "))
    stats.each do |stat|
      stat_hash = {}
      stat_field_list.each do |field|
        stat_hash[field] = stat.send(field)
      end
      to_return << stat_hash
    end
    return to_return
  end

  def self.all_stats
    return ['num_of_users', 'bandwidth_demand', 'num_of_caches', 'storage_donated', 'bandwidth_donated',
            'bandwidth_effectively_used', 'server_load']
  end

  def self.extract_all_stats
    return self.extract_sorted_stats(self.all_stats)
  end

  def self.get_whole_graph
    raw_stats = self.extract_all_stats
    data_list = []
    self.all_stats.each do |stat|
      to_add = []
      raw_stats.each do |collection|
        to_add << collection[stat]
      end
      data_list << to_add
    end
    return Gchart.line(:data =>data_list,
                       :size => '800x300',
                       :legend => ['# of Users', 'Bandwidth Demand', '# of Caches', 'Storage Donated', 'Bandwidth Donated',
                                   'Bandwidth Effectively Used', 'Server Load'],
                       :line_colors => "0000FF,00FF00,00FFFF,FF0000,FF00FF,FFFF00,000000",
                       :axis_with_labels => 'y',
                       :max_value => 2000,
                       :min_value => 0)
  end
  
  def self.extract_sorted_avg_load()
    to_return = []
    num_users = CacheStatistic.extract_sorted_stat(:num_of_users)
    server_load = CacheStatistic.extract_sorted_stat(:server_load)
    (0...server_load.length).each do |num|
      to_return << server_load[num]/num_users[num]
    end
    return to_return
  end

  def self.create_from_file(stat_file = 'script/server_traffic.log', sample_rate = 1)
    log_lines = IO.readlines(File.open(stat_file))
    (0...log_lines.length).step(sample_rate) do |log_num|
      CacheStatistic.create(CacheStatistic.parse(log_lines[log_num]))
    end
  end
  
  def self.parse(log_string)
    create_hash = {}
    hash_values = log_string.split(" ")
    create_hash[:log_time] = hash_values[0] + " " + hash_values[1]
    create_hash[:num_of_users] = hash_values[2].to_i
    create_hash[:bandwidth_demand] = hash_values[3].to_f
    create_hash[:num_of_caches] = hash_values[4].to_i
    create_hash[:storage_donated] = hash_values[5].to_f
    create_hash[:bandwidth_donated] = hash_values[6].to_f
    create_hash[:bandwidth_effectively_used] = hash_values[7].to_f
    create_hash[:server_load] = hash_values[8].to_f
    return create_hash
  end
end
