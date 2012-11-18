class CoursesController < ApplicationController

  #you should assign:
  #  @courses: should be an array of all course objects
  def index

    @selected_stats = []
    @all_stats = CacheStatistic.all_stats
    @real_stat_names = CacheStatistic.stat_names
    @courses = Course.all
    @graph = CacheStatistic.get_whole_graph

    @user = User.find(1) #TEMPORARY
  end 


end
