require 'spec_helper'

describe CacheDataController do
  describe 'getting to the total cache statistics page' do
    before :each do
      @fake_result = {:data1 => 'data', :data2 => 'data2'}
      Stats.stub(:total).and_return(@fake_result)
      get :total_stats
    end
    it 'should select the Total Cache Statistics template for rendering' do
      response.should render_template 'statistics/total'
    end
    it 'should make the necessary data available to the template' do
      assigns(:stats).should == @fake_result #@stats is going to be a hash/array (model will take care of this)
    end
    it 'should direct to a RESTful route' do
      response.should redirect_to total_cache_statistics_path #this is going to change later
    end
  end
  describe 'extracting each field to the page' do
    it 'should call the model method for finding the field over time' do
      @fake_result = {:field => 'data'}
      Stats.stub(:find_stats).with(:field).and_return(@fake_result)
      Stats.should_receive(:find_stats).with(:field).and_return(@fake_result)
      get :total_stats, :fields => [:field]
    end
    it 'should make field data available to the template' do
      @fake_result = {:field => 'data'}
      Stats.stub(:find_stats).with(:field).and_return(@fake_result)
      get :total_stats, :fields => [:field]
      assigns(:total_stats).should == 'data'
    end
    it 'should return the field data in order of date' do
      #FactoryGirl should create 3 items in the database unordered by date.
      #Simulate a field using :field if possible and then use get and assigns to check correctness
    end
    it 'should return an empty list to the view if there are no valid entries' do
      #FactoryGirl should create 3 items in the database unordered by date.
      #Simulate a field using :field if possible and then use get and assigns to check correctness
    end
  end
end
