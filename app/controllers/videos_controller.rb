class VideosController < ApplicationController

  def show
    id = params[:id].gsub('_', ' ')
    @course = Course.find(params[:course_id])
    @video = @course.videos.find_by_name(id)
    @related_videos = @course.videos.all
    @related_videos.delete(@video)
  end

  def index
    @course = Course.find(params[:course_id])
    @videos = @course.videos.all
  end
end
