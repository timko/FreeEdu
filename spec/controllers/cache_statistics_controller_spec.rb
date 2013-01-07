require 'spec_helper'

describe CacheStatisticsController do
  describe 'getting to the total cache statistics page' do
    before :each do
      @fake_result = {'data1' => 'data', 'data2' => 'data2'}
      @all_stats = CacheStatistic.all_stats.sort
      CacheStatistic.stub(:all).and_return(@fake_result)
      CacheStatistic.stub(:create_from_file).with('app/assets/server_traffic.log', 10).and_return(nil)
      CacheStatistic.stub(:get_selected_graph).with(@all_stats, 10,20).and_return(nil)
      (1..5).each do |num|
        FactoryGirl.create(:cache_statistic, :log_time => "2012-11-0#{num} 13:44:36", :server_load => num, :num_of_users => 21+num)
      end
      CacheStatistic.all
      get :total_stats
    end
    it 'should select the Total Cache Statistics template for rendering' do
      response.should render_template 'statistics/total'
    end
  end

  describe 'filtering statistics on the graph' do

    before :each do
      @fake_stats = {'server_load' => "1", 'num_of_users' => "1"}
      @fake_selected = ['server_load','num_of_users']
      CacheStatistic.stub(:get_selected_graph).with(@fake_stats.keys.sort, 10, 20).and_return('fake_graph')
      (1..5).each do |num|
        FactoryGirl.create(:cache_statistic, :log_time => "2012-11-0#{num} 13:44:36", :server_load => num, :num_of_users => 21+num)
      end
      get :total_stats, :stats => @fake_stats
    end

    it 'should redirect to the same path but with an updated session' do
      response.should redirect_to total_stats_path(:stats => @fake_stats)
    end

    it 'should call the model method that creates a line graph using only the stats that were checkboxed' do
      CacheStatistic.should_receive(:get_selected_graph).with(@fake_stats.keys.sort, 10, 20)
      get :total_stats, :stats => @fake_stats
    end

    it 'should make the necessary data available to the template' do
      get :total_stats, :stats => @fake_stats
      assigns(:selected_stats).should == @fake_stats
      assigns(:all_stats).should == CacheStatistic.all_stats.sort
      assigns(:real_stat_names).should == CacheStatistic.stat_names
      assigns(:graph).should == 'fake_graph'
    end
  end
end
