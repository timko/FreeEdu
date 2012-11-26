require 'spec_helper'

describe UsersController do
  describe 'changing the settings' do
    before :each do
      @fake_result = FactoryGirl.create(:user)
      User.stub(:find).and_return(@fake_result)
      User.should_receive(:find)
      session[:user_id] = @fake_result.id
      get :edit
    end
    it 'should select the Users edit template for rendering' do
      response.should render_template('users/edit')
    end
    it 'should make the settings in the database available to the template' do 
      assigns(:user).should == @fake_result
      assigns(:user).disk_space.should == @fake_result.disk_space
      assigns(:user).bandwidth.should == @fake_result.bandwidth
    end
    it 'should update the settings' do
      @fake_disk_space = 5
      @fake_bandwidth = 5
      post :update, {:user=> {:disk_space => @fake_disk_space, :bandwidth => @fake_bandwidth}, :id => @fake_result.id}
      assigns(:user).disk_space.should == @fake_disk_space
      assigns(:user).bandwidth.should == @fake_bandwidth
    end
    it 'should direct to homepage/settings' do
      settings_path.should == '/settings'
    end
  end

  describe 'adding a user'do
    it 'should add a user to the database' do
      before = User.count
      post :create, :user => FactoryGirl.build(:user).attributes
      (before+1).should == User.count
    end
  end

end
