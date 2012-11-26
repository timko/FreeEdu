require 'spec_helper'

describe SessionsController do
  describe 'shows settings page if user is logged in' do
    before :each do
      @fake_user = FactoryGirl.build(:user)
      session[:user_id] = @fake_user.id
      
    end
    it 'should redirect to the settings path' do
      get :index
      response.should redirect_to(settings_path)
    end
  end
  
  describe 'logging in' do
    before :each do
      @valid = FactoryGirl.create(:user)
    end
    it 'has a valid login' do
      post :create, :user => {:name => @valid.name, :password => @valid.password}
      response.should redirect_to(courses_path)
    end
    it 'does not have a valid login' do
      invalid = FactoryGirl.build(:user, :name => 'invalid')
      post :create, :user => invalid.attributes
      response.should redirect_to(auth_path)
    end
  end
  
  describe 'logging out' do
    it 'should redirect to home page' do
      get :destroy
      response.should redirect_to(root_path)
    end
  end
   
    
end