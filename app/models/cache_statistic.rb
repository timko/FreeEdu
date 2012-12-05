class CacheStatistic < ActiveRecord::Base
  attr_accessible :log_time, :num_of_users, :bandwidth_demand, :num_of_caches
  attr_accessible :storage_donated, :bandwidth_donated, :bandwidth_effectively_used, :server_load
  validates :log_time, :uniqueness => true

#note that log_time is not included in here
  def self.all_stats
    ['num_of_users', 'bandwidth_demand', 'bandwidth_donated', 'bandwidth_effectively_used', 
     'num_of_caches','server_load', 'storage_donated']
  end

  def self.stat_colors
    {'num_of_users' => '0000FF','bandwidth_demand' => '00FF00', 'bandwidth_donated' => 'FF00FF', 'bandwidth_effectively_used' => 'FFFF00',
     'num_of_caches' => '00FFFF', 'server_load' => '000000', 'storage_donated' => 'FF0000'}
  end

  def self.stat_names
    {'num_of_users' => 'Users','bandwidth_donated' => 'Bandwidth Donated (Mbps)', 'bandwidth_demand' => 'Bandwidth Demand (Mbps)', 'bandwidth_effectively_used' => 'Bandwidth Used (Mbps)', 'num_of_caches' => 'Caches', 'server_load' => 'Server Load (Mbps)',  'storage_donated' => 'Storage Donated (GB)'}
  end 

  def self.stat_descriptions
    {
      'num_of_users' => 'This is the amount of users curretly watching videos',
      'bandwidth_donated' => 'The total amount of bandwidth (in Mbps) being donated by users',
      'bandwidth_demand' => 'The total amount of bandwidth (in Mbps) currently needed to support the website',
      'bandwidth_effectively_used' => 'The total amount of bandwidth (in Mbps) being effectively used', 
      'num_of_caches' => 'Total number of caches currently being used; caches are allocated from the storage that users donate',
      'server_load' => "The current amount of bandwidth (Mbps) being used by the website's server; the lower this number is, the better",  
      'storage_donated' => 'The total amount of storage (in GB) users have donated; this storage is used to store videos on the website'
    }
  end

  def self.color_alerts
    {'green' => 'Servers are running smoothly; this is the result of your contribution, thank you for your patronage!',
     'yellow' => 'Servers are slightly loaded; donating your computing resources would be greatly appreciated', 
     'orange' => 'Servers are currently loaded; please donate your computing resources so we can maintain a free service',
     'red' => "Servers are overloaded right now; please go the settings menu to increase your donated resources"}
  end

  def self.extract_sorted_stats(stat_field_list, n = CacheStatistic.count)
    to_return = []
    new_stat_field_list = stat_field_list
    new_stat_field_list << "log_time"
    stats = CacheStatistic.order("log_time DESC").select(new_stat_field_list.join(", ")).limit(n)
    stats.each do |stat|
      stat_hash = {}
      stat_field_list.each do |field|
        stat_hash[field] = stat.send(field)
      end
      stat_hash[:log_time] = stat.log_time
      to_return << stat_hash
    end
    return to_return
  end

  def self.get_selected_graph(stats_list, x_count, n = CacheStatistic.count)
    raw_stats = self.extract_sorted_stats(stats_list, n)
    data_list = []
    legend_list = []
    colors_list = []
    x_axis = []
    interval = raw_stats.length/x_count
    (0...(raw_stats.length)).step(interval) do |num|
      log_time = raw_stats[num][:log_time]
      x_axis << log_time.strftime("%H:%M:%S")
    end
    max_val = 2000
    stats_list.each do |stat|
      unless stat == "log_time"
        to_add = []
        raw_stats.each do |collection|
          num = collection[stat]
          if num > max_val
            max_val = num
          end
          to_add << num
        end
        data_list << to_add.reverse
        legend_list << self.stat_names[stat]
        colors_list << self.stat_colors[stat]
      end
    end
    return Gchart.line(:title => 'Cache Statistics Over Time',
                       :data =>data_list,
                       :size => '700x300',
                       :legend => legend_list,
                       :line_colors => colors_list.join(','),
                       :axis_with_labels => 'x,y',
                       :axis_labels => [x_axis.reverse],
                       :max_value => max_val,
                       :min_value => 0)
  end

=begin  
  def self.extract_sorted_avg_load()
    to_return = []
    stats = CacheStatistic.extract_sorted_stats(['num_of_users','server_load'])
    stats.each do |stat|
      to_return << stat['server_load']/stat['num_of_users']
    end
    return to_return
  end
=end

  def self.create_from_file(stat_file = 'app/assets/server_traffic.log', sample_rate = 1)
    log_lines = IO.readlines(File.open(stat_file))
    total_so_far = {}
    (0...log_lines.length).step(sample_rate) do |start|
#      hash = CacheStatistic.parse(log_lines[log_num])
      finish = start + sample_rate
      unless finish >= log_lines.length
        total_hash = CacheStatistic.parse(log_lines[start])
        ((start+1)...finish).each do |log_num|
          to_add = CacheStatistic.parse(log_lines[log_num])
          total_hash = CacheStatistic.hash_add(total_hash, to_add, [:log_time, :server_load])
        end
        total_hash = CacheStatistic.hash_divide(total_hash, sample_rate, [:log_time, :server_load])
        suggested_server_load = (total_hash[:bandwidth_demand] - total_hash[:bandwidth_effectively_used])
        total_hash[:server_load] = [suggested_server_load, 0].max
        total_hash = CacheStatistic.create(total_hash)
      end
    end
  end
 
  def self.hash_add(h1, h2, ignore)
    create_hash = {}
    h1.keys.each do |key|
      unless ignore.include?(key)
        create_hash[key] = h1[key] + h2[key] 
      end
    end
    ignore.each do |key|
      create_hash[key] = h2[key] 
    end
    return create_hash
  end

  def self.hash_divide(h1, divisor, ignore)
    h1.keys.each do |key|
      unless ignore.include?(key)
        h1[key] = h1[key]/divisor
      end    
    end
    return h1
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

  def self.get_n_latest_records(n = CacheStatistic.count)
    return CacheStatistic.order("log_time DESC").limit(n)
  end

end
