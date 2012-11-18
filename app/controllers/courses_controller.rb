class CoursesController < ApplicationController

  #you should assign:
  #  @courses: should be an array of all course objects
  def index

    @courses = Course.all
    @selected_stats = params[:stats] || session[:stats] || {}
    @all_stats = CacheStatistic.all_stats
    @real_stat_names = CacheStatistic.stat_names

    if params[:stats] != session[:stats] and @selected_ratings != {}
      session[:stats] = @selected_stats
      redirect_to :stats => @selected_stats and return
    end

    if @selected_stats == {}
      @graph = CacheStatistic.get_whole_graph and return
    end

    @graph = CacheStatistic.get_selected_graph(@selected_stats.keys)

    @user = User.find(1) #TEMPORARY 
  end

end
