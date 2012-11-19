class CoursesController < ApplicationController

  #you should assign:
  #  @courses: should be an array of all course objects
  def index
    CacheStatistic.create_from_file
    @courses = Course.all
    @graph = CacheStatistic.get_selected_graph(['num_of_users','storage_donated','server_load'])
  end

end
