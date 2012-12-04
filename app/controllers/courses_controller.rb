class CoursesController < ApplicationController

  #you should assign:
  #  @courses: should be an array of all course objects
  def index
    CacheStatistic.create_from_file
    @courses = Course.all
    @graph = CacheStatistic.get_selected_graph(['num_of_users','storage_donated','server_load'])
    latest_stat = CacheStatistic.order("log_time DESC").limit(1)[0]
    load_to_demand = latest_stat.server_load.to_f/ latest_stat.bandwidth_demand
    
    @bar = "bar_good.png"
    @color_alerts = CacheStatistic.color_alerts
    @server_state = 'green'
    if load_to_demand > 0.1
      if load_to_demand <= 0.3
        @server_state = 'yellow'
        @bar = 'bar_ok.png'
      elsif load_to_demand <= 0.6
        @server_state = 'orange'
        @bar = 'bar_not_ok.png'
      else
        @server_state = 'red'
        @bar = 'bar_bad.png'
      end
    end
      
  end

end
