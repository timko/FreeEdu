require 'spec_helper'

describe UsersController do

  describe 'changing the settings' do
    before :each do
      @fake_result = mock('User')
      @fake_result.stub(:disk_space).and_return(512)
      @fake_result.stub(:bandwidth).and_return(160)
      @fake_result.stub(:id).and_return(1)
      User.stub(:find).and_return(@fake_result)
      User.should_receive(:find)
      get :edit, {:id=>@fake_result.id}
    end
    it 'should select the Settings edit template for rendering' do
      response.should render_template('users/edit')
    end
    it 'should make the settings in the database available to the template' do 
      assigns(:user).should == @fake_result
      assigns(:user).disk_space.should == @fake_result.disk_space
      assigns(:user).bandwidth.should == @fake_result.bandwidth
    end
    it 'should direct to homepage/settings' do
      settings_path.should == '/settings/1'
    end
  end
end