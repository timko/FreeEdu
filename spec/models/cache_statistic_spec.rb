require 'spec_helper'

describe CacheStatistic do

=begin
  describe 'extracting a list of dates from the database' do

    before :each do
      (1..5).each do |num|
        FactoryGirl.create(:cache_statistic, :log_time => "2012-11-0#{num} 13:44:36")
      end
    end

    it 'should return the list of dates from the database' do
	CacheStatistic.all.each do |stat|
	  assert CacheStatistic.extract_sorted_stat(:log_time).include? stat.log_time
	end
    end
    it 'should return the data in order of date' do
    
      statistics = CacheStatistic.extract_sorted_stat(:log_time)
      (0..3).each do |num|
        statistics[num]<statistics[num+1]
      end

    end

  end

  describe 'extracting total number of users from the database' do

    before :each do
      (1..5).each do |num|
        FactoryGirl.create(:cache_statistic, :log_time => "2012-11-0#{num} 13:44:36", :num_of_users => num)
      end
      @nums_of_users = CacheStatistic.extract_sorted_stat(:num_of_users)
    end

    it 'should return a list of number of users from the database' do
	CacheStatistic.all.each do |stat|
		@nums_of_users.include? stat.num_of_users
	end
    end

    it 'should return the data in order of date' do
        log_times = CacheStatistic.extract_sorted_stat(:log_time).sort

        (0..4).each do |num|
          assert CacheStatistic.find_by_log_time(log_times[num]).num_of_users == @nums_of_users[num]
        end

    end
  end

  describe 'extracting server load from the database' do

    before :each do
      (1..5).each do |num|
        FactoryGirl.create(:cache_statistic, :log_time => "2012-11-0#{num} 13:44:36", :server_load => num)
      end

      @server_loads = CacheStatistic.extract_sorted_stat(:server_load)
    end

    it 'should return a list of server loads from the database' do

	CacheStatistic.all.each do |stat|
	  assert @server_loads.include? stat.server_load
	end

    end
    it 'should return the data in order of date' do
        log_times = CacheStatistic.extract_sorted_stat(:log_time).sort

        (0..4).each do |num|
          assert CacheStatistic.find_by_log_time(log_times[num]).server_load == @server_loads[num]
        end

    end
  end
=end

  describe 'extracting log_time and num_of_users from the database' do

    before :each do
      (1..5).each do |num|
        FactoryGirl.create(:cache_statistic, :log_time => "2012-11-0#{num} 13:44:36", :server_load => num, :num_of_users => 21+num)
      end

      @times_and_users = CacheStatistic.extract_sorted_stats([:log_time, :num_of_users])
    end

    it 'should return a list of log times and numbers of users from the database' do
	(0...CacheStatistic.all.length).each do |num|
	  assert @times_and_users[num].include?(:log_time) and @times_and_users[num].include?(:num_of_users)
	end

    end
    it 'should return the data in order of date' do
        (0...CacheStatistic.all.length-1).each do |num|
          cur_record = @times_and_users[num]
          next_record = @times_and_users[num+1]
          assert cur_record[:log_time] > next_record[:log_time];
        end

    end 
  end

  describe 'loading the log file into the database' do
    it 'should create records from a list' do
      @fake_list = ["2012-11-04 17:35:11 913 1739.02369435 302 313.185496733 1178.55616739 1096.46895932 642.55473503"]
      @fake_hash = {:log_time => "2012-11-04 17:35:11", :num_of_users => 913, :bandwidth_demand => 1739.02369435, :num_of_caches => 302, :storage_donated => 313.185496733, :bandwidth_donated => 1178.55616739, :bandwidth_effectively_used => 1096.46895932, :server_load => 642.55473503}
      IO.stub(:readlines).with(@fake_file).and_return(@fake_list)
      File.stub(:open).with(:filename).and_return(@fake_file)
      @fake_list.each do |fake_item|
        CacheStatistic.stub(:parse).with(fake_item).and_return(@fake_hash)
      end
      CacheStatistic.create_from_file(:filename)
      assert(CacheStatistic.all.length == 1, "This is the actual length: #{CacheStatistic.all.length}")
    end 
  end

  describe 'parsing a log file correctly to add to the database' do 
    it 'should parse a string a hash of seperate attributes of the record' do
      @fake_input = "2012-11-04 17:35:11 913 1739.02369435 302 313.185496733 1178.55616739 1096.46895932 642.55473503"
      CacheStatistic.parse(@fake_input).should == {:log_time => "2012-11-04 17:35:11", :num_of_users => 913, :bandwidth_demand => 1739.02369435, :num_of_caches => 302, :storage_donated => 313.185496733, :bandwidth_donated => 1178.55616739, :bandwidth_effectively_used => 1096.46895932, :server_load => 642.55473503}
    end
  end

  describe 'converting cache statistics database into a graph' do

    before :each do
      @fake_list = ['num_of_users','server_load']
      @fake_collection = [{'num_of_users'=> 22, 'server_load'=>1},{'num_of_users'=> 23, 'server_load'=>2},{'num_of_users'=> 24, 'server_load'=>3},{'num_of_users'=> 25, 'server_load'=>4},{'num_of_users'=> 26, 'server_load'=>5}]
      (1..5).each do |num|
        FactoryGirl.create(:cache_statistic, :log_time => "2012-11-0#{num} 13:44:36", :server_load => num, :num_of_users => 21+num)
      end
#      @result_graph = CacheStatistic.get_selected_graph(@fake_list, 1)
    end

    it 'should call the CacheStatistic method that returns select stats in order of their log times' do
#      CacheStatistic.should_receive(:extract_sorted_stats).with(@fake_list, CacheStatistic.count).and_return(@fake_collection)
      CacheStatistic.get_selected_graph(@fake_list, CacheStatistic.count)
    end

    it 'should call the Gchart method that turns data into a graph' do
#      CacheStatistic.stub(:extract_sorted_stats).with(@fake_list, 5).and_return(@fake_collection)
      Gchart.should_receive(:line)
      CacheStatistic.get_selected_graph(@fake_list, CacheStatistic.count)
    end

  end
end
