require 'spec_helper'

describe CacheStatistic do

  describe 'extracting a list of dates from the database' do

    it 'should return an empty list if there is nothing in the database' do
      assert CacheStatistic.extract_sorted_stats(:log_time) == []
    end

    before :each do
      range(1..5).each do |num|
        FactoryGirl.build(:cache_statistic, :log_time => "2012-11-0#{num} 13:44:36")
      end
    end

    it 'should return the list of dates from the database' do
	CacheStatistics.all.each do |stat|
	  assert CacheStatistic.extract_sorted_stats(:log_time).include? stat.log_time
	end
    end
    it 'should return the data in order of date' do
    
      statistics = CacheStatistic.extract_sorted_stats(:log_time)
      range(0..3).each do |num|
        statistics[num]<statistics[num+1]
      end

    end

  end

  describe 'extracting total number of users from the database' do
    it 'should return an empty list if there is nothing in the database' do
      assert CacheStatistic.extract_sorted_stats(:num_of_users) == []
    end

    before :each do
      range(1..5).each do |num|
        FactoryGirl.build(:cache_statistic, :log_time => "2012-11-0#{num} 13:44:36", :num_of_users => num)
      end
      nums_of_users = CacheStatistic.extract_sorted_stats(:num_of_users)
    end

    it 'should return a list of number of users from the database' do
	CacheStatistics.all.each do |stat|
		nums_of_users.include? stat.num_of_users
	end
    end

    it 'should return the data in order of date' do
        log_times = CacheStatistic.select(:log_time).sort

        range(0..4).each do |num|
          assert CacheStatistic.find_by_log_time(log_times[num]).num_of_users == nums_of_users[num]
        end

    end
  end

  describe 'extracting server load from the database' do
    it 'should return an empty list if there is nothing in the database' do
      assert CacheStatistic.extract_sorted_stats(:server_load) == []
    end

    before :each do
      range(1..5).each do |num|
        FactoryGirl.build(:cache_statistic, :log_time => "2012-11-0#{num} 13:44:36", :server_load => num)
      end

      server_loads = CacheStatistic.extract_sorted_stats(:server_load)
    end

    it 'should return a list of number of users from the database' do

	CacheStatistics.all.each do |stat|
	  assert server_loads.include? stat.server_load
	end

    end
    it 'should return the data in order of date' do
        log_times = CacheStatistic.select(:log_time).sort

        range(0..4).each do |num|
          assert CacheStatistic.find_by_log_time(log_times[num]).server_load == server_loads[num]
        end

    end
  end

  describe 'extracting server load over number of users from the database' do
    it 'should return an empty list if there is nothing in the database' do
      assert CacheStatistic.extract_sorted_avg_load == []
    end

    before :each do
      range(1..5).each do |num|
        FactoryGirl.build(:cache_statistic, :log_time => "2012-11-0#{num} 13:44:36", :server_load => num, :num_of_users => 21+num)
      end

      avg_loads = CacheStatistic.extract_sorted_avg_load
    end

    it 'should return a list of number of users from the database' do

	CacheStatistics.all.each do |stat|
	  assert avg_loads.include? stat.server_load/users
	end

    end
    it 'should return the data in order of date' do
        log_times = CacheStatistic.select(:log_time).sort

        range(0..4).each do |num|
          cur_record = CacheStatistic.find_by_log_time(log_times[num])
          assert cur_record.serverload/cur_record.num_of_users == server_loads[num]
        end

    end
  end

  describe 'extracting log_time and num_of_users from the database' do
    it 'should return an empty list if there is nothing in the database' do
      assert CacheStatistic.extract_sorted_stats([:log_time, :num_of_users]) == []
    end

    before :each do
      range(1..5).each do |num|
        FactoryGirl.build(:cache_statistic, :log_time => "2012-11-0#{num} 13:44:36", :server_load => num, :num_of_users => 21+num)
      end

      times_and_users = CacheStatistic.extract_sorted_stats([:log_time, :num_of_users])
    end

    it 'should return a list of log times and numbers of users from the database' do

	CacheStatistics.all.each do |stat|
	  assert times_and_users[:log_time].include? stat.log_time and times_and_users[:num_of_users].include? stat.num_of_users
	end

    end
    it 'should return the data in order of date' do
        log_times = CacheStatistic.select(:log_time).sort

        range(0..4).each do |num|
          cur_record = CacheStatistic.find_by_log_time(log_times[num])
          assert cur_record.log_time == times_and_users[:log_time][num] and cur_record.num_of_users == times_and_users[:num_of_users][num]
        end

    end
  end

end
