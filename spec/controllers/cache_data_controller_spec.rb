require 'spec_helper'

describe CacheDataController do
  describe 'getting to the total cache data page' do
    before :each do
      Stats.stub(:total).and_return({})
      get :total_stats
    end
    it 'should select the Total Cache Data template for rendering' do
      response.should render_template('statistics/total')
    end
    it 'should make the necessary data available to the template' do
      assigns(:stats).should == {} #@stats is going to be a hash/array (model will take care of this)
    end
    it 'should direct to a RESTful route' do
      statistics_path.should == '/total_stats' #this is going to change later
    end
  end
end
