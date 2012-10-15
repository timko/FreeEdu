require 'spec_helper'

describe VideosController do

  describe 'viewing a list of videos for a given course' do

    before :each do
      get :index, {:course_id => 1} #will create a factory/feature for this
    end

    it 'select the index template for rendering' do

      response.should render_template('videos/index')

    end
    it 'should make the videos associated with the course available to the template'
    it 'should have a RESTful route '

  end

end
