require 'spec_helper'

describe SessionsController do
  describe 'shows settings page if user is logged in' do
    before :each do
      @fake_user = FactoryGirl.build(:user)
      session[:user_id] = @fake_user.id
      get :index
    end
    it 'should redirect to the settings path' do
      response.should redirect_to(settings_path)
    end
  end
  
  describe 'logging in' do
    before :each do
      User.should_receive(:find_by_name)
    end
    it 'has a valid login' do
      valid = FactoryGirl.build(:user)
      valid.save!
      post :create, :user => valid
      response.should redirect_to(settings_path)
    end
    it 'does not have a valid login' do
      User.stub(:find_by_name).and_return(nil)
      post :create, :user => nil
      response.should redirect_to(new_user_path)
    end
  end
  
  describe 'logging out' do
    it 'should redirect to home page' do
      get :destroy
      response.should redirect_to(root_path)
    end
  end
   
    
end