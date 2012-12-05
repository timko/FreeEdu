class CacheStatisticsController < ApplicationController

  def total_stats
    CacheStatistic.create_from_file('app/assets/server_traffic.log', 10)
    @stats = CacheStatistic.get_n_latest_records(20)
    @stats.sort_by! { |stat| stat.log_time}.reverse!
    @stat_descriptions = CacheStatistic.stat_descriptions

    @selected_stats = params[:stats] || session[:stats] || {}
    @all_stats = CacheStatistic.all_stats.sort
    @real_stat_names = CacheStatistic.stat_names

    if params[:stats] != session[:stats] and @selected_ratings != {}
      session[:stats] = @selected_stats
      redirect_to :stats => @selected_stats and return
    elsif @selected_stats == {}
      @selected_stat_names = @all_stats
      @graph = CacheStatistic.get_selected_graph(@all_stats, 10, 20)
      @selected_stat_names.delete('log_time')
    else
      @selected_stat_names = @selected_stats.keys.sort
      @graph = CacheStatistic.get_selected_graph(@selected_stat_names, 10, 20)
      @selected_stat_names.delete('log_time')
    end
    render 'statistics/total'
  end

  def field_stats
    @stats = CacheStatistic.extract_sorted_stats(params[:fields])
    if @stats == []
      flash[:notice] = "You didn't specify any fields"
      redirect_to '/' and return
    end
    render 'statistics/fields'
  end

end
