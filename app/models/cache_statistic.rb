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
    {'num_of_users' => 'Users','bandwidth_donated' => 'Bandwidth Donated(Mbps)', 'bandwidth_demand' => 'Bandwidth Demand(Mbps)', 'bandwidth_effectively_used' => 'Bandwidth Used(Mbps)', 'num_of_caches' => 'Caches', 'server_load' => 'Server Load(Mbps)',  'storage_donated' => 'Storage Donated(GB)'}
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
    {'green' => 'We got plenty of donors; thank you for your patronage!',
     'yellow' => 'Our servers are having a little trouble; your computing resources would be greatly appreciated', 
     'orange' => 'Our servers are working pretty hard; please donate your computing resources so we can maintain a free service',
     'red' => "Our servers are having a really hard time; please help us by donating your computing resources!"}
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

  def self.get_selected_graph(stats_list)
    raw_stats = self.extract_sorted_stats(stats_list)
    data_list = []
    legend_list = []
    colors_list = []
    max_val = 2000
    stats_list.each do |stat|
      to_add = []
      raw_stats.each do |collection|
        num = collection[stat]
        if num > max_val
          max_val = num
        end
        to_add << num
      end
      data_list << to_add
      legend_list << self.stat_names[stat]
      colors_list << self.stat_colors[stat]
    end
    return Gchart.line(:title => 'Cache Statistics Over Time',
                       :data =>data_list,
                       :size => '800x300',
                       :legend => legend_list,
                       :line_colors => colors_list.join(','),
                       :axis_with_labels => 'x,y',
                       :axis_labels => [['Jan', 'Feb', 'March', 'April', 'May']],
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
          total_hash = CacheStatistic.hash_add(total_hash, to_add, [:log_time])
        end
        total_hash = CacheStatistic.hash_divide(total_hash, sample_rate, [:log_time])
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

end
