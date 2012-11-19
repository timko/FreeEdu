class CacheStatistic < ActiveRecord::Base
  attr_accessible :log_time, :num_of_users, :bandwidth_demand, :num_of_caches
  attr_accessible :storage_donated, :bandwidth_donated, :bandwidth_effectively_used, :server_load
  validates :log_time, :uniqueness => true

#note that log_time is not included in here
  def self.all_stats
    ['num_of_users', 'bandwidth_demand', 'num_of_caches', 'storage_donated', 'bandwidth_donated',
            'bandwidth_effectively_used', 'server_load']
  end

  def self.stat_colors
    {'num_of_users' => '0000FF', 'bandwidth_demand' => '00FF00', 'num_of_caches' => '00FFFF', 'storage_donated' => 'FF0000',     
            'bandwidth_donated' => 'FF00FF', 'bandwidth_effectively_used' => 'FFFF00', 'server_load' => '000000'}
  end

  def self.stat_names
    {'num_of_users' => 'Number of Users', 'bandwidth_demand' => 'Bandwidth Demand', 'num_of_caches' => 'Number of Caches', 'storage_donated' => 'Storage Donated', 'bandwidth_donated' => 'Bandwidth Donated', 'bandwidth_effectively_used' => 'Bandwidth Effectively Used', 'server_load' => 'Server Load'}
  end

=begin
  def self.extract_sorted_stat(stat_field)
    stats = CacheStatistic.order(:log_time).select(stat_field)
    to_return = []
    stats.each do |stat|
      to_return << stat.send(stat_field)
    end
    return to_return
  end
=end  

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

=begin
  def self.extract_all_stats
    return self.extract_sorted_stats(self.all_stats)
  end

  def self.get_whole_graph
    raw_stats = self.extract_all_stats
    data_list = []
    legend_list = []
    colors_list = []
    self.all_stats.each do |stat|
      to_add = []
      raw_stats.each do |collection|
        to_add << collection[stat]
      end
      data_list << to_add
      legend_list << self.stat_names[stat]
      colors_list << self.stat_colors[stat]
    end
    return Gchart.line(:data =>data_list,
                       :size => '800x300',
                       :legend => legend_list,
                       :line_colors => colors_list.join(','),
                       :axis_with_labels => 'y',
                       :max_value => 3000,
                       :min_value => 0)
  end
=end

  def self.get_selected_graph(stats_list)
    raw_stats = self.extract_sorted_stats(stats_list)
    data_list = []
    legend_list = []
    colors_list = []
    stats_list.each do |stat|
      to_add = []
      raw_stats.each do |collection|
        to_add << collection[stat]
      end
      data_list << to_add
      legend_list << self.stat_names[stat]
      colors_list << self.stat_colors[stat]
    end
    return Gchart.line(:data =>data_list,
                       :size => '800x300',
                       :legend => legend_list,
                       :line_colors => colors_list.join(','),
                       :axis_with_labels => 'y',
                       :max_value => 3000,
                       :min_value => 0)
  end
  
  def self.extract_sorted_avg_load()
    to_return = []
    stats = CacheStatistic.extract_sorted_stats(['num_of_users','server_load'])
    server_load = CacheStatistic.extract_sorted_stat(:server_load)
    stats.each do |stat|
      to_return << stat['server_load']/stat['num_of_users']
    end
    return to_return
  end

  def self.create_from_file(stat_file = 'app/assets/server_traffic.log', sample_rate = 1)
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
