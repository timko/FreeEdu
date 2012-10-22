class VideosController < ApplicationController

  def show
    id = params[:id]
    @course = Course.find(params[:course_id])
    @video = @course.videos.find(id)

  end

  def index
    @course = Course.find(params[:course_id])
    @videos = @course.videos.all
  end
  
  

end
