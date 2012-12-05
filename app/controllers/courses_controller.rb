class CoursesController < ApplicationController

  #you should assign:
  #  @courses: should be an array of all course objects
  def index
    CacheStatistic.create_from_file('app/assets/server_traffic.log', 10)
    @courses = Course.all
    @graph = CacheStatistic.get_selected_graph(['num_of_users','storage_donated','server_load'])
    latest_stat = CacheStatistic.order("log_time DESC").limit(1)[0]
    load_to_demand = latest_stat.server_load.to_f/ latest_stat.bandwidth_demand
    @progress_bar_type = "progress progress-"
		@load_to_demand_percentage = load_to_demand*100
    
    if load_to_demand <= 0.1
      @server_alert = CacheStatistic.color_alerts['green']
      @progress_bar_type += "info"
    elsif load_to_demand <= 0.3
      @server_alert = CacheStatistic.color_alerts['yellow']
      @progress_bar_type += "success"
    elsif load_to_demand <= 0.6
      @server_alert = CacheStatistic.color_alerts['orange']
      @progress_bar_type += "warning"
    else
      @server_alert = CacheStatistic.color_alerts['red']
      @progress_bar_type += "danger"
    end
  end
end
