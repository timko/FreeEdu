class CacheStatisticsController < ApplicationController

  def total_stats
    CacheStatistic.create_from_file
    @stats = CacheStatistic.all

    @selected_stats = params[:stats] || session[:stats] || {}
    @all_stats = CacheStatistic.all_stats
    @real_stat_names = CacheStatistic.stat_names

    if params[:stats] != session[:stats] and @selected_ratings != {}
      session[:stats] = @selected_stats
      redirect_to :stats => @selected_stats and return
    elsif @selected_stats == {}
      @graph = CacheStatistic.get_selected_graph(@all_stats)
    else
      @graph = CacheStatistic.get_selected_graph(@selected_stats.keys)
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
