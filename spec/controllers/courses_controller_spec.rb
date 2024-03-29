require 'spec_helper'

describe CoursesController do

  describe 'getting to the FreEdu homepage' do

    before :each do
      @fake_results = [mock('course1'), mock('course2'), mock('course3')]
      @fake_user = mock('User')
      @fake_user.stub(:name).and_return('Ham')
      @fake_user.stub(:password).and_return('yyy')
      Course.stub(:all).and_return @fake_results
      Course.should_receive :all
      User.stub(:find).and_return @fake_user
      get :index
    end
    it 'should select the Courses Index template for rendering' do
      response.should render_template 'courses/index'
    end
    it 'should make the courses in the database available to the template' do 
      assigns(:courses).should == @fake_results
    end
    it 'should direct to a RESTful route' do
      '/courses'.should == courses_path
    end
  end
end
