class CacheStatisticsController < ApplicationController

  def total_stats

    @stats = CacheStatistic.all
    render 'statistics/total'

  end


end
