class CoursesController < ApplicationController

  #you should assign:
  #  @courses: should be an array of all course objects
  def index
    @courses = Course.all
  end 


end
