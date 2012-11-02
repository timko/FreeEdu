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
    it 'should call the model method for finding the field over time'
    it 'should make field data available to the template'
    it 'should return the field data in order of date'
    it 'should return an empty list if there is no data'
  end
end
