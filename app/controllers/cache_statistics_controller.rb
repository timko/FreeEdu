class CacheStatisticsController < ApplicationController

  #/statistics/total
  def total_stats
    #Getting updated stats from log file
    #Logs are added to the database then extracted (Already added logs are not re-logged
    CacheStatistic.create_from_file('app/assets/server_traffic.log', 10)
    @stats = CacheStatistic.get_n_latest_records(20)
    @stats.sort_by! { |stat| stat.log_time}.reverse!
    @stat_descriptions = CacheStatistic.stat_descriptions

    #Selecting the wanted stats
    @selected_stats = params[:stats] || session[:stats] || {}
    @all_stats = CacheStatistic.all_stats.sort
    @real_stat_names = CacheStatistic.stat_names

    #RESTful reinforcement
    if params[:stats] != session[:stats] and @selected_ratings != {}
      session[:stats] = @selected_stats
      redirect_to :stats => @selected_stats and return
    #If no stats are selected, pretend that all of them are selected.
    elsif @selected_stats == {}
      @selected_stat_names = @all_stats
      @graph = CacheStatistic.get_selected_graph(@all_stats, 10, 20)
      @selected_stat_names.delete('log_time')
    #Normal case, sort the selected stats and output them
    else
      @selected_stat_names = @selected_stats.keys.sort
      @graph = CacheStatistic.get_selected_graph(@selected_stat_names, 10, 20)
      @selected_stat_names.delete('log_time')
    end
    render 'statistics/total'
  end

end
