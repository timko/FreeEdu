class CoursesController < ApplicationController

  #/courses
  #you should assign:
  #  @courses: should be an array of all course objects
  def index
    #Getting updated stats from log file
    #Logs are added to the database then extracted (Already added logs are not re-logged
    CacheStatistic.create_from_file('app/assets/server_traffic.log', 10)
    
    #Showing all courses
    @courses = Course.all
    
    #Getting data for server load bar
    latest_stat = CacheStatistic.order("log_time DESC").limit(1)[0]
    load_to_demand = latest_stat.server_load.to_f/ latest_stat.bandwidth_demand
    @progress_bar_header = "progress progress-"
    
    #Server load percentage
		@load_to_demand_percentage = load_to_demand*100
    
    #Color of server load bar
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
