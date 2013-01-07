class VideosController < ApplicationController

  #/courses/:course_id/videos/:video_name
  def show
    id = params[:id].gsub('_', ' ')
    @course = Course.find(params[:course_id])
    @video = @course.videos.find_by_name(id)
    @related_videos = @course.videos.all
    @related_videos.delete(@video)
  end

  #/courses/:course_id/videos
  def index
    @course = Course.find(params[:course_id])
    @videos = @course.videos.all
  end
end