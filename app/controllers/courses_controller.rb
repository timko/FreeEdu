class CoursesController < ApplicationController

  #you should assign:
  #  @courses: should be an array of all course objects
  def index
    @courses = Course.all
    @graph = Gchart.line(:data => [[0, 40, 10, 70, 20]])
    @user = User.find(1) #TEMPORARY
  end 


end
