require 'spec_helper'

describe VideosController do

  describe 'viewing a list of videos for a given course' do
    

    before :each do
      video = FactoryGirl.build(:video, :name => 'BDD')
      course = FactoryGirl.build(:course, :title => 'SaaS')
      Course.stub(:find).with('1').and_return(course)
      get :index, {:course_id => 1}
    end

    it 'selects the index template for rendering' do
     response.should render_template('videos')
    end
  
    it 'should make the videos associated with the course available to the template' do 
      assigns(:videos).should == Course.find("1").videos
    end
    it 'should have a RESTful route ' do
      course_videos_path.should == '/courses/1/videos'
    end

  end

  describe 'watching a video from a list of videos' do

    before :each do
      course = FactoryGirl.create(:course, :title => 'SaaS', :id => 1)
      @video = FactoryGirl.create(:video, :name => 'BDD', :id => 1, :course_id => 1)
      get :show, :course_id => 1, :id=> 'BDD'
    end

    it 'should select the show template for rendering' do
      response.should render_template('show')
    end

    it 'should make the selected video available to the template' do
      assigns(:video).should == @video
    end

    it 'should have a RESTful route' do
      course_video_path.should == '/courses/1/videos/BDD'
    end

  end

end
