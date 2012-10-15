class VideosController < ApplicationController

  def show
    id = params[:id]
    @video = Video.find(id)

  end

  def video_list

  end

  def watch
    
  end

  

end
