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
		it 'should add errors and re-render edit page given invalid disk_space or bandiwdth' do
			@fake_disk_space = "a"
			post :update, {:user=> {:disk_space => @fake_disk_space}, :id => @fake_result.id}
			response.should redirect_to(settings_path)
		end
		it 'should check if old password is correct and password and password_confirmation are filled in but do not match' do
			error_count = @fake_result.errors.count
			post :update, {:user=> {:password => 'aaa', :password_confirmation => 'bbb',:bandwidth => 5, :disk_space => 5}, :id => @fake_result.id, :old_password => @fake_result.password}
			(error_count+1).should == @fake_result.errors.count
			response.should redirect_to(settings_path)
		end
		it 'should check if old password is correct and password and password_confirmation are filled in and match' do
			post :update, {:user=> {:password => 'aaa', :password_confirmation => 'aaa', :bandwidth => 5, :disk_space => 5}, :id => @fake_result.id, :old_password => @fake_result.password}
			response.should redirect_to(settings_path)
		end
		it 'should check if old password is incorrect' do
			bad_password = "xxxxzzz"
			post :update, {:user=> {:password => 'aaa', :password_confirmation => 'aaa'}, :id => @fake_result.id, :old_password => bad_password}
			response.should redirect_to(settings_path)
		end

    it 'should direct to homepage/settings' do
      settings_path.should == '/settings'
    end
  end

  describe 'adding a user'do
		before :each do
			get :new
		end
    it 'should add a user to the database if their information is valid' do
      before = User.count
      post :create, :user => FactoryGirl.build(:user).attributes
      (before+1).should == User.count
    end
		it 'should re-render the new template if their information is valid' do
      User.count.should == 0
			invalid_user = FactoryGirl.build(:user).attributes
			invalid_user[:name] = nil
      post :create, :user => invalid_user
      User.count.should == 0
    end
  end

end
