require 'spec_helper'

describe CoursesController do

  describe 'getting to the FreEdu homepage' do

    before :each do
      @fake_results = [mock('course1'), mock('course2'), mock('course3')]
      get :index
    end

    it 'should select the Courses Index template for rendering' do
      response.should render_template('courses/index')
    end
    it 'should make the courses in the database available to the template' do 
      assigns(:courses).should == Course.all
    end
    it 'should direct to a RESTful route' do
      courses_path.should == '/courses'
    end
  end
end
